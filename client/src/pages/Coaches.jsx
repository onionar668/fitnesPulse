import axios from "axios"
import { useEffect, useState } from "react"
import { Calendar, MapPin, MessageSquarePlus, Star } from 'lucide-react'

function Coaches() {
    const [coaches, setCoaches] = useState([])

    useEffect(() => {
        const fetchCoaches = async() => {
            const response = await axios.get('http://localhost:8000/api/v1/coaches')
            setCoaches(response.data.data)
        }

        fetchCoaches()
    }, [])
  return (
    <div className="w-[90%] mx-auto mt-20">
      <p className="text-blue-600 font-bold text-xl">Команда наставников 8 специалистов</p>
      <h1 className="font-bold text-4xl">Персональные тренеры сети AURA</h1>
      <p className="text-slate-500">Мастера спорта, дипломированные реабилитологи и тренеры международного уровня. Запишитесь на удобный день и время.</p>
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mt-10">
            {coaches.map(trainer => (
              <div
                key={trainer.id}
                className="bg-white rounded-3xl border border-slate-200 overflow-hidden shadow-xs hover:shadow-md transition-all flex flex-col justify-between"
              >
                <div>
                  <div className="p-6 pb-4 flex items-start gap-4">
                    {trainer.avatar ? (
                         <img
                      src={`http://localhost:8000/storage/${trainer.avatar}`}
                      alt={trainer.name}
                      className="w-20 h-20 rounded-2xl object-cover border border-slate-200 shrink-0 shadow-2xs"
                      referrerPolicy="no-referrer"
                    />
                    ) : (
                        <div className="rounded-full bg-blue-500 text-white p-4">{trainer.name.charAt(0)}</div>
                    )}
                   
                    <div className="space-y-1">
                      <div className="flex items-center gap-1 text-xs font-bold text-amber-600">
                        <Star className="w-3.5 h-3.5 fill-amber-500 text-amber-500" />
                        <span className="tabular-nums">{trainer.rating || 0}</span>
                        <span className="text-slate-400 font-normal">({trainer.reviewCount} отзывов)</span>
                      </div>
                      <h3 className="text-lg font-bold text-slate-900 leading-snug">
                        {trainer.name}
                      </h3>
                      <p className="text-xs font-semibold text-blue-600">
                        {trainer.specialization}
                      </p>
                    </div>
                  </div>

                  <div className="px-6 py-2 bg-slate-50 border-y border-slate-100 flex items-center justify-between text-xs text-slate-600">
                    <span className="flex items-center gap-1 font-medium">
                      <MapPin className="w-3 h-3 text-blue-600" />
                      {trainer.gym}
                    </span>
                  </div>

                  <div className="p-6 space-y-4">
                    <p className="text-xs text-slate-600 leading-relaxed">
                      {trainer.bio}
                    </p>
                  </div>
                </div>

                <div className="p-6 pt-4 border-t border-slate-100 bg-white flex items-center justify-between gap-3">
                  <div>
                    <div className="text-[10px] text-slate-400 font-medium">Сессия 60 мин</div>
                    <div className="text-lg font-extrabold text-slate-900 tabular-nums">
                      {trainer.price.toLocaleString('ru-RU')} ₸
                    </div>
                  </div>

                  <div className="flex items-center gap-2">
                    <button
                      className="p-2.5 text-slate-500 hover:text-blue-600 hover:bg-slate-100 rounded-xl transi  tion-colors border border-slate-200"
                      title="Оставить отзыв о тренере"
                    >
                      <MessageSquarePlus className="w-4 h-4" />
                    </button>
                    <button
                      className="px-5 py-2.5 bg-blue-600 hover:bg-blue-700 text-white font-bold text-xs rounded-xl transition-colors shadow-xs flex items-center gap-1.5"
                    >
                      <Calendar className="w-3.5 h-3.5" />
                      <span>Записаться</span>
                    </button>
                  </div>
                </div>

              </div>
            ))}
          </div>
    </div>
  )
}

export default Coaches
