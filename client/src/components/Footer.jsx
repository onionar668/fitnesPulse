import axios from "axios"
import { Clock, Mail, MapPin, Phone } from "lucide-react"
import { useEffect, useState } from "react"

function Footer() {
    const [regions, setRegions] = useState([])

    useEffect(() => {
        const fetchData = async() => {
            const response = await axios.get('http://localhost:8000/api/v1/regions')
            setRegions(response.data.data)
        }

        fetchData()
    }, [])
  return (
    <footer className="bg-white border-t border-slate-200 pt-16 pb-12 text-slate-600">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 space-y-12">
        
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-8">
          
          <div className="lg:col-span-2 space-y-4">
            <div className="flex items-center gap-2">
              <div className="w-8 h-8 rounded-lg bg-blue-600 flex items-center justify-center text-white font-black text-base shadow-xs">
                P
              </div>
              <span className="text-lg font-extrabold tracking-tight text-slate-900">
                FitnesPulse
              </span>
            </div>
            <p className="text-xs text-slate-500 leading-relaxed max-w-sm">
              Федеральная сеть премиальных фитнес-клубов с онлайн-записью к тренерам, расписанием групповых программ и мобильным доступом по QR-пропуску.
            </p>
            <div className="text-xs text-slate-600 space-y-1 pt-1">
              <div className="flex items-center gap-2">
                <Phone className="w-3.5 h-3.5 text-blue-600" />
                <a href="tel:+78007770022" className="hover:text-blue-600 font-semibold">
                  8 (777) 777-00-00
                </a>
                <span className="text-[10px] text-slate-400">(Бесплатно по РК)</span>
              </div>
              <div className="flex items-center gap-2">
                <Mail className="w-3.5 h-3.5 text-blue-600" />
                <span>support@pulse-fitness.ru</span>
              </div>
            </div>
          </div>

          <div className="space-y-3">
            <div className="text-xs font-bold text-slate-900 uppercase tracking-wider">
              Навигация
            </div>
            <ul className="text-xs space-y-2">
              <li>
                <button  className="hover:text-blue-600 transition-colors">
                  Список залов сети
                </button>
              </li>
              <li>
                <button className="hover:text-blue-600 transition-colors">
                  Персональные тренеры
                </button>
              </li>
              <li>
                <button  className="hover:text-blue-600 transition-colors">
                  Расписание тренировок
                </button>
              </li>
              <li>
                <button className="hover:text-blue-600 transition-colors">
                  Тарифы и абонементы
                </button>
              </li>
              <li>
                <button  className="hover:text-blue-600 transition-colors">
                  Отзывы резидентов
                </button>
              </li>
            </ul>
          </div>

          <div className="space-y-3">
            <div className="text-xs font-bold text-slate-900 uppercase tracking-wider">
              Города присутствия
            </div>
            <ul className="text-xs space-y-2">
              {regions.slice(0,5).map(city => (
                <li key={city.id}>
                  <button
                    className="hover:text-blue-600 transition-colors flex items-center gap-1.5"
                  >
                    <MapPin className="w-3 h-3 text-blue-500" />
                    <span>{city.name}</span>
                  </button>
                </li>
              ))}
            </ul>
          </div>

          <div className="space-y-3">
            <div className="text-xs font-bold text-slate-900 uppercase tracking-wider">
              Режим работы
            </div>
            <div className="text-xs text-slate-500 space-y-1.5">
              <div className="flex items-start gap-1.5">
                <Clock className="w-3.5 h-3.5 text-blue-600 shrink-0 mt-0.5" />
                <div>
                  <div className="text-slate-800 font-medium">Будние дни: 06:30 — 23:30</div>
                  <div>Выходные: 08:00 — 22:30</div>
                </div>
              </div>
              <p className="text-[11px] text-slate-400 pt-2">
                Зоны бассейнов закрываются за 30 минут до закрытия клуба.
              </p>
            </div>
          </div>

        </div>

        <div className="pt-8 border-t border-slate-100 flex flex-col sm:flex-row items-center justify-between gap-4 text-[11px] text-slate-400">
          <div>
            © {new Date().getFullYear()} FitnesPulse FITNESS. Все права защищены. Современный фитнес в России.
          </div>
          <div className="flex items-center gap-6">
            <a href="#terms" onClick={(e) => e.preventDefault()} className="hover:text-slate-600">
              Правила посещения
            </a>
            <a href="#privacy" onClick={(e) => e.preventDefault()} className="hover:text-slate-600">
              Политика конфиденциальности
            </a>
            <a href="#offer" onClick={(e) => e.preventDefault()} className="hover:text-slate-600">
              Публичная оферта
            </a>
          </div>
        </div>

      </div>
    </footer>
  )
}

export default Footer
