import axios from "axios";
import {
  ArrowLeft,
  CheckCircleIcon,
  Clock,
  Dumbbell,
  MapPin,
  MessageSquarePlus,
  Star,
  Wallet,
} from "lucide-react";
import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import ReviewModal from "../components/ReviewModal";
import toast from "react-hot-toast";

function DetailInfo() {
  const { id } = useParams();
  const navigate = useNavigate();
  const [gym, setGym] = useState(null);
  const [isOpen, setIsOpen] = useState(false)

  const handleBooking = async(scheduleId) => {
    try{
      const token = localStorage.getItem('token')
      await axios.post('http://localhost:8000/api/v1/booking', {
        schedule_id: scheduleId
      }, {headers: {Authorization: `Bearer ${token}`}})

      toast.success('Вы успешно записались на тренировку')
    }catch(err){
      const errorMessage = err.response?.data?.message
      if(errorMessage.includes('you already booked')){
        toast.error('Вы уже записаны на тренировку')
      }
    }
  }
  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get(
          `http://localhost:8000/api/v1/gym/${id}`,
        );
        setGym(response.data.data);
      } catch (err) {
        console.log(err);
      }
    };
    fetchData();
  }, []);
  return (
    <section className="bg-slate-100 w-full h-full">
      <div className="w-300 mx-auto pt-20">
        <div className="flex justify-between">
          <button
            onClick={() => navigate("/")}
            className="cursor-pointer flex items-center"
          >
            <ArrowLeft className="h-4 w-4" />
            Back
          </button>
          <p className="text-blue-500">
            Club:{" "}
            <span className="bg-slate-200 p-2 rounded-xl border border-slate-400 text-black">
              {gym?.region} • {gym?.name}
            </span>
          </p>
        </div>

        <div className="w-full flex justify-between items-center p-4 mt-10 bg-white rounded-2xl border border-slate-400">
          <img
            className="w-[50%] h-full object-contain rounded-2xl"
            src={`http://localhost:8000/storage/${gym?.image_url}`}
            alt=""
          />
          <div className="flex flex-col items-start gap-4">
            <div className="flex justify-between w-[90%]">
              <p className="bg-blue-300 text-blue-700 font-medium rounded-xl py-1 px-4">
                {gym?.region}
              </p>
              <div className="flex gap-1 items-center bg-yellow-200 border border-amber-300 px-5 rounded-xl">
                <Star className="w-2 h-2 fill-amber-600 text-amber-600" />
                <p className="text-amber-600 text-[12px]">{gym?.avgRating}</p>
                <p className="text-orange-500 text-[12px]">
                  ({gym?.reviews.length} reviews)
                </p>
              </div>
            </div>
            <h2 className="text-4xl font-bold">{gym?.name}</h2>
            <p className="flex items-center gap-4">
              <MapPin className="w-5 h-5 text-blue-500" /> {gym?.address}
            </p>
            <p className="flex items-center gap-4">
              <Clock className="w-5 h-5 text-blue-500" /> 10:00
            </p>
            <hr />
            <p>{gym?.description}</p>
            <hr />
            <div className="flex flex-col gap-2 w-[90%]">
              <button className="bg-blue-600 text-white rounded-xl py-2 cursor-pointer w-full flex gap-2 items-center justify-center">
                <Wallet />
                Buy club card
              </button>
              <button onClick={() => setIsOpen(true)} className="bg-slate-200 rounded-xl py-2 cursor-pointer">
                Reviews for club
              </button>
            </div>
          </div>
        </div>

        <div className="mt-20">
          <p className="flex gap-2 text-xl items-center font-bold">
            <Dumbbell className="text-blue-500" />
            Gym infrastructure
          </p>
          <div className="grid grid-cols-2 mt-5 gap-4">
            {gym?.infrastructure.map((el, index) => (
              <div key={index} className="flex gap-2 items-center">
                <CheckCircleIcon className="text-blue-500" />
                <p className="text-lg">{el}</p>
              </div>
            ))}
          </div>
        </div>

        <div className="mt-20">
          <p className="text-blue-600 font-bold">Тренерский штаб</p>
          <div className="flex justify-between">
            <h2 className="text-2xl font-bold">Тренеры клуба {gym?.name}</h2>
            <span className="text-slate-600">
              {gym?.coaches.length} coaches in club
            </span>
          </div>
          <div className="flex flex-wrap gap-5 mt-10 mb-10">
            {gym?.coaches.map((el) => (
              <div key={el.id} className="flex flex-col gap-2 w-100">
                <div className="flex gap-2 items-center justify-between">
                  <img
                    src={
                      el.avatar
                        ? `http://localhost:8000/storage/${el.avatar}`
                        : "/none.jpg"
                    }
                    alt="avatar"
                    className="w-30 object-contain rounded-xl"
                  />
                  <div className="flex flex-col gap-2">
                    <p className="text-yellow-500 flex gap-1 text-xl items-center">
                      <Star className="text-yellow-500 fill-yellow-500" />{" "}
                      {el.avgRating || 0}{" "}
                      <span className="text-slate-500">
                        ({el.reviewCount || 0})
                      </span>
                    </p>
                    <p className="text-2xl font-bold">{el.user}</p>
                    <p className="text-blue-500 text-sm">{el.specialization}</p>
                  </div>
                </div>
                <p className="text-slate-500">{el.bio}</p>
                <div className="flex justify-between mt-5">
                  <p className="flex flex-col items-start text-slate-500 text-[10px]">
                    Тренировка от{" "}
                    <span className="text-black text-xl font-bold">
                      {el.price} ₸
                    </span>
                  </p>
                  <div className="flex gap-2 items-center">
                    <button className="cursor-pointer">
                      <MessageSquarePlus />
                    </button>
                    <button className="bg-blue-600 rounded-lg cursor-pointer px-4 py-1 text-white font-bold">
                      Sign up
                    </button>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
        <div className="mt-20">
          <p className="text-blue-600 font-bold">Тарифы и абонементы</p>
          <div className="flex justify-between">
            <h2 className="text-2xl font-bold">
              Клубные карты для {gym?.name}
            </h2>
            <span className="text-slate-600">
              Мгновенное открытие доступа в мобильном кабинете
            </span>
          </div>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 pt-2 mt-10">
            {gym?.subscirpions?.map((el) => (
              <div
                key={el.id}
                className={`p-6 rounded-2xl border flex flex-col justify-between space-y-4 transition-all border-blue-600 ring-2 ring-blue-600/10 bg-blue-50/20`}
              >
                <div className="space-y-3">
                  <h3 className="text-lg font-bold text-slate-900">
                    {el.name}
                  </h3>

                  <div className="pt-2">
                    <div className="text-2xl font-extrabold text-slate-900 tabular-nums">
                      {el.price.toLocaleString("ru-RU")} ₸
                    </div>
                  </div>
                </div>

                <button
                  className={`w-full py-2.5 text-xs font-bold rounded-xl transition-colors bg-slate-900 hover:bg-slate-800 text-white`}
                >
                  Оформить карту
                </button>
              </div>
            ))}
          </div>
        </div>
        <div className="mt-20">
          <p className="text-blue-600 font-bold">Групповые занятия</p>
          <div className="flex justify-between">
            <h2 className="text-2xl font-bold">
              Расписание тренировок в зале {gym?.name}
            </h2>
            <span className="text-slate-600">Смотреть всё расписание →</span>
          </div>
          <div className="grid grid-cols-2 gap-6 pt-2 mt-10">
            {gym?.schedules.map((el) => (
              <div
                key={el.id}
                className="p-4 rounded-2xl bg-slate-50 border border-slate-200 flex items-center justify-between gap-4"
              >
                <div className="space-y-1">
                  <div className="flex items-center gap-2 text-xs font-bold text-blue-600">
                    <span>Начало: {el.start.slice(0, 5)}</span>
                    <span aria-hidden="true" className="text-slate-300">
                      ·
                    </span>
                    <span>Конец: {el.end.slice(0, 5)}</span>
                    <span aria-hidden="true" className="text-slate-300">
                      ·
                    </span>
                    <span className="text-slate-700">{el.specialization}</span>
                  </div>
                  <h4 className="text-sm font-bold text-slate-900">
                    {el.specialization}
                  </h4>
                  <div className="text-xs text-slate-500">{el.coach}</div>
                </div>
                <button
                  onClick={() => handleBooking(el.id)}
                  className={`px-4 py-2 rounded-xl text-xs font-bold transition-all whitespace-nowrap shrink-0 bg-blue-600 hover:bg-blue-700 text-white shadow-xs`}
                >
                  Записаться
                </button>
              </div>
            ))}
          </div>
        </div>
        <div className="mt-20">
          <p className="text-blue-600 font-bold">Впечатления клиентов</p>
          <div className="flex justify-between">
            <h2 className="text-2xl font-bold">
              Отзывы о клубе ({gym?.reviews.length}) {gym?.name}
            </h2>
            <span
              onClick={() => setIsOpen(true)}
              className={`px-4 cursor-pointer py-2 rounded-xl text-xs font-bold transition-all whitespace-nowrap shrink-0 bg-blue-600 hover:bg-blue-700 text-white shadow-xs`}
            >
              + Написать отзыв
            </span>
          </div>
          <div className="grid grid-cols-2 gap-6 pt-2 mt-10 mb-20">
            {gym?.reviews.map((el) => (
              <div
                key={el.id}
                className="p-4 rounded-2xl bg-slate-50 border border-slate-200 space-y-2"
              >
                <div className="flex items-center justify-between">
                  <div className="flex items-center gap-2">
                    {el.avatar_url ? (
                      <img
                        src={`http://localhost:8000/storage/${el.avatar_url}`}
                        alt=""
                      />
                    ) : (
                      <div className="w-8 h-8 rounded-full bg-blue-600 text-white font-bold text-xs flex items-center justify-center">
                        {el.user.charAt(0)}
                      </div>
                    )}

                    <div>
                      <div className="text-xs font-bold text-slate-900">
                        {el.user}
                      </div>
                      <div className="text-[10px] text-slate-400">
                        {new Date(el.created_at).toLocaleString()}
                      </div>
                    </div>
                  </div>
                  <div className="flex items-center gap-1 text-xs font-bold text-amber-600">
                    <Star className="w-3.5 h-3.5 fill-amber-400 text-amber-400" />
                    <span>{el.rating}.0</span>
                  </div>
                </div>
                <p className="text-xs text-slate-700 leading-relaxed">
                  {el.description}
                </p>
              </div>
            ))}
          </div>
        </div>
      </div>
      <ReviewModal  isOpen={isOpen} setIsOpen={setIsOpen} gymId={id}/>
    </section>
  );
}

export default DetailInfo;
