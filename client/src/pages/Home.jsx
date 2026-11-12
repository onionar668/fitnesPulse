import axios from "axios";
import { useEffect, useState } from "react";
import Hero from "../components/Hero";
import { ArrowRight, CheckCircle2, MapPin, SlidersHorizontal, Star } from "lucide-react";
import { useNavigate } from "react-router-dom";

function Home() {
  const [gyms, setGyms] = useState([]);
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedRegion, setSelectedRegion] = useState("all");

  const navigate = useNavigate()

  const filtredGyms = gyms.filter((el) => {
    const matchsName = el.name
      .toLowerCase()
      .includes(searchQuery.toLowerCase());
    const matchsRegion =
      selectedRegion === "all" || el.region.id === selectedRegion;

    return matchsName && matchsRegion;
  });

  useEffect(() => {
    const fetchGyms = async () => {
      try {
        const response = await axios.get("http://localhost:8000/api/v1/gym");
        setGyms(response.data.data);
      } catch (err) {
        console.log(err);
      }
    };
    fetchGyms();
  }, []);

  return (
    <>
      <Hero
        setSearchQuery={setSearchQuery}
        searchQuery={searchQuery}
        setSelectedRegion={setSelectedRegion}
        selectedRegion={selectedRegion}
      />
      <div className="bg-slate-200 flex flex-col gap-5">
        <div className="flex flex-col gap-4 w-[80%] mx-auto">
          <div className="flex gap-4 mt-10">
            <p className="text-blue-500 text-xl">Catalog location</p>
            <span>/</span>
            <p className="text-blue-500 text-xl">10 clubs available</p>
          </div>
          <h1 className="text-5xl font-extrabold">Clubs list</h1>
          <p className="text-gray-500 w-120">
            Modern facilities featuring Olympic lifting platforms, cardio
            theaters, and aquatic zones. Choose a gym in your city.
          </p>
          <div className="flex gap-4 items-center justify-between bg-white p-4 rounded-2xl">
            <div className="flex gap-4 items-center">
              <div className="flex gap-4">
                <SlidersHorizontal />
                <p>Filter:</p>
              </div>
              <div>
                <button className="bg-black rounded-lg px-2 py-1 text-white">
                  Pool
                </button>
              </div>
            </div>
            <div className="flex gap-2">
              <p>Region:</p>
              <span className="text-blue-500">{selectedRegion === 'all' ? 'all' : selectedRegion} </span>
            </div>
          </div>
        </div>
        <div id="catalog" className="flex flex-wrap gap-4 justify-center">
          {filtredGyms.length > 0 ? (
            <>
            {filtredGyms.map((gym) => (
            <div
              key={gym.id}
              className="bg-white rounded-3xl w-[300px] overflow-hidden border border-slate-200/90 shadow-sm hover:shadow-md transition-all duration-300 flex flex-col group"
            >
              <div className="relative overflow-hidden bg-slate-900">
                <img
                  src={`http://localhost:8000/storage/${gym.image_url}`}
                  alt={gym.name}
                  className="w-[300px] h-[400px] object-contain group-hover:scale-103 transition-transform duration-500"
                  referrerPolicy="no-referrer"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-slate-950/70 via-transparent to-transparent" />

                <div className="absolute top-4 left-4 right-4 flex items-center justify-between">
                  <span className="px-3 py-1 bg-white/95 backdrop-blur-md rounded-lg text-xs font-bold text-slate-900 shadow-xs">
                    {gym.region}
                  </span>
                  <div className="flex items-center gap-1 px-2.5 py-1 bg-slate-950/80 backdrop-blur-md rounded-lg text-xs font-bold text-white">
                    <Star className="w-3.5 h-3.5 fill-amber-400 text-amber-400" />
                    <span className="tabular-nums">{gym.avgRating || 0}</span>
                    <span className="text-slate-400 font-normal">({gym.reviewCount})</span>
                  </div>
                </div>

                <div className="absolute bottom-3 left-4 text-white">
                  <span className="text-xs text-slate-300 font-medium">
                    Абонементы от{" "}
                  </span>
                  <span className="text-lg font-extrabold tabular-nums">
                    {gym.subscriptions[0]?.price} ₸
                  </span>
                  <span className="text-xs text-slate-300">/мес</span>
                </div>
              </div>

              <div className="p-6 flex-1 flex flex-col justify-between space-y-4">
                <div className="space-y-2">
                  <h3 className="text-xl font-bold text-slate-900 group-hover:text-blue-600 transition-colors">
                    {gym.name}
                  </h3>
                  <p className="text-xs text-slate-600 line-clamp-2 leading-relaxed">
                    {gym.description}
                  </p>

                  <div className="pt-2 text-xs text-slate-500 space-y-1">
                    <div className="flex items-start gap-1.5">
                      <MapPin className="w-3.5 h-3.5 text-blue-600 shrink-0 mt-0.5" />
                      <span className="line-clamp-1">{gym.address}</span>
                    </div>
                  </div>
                </div>
                    <div className="pt-3 border-t border-slate-100">
                    <div className="text-[11px] font-semibold text-slate-400 uppercase tracking-wider mb-2">
                      Инфраструктура:
                    </div>
                    <div className="flex flex-wrap gap-x-2 gap-y-1 text-xs text-slate-600">
                      {gym.infrastructure.map((feature, idx) => (
                        <span key={feature} className="flex items-center gap-1">
                          <CheckCircle2 className="w-3 h-3 text-blue-600" />
                          <span>{feature}</span>
                          {idx < 3 && <span className="text-slate-300 ml-1">·</span>}
                        </span>
                      ))}
                    </div>
                  </div>

                <div className="pt-4 border-t border-slate-100 grid grid-cols-2 gap-2">
                  <button onClick={() => navigate(`/gym/${gym.id}`)} className="w-full py-2.5 px-3 bg-slate-100 hover:bg-slate-200 text-slate-800 text-xs font-bold rounded-xl transition-colors flex items-center justify-center gap-1 whitespace-nowrap">
                    <span>О клубе</span>
                    <ArrowRight className="w-3.5 h-3.5" />
                  </button>
                  <button className="w-full py-2.5 px-3 bg-blue-600 hover:bg-blue-700 text-white text-xs font-bold rounded-xl transition-colors shadow-xs flex items-center justify-center gap-1 whitespace-nowrap">
                    <span>Купить карту</span>
                  </button>
                </div>
              </div>
            </div>
          ))}
            </>
          ) : (
            <div className="text-black text-2xl font-bold p-20">
                По выбранным фильтрам залы отстутсвуют
            </div>
          )}
        </div>
      </div>
    </>
  );
}

export default Home;
