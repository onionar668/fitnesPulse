import axios from 'axios';
import { MessageSquarePlus, Star, X } from 'lucide-react'
import { useState } from 'react';

function ReviewModal({isOpen , setIsOpen, gymId}) {
    
    const [description, setDescription] = useState('')
    const [rating, setRating] = useState(5)
    const [error, setError] = useState('')
    const [hoverRating, setHoverRating] = useState(0)

    if(!isOpen) return null

    const handleSubmit = async(e) => {
        e.preventDefault()
        setError('')
        try{
            const token = localStorage.getItem('token')
            await axios.post(`http://localhost:8000/api/v1/review/${gymId}`, {description, rating}, {headers: {Authorization: `Bearer ${token}`}})
            setIsOpen(false)
            setDescription('')
            setRating(5)
            window.location.reload()
        }catch(err){
            console.log(err.response.data)
            setError(err.response?.data?.message)
        }
    }
  return (
   <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-slate-950/60 backdrop-blur-xs animate-in fade-in">
      <div className="bg-white rounded-3xl max-w-lg w-full p-6 sm:p-8 border border-slate-200 shadow-2xl relative max-h-[90vh] overflow-y-auto">
        
        <button
          onClick={() => setIsOpen(false)}
          className="absolute top-5 right-5 text-slate-400 hover:text-slate-700 p-1 rounded-lg"
          aria-label="Закрыть"
        >
          <X className="w-5 h-5" />
        </button>

        <div className="space-y-1 mb-5">
          <span className="text-[10px] font-bold text-blue-600 uppercase tracking-wider">
            Обратная связь
          </span>
          <h2 className="text-xl sm:text-2xl font-extrabold text-slate-900 tracking-tight">
            Оставить отзыв
          </h2>
        </div>

        {error && (
          <div className="mb-4 p-3 bg-red-50 border border-red-200 text-red-600 text-xs rounded-xl font-medium">
            {error}
          </div>
        )}

        <form onSubmit={handleSubmit} className="space-y-5">
          <div className="space-y-2 text-center p-4 bg-slate-50 rounded-2xl border border-slate-200/80">
            <div className="text-xs font-bold text-slate-700">Ваша общая оценка:</div>
            <div className="flex items-center justify-center gap-2">
              {[1, 2, 3, 4, 5].map((star) => {
                const isFilled = (hoverRating || rating) >= star;
                return (
                  <button
                    key={star}
                    type="button"
                    onClick={() => setRating(star)}
                    onMouseEnter={() => setHoverRating(star)}
                    className="p-1 text-slate-300 hover:scale-115 transition-all focus:outline-none"
                    aria-label={`Оценка ${star} из 5`}
                  >
                    <Star
                      className={`w-7 h-7 transition-colors' ${
                        isFilled ? 'fill-amber-400 text-amber-400' : 'text-slate-300'
                      }'`}
                    />
                  </button>
                );
              })}
            </div>
            <div className="text-xs font-bold text-amber-700">
              {rating === 5
                ? '5.0 — Превосходно!'
                : rating === 4
                ? '4.0 — Очень хорошо'
                : rating === 3
                ? '3.0 — Нормально'
                : 'Требует улучшений'}
            </div>
          </div>

          <div className="space-y-1">
            <label className="text-xs font-bold text-slate-700">Текст вашего отзыва:</label>
            <textarea
              required
              rows={4}
              value={description}
              onChange={(e) => setDescription(e.target.value)}
              placeholder="Расскажите о впечатлениях: атмосфера в зале, чистота, профессионализм тренера, оборудование..."
              className="w-full px-3.5 py-2.5 text-xs rounded-xl border border-slate-200 bg-slate-50 focus:bg-white focus:outline-none focus:ring-2 focus:ring-blue-600"
            />
          </div>
          <div className="pt-4 border-t border-slate-100 flex items-center justify-end gap-3">
            <button
              type="button"
              onClick={() => setIsOpen(false)}
              className="px-4 py-2.5 text-xs font-semibold text-slate-600 hover:bg-slate-100 rounded-xl"
            >
              Отмена
            </button>
            <button
              type="submit"
              className="px-6 py-2.5 bg-blue-600 hover:bg-blue-700 text-white font-bold text-xs rounded-xl transition-colors shadow-sm flex items-center gap-1.5"
            >
              <MessageSquarePlus className="w-4 h-4" />
              <span>Опубликовать отзыв</span>
            </button>
          </div>

        </form>

      </div>
    </div>
  )
}

export default ReviewModal
