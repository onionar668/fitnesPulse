import axios from "axios";
import { Dumbbell, MapPin, Search, ShieldCheck, Trophy } from "lucide-react";
import { useEffect, useState } from "react";

function Hero({
  searchQuery,
  setSearchQuery,
  setSelectedRegion,
  selectedRegion,
}) {
  const [region, setRegion] = useState([]);

  useEffect(() => {
    const fetchRegion = async () => {
      try {
        const response = await axios.get(
          "http://localhost:8000/api/v1/regions",
        );
        setRegion(response.data.data);
      } catch (err) {
        console.log(err);
      }
    };
    fetchRegion();
  }, []);

  const handleRegionClick = (id) => {
    setSelectedRegion(id);
    const catalog = document.getElementById("catalog");
    if (catalog) catalog.scrollIntoView({ behavior: "smooth" });
  };

  return (
    <section className="flex flex-col gap-4 mb-10">
      <div className="flex justify-around items-center mb-10">
        <div className="flex flex-col gap-4">
          <div className="flex gap-2 items-center">
            <p className="text-blue-700 font-medium text-sm">Premium clubs</p>
            <span className="text-blue-700">•</span>
            <p className="text-blue-700 font-medium text-sm">
              3 cities and 17 regions
            </p>
            <span className="text-blue-700">•</span>
            <p className="text-blue-700 font-medium text-sm">
              Unified subscription
            </p>
          </div>
          <h2 className="text-5xl font-extrabold w-[400px]">
            Next level fitness with convenient{" "}
            <span className="text-blue-600">online-booking</span>
          </h2>
          <p className="w-[500px] text-gray-500">
            Choose a gym in your city, book sessions with top trainers in just
            one click, purchase memberships online, and manage your workouts
            through your personal account.
          </p>
          <div className="flex flex-col gap-4 w-150 items-start bg-slate-50 shadow-sm border-slate-300 border rounded-lg p-2">
            <div className="flex items-center w-full px-2 bg-white rounded-lg border border-slate-300">
              <Search className="w-4 h-4 shrink-0" />
              <input
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="w-full p-3 text-sm text-slate-500 bg-transparent outline-none"
                type="text"
                placeholder="Search gym"
              />
            </div>

            <div className="flex gap-2 items-center w-full overflow-x-auto pb-5 scrollbar-thin">
              <MapPin className="text-blue-500 w-5 h-5 shrink-0" />
              <button
                onClick={() => handleRegionClick("all")}
                className={`cursor-pointer rounded-lg py-1 px-3 text-sm shrink-0 whitespace-nowrap transition-colors ${
                  selectedRegion === "all"
                    ? "bg-blue-800 text-white font-bold"
                    : "bg-slate-200 text-slate-700 hover:bg-slate-300"
                }`}
              >
                All
              </button>
              {region.map((el) => (
                <button
                  key={el.id}
                  onClick={() => handleRegionClick(el.id)}
                  className="bg-blue-500 cursor-pointer rounded-lg text-white py-1 px-2 text-sm shrink-0 whitespace-nowrap"
                >
                  {el.name}
                </button>
              ))}
            </div>

            <button
              onClick={() => {
                const catalog = document.getElementById("catalog");
                if (catalog) catalog.scrollIntoView({ behavior: "smooth" });
              }}
              className="bg-blue-700 rounded-xl text-white py-2 px-7 cursor-pointer"
            >
              Find gym
            </button>
          </div>
          <div className="flex gap-2 mt-10">
            <div className="flex items-center gap-1.5">
              <ShieldCheck className="w-4 h-4 text-blue-600" />
              <span className="text-gray-500">Мгновенная онлайн-оплата</span>
            </div>
            <div className="flex items-center gap-1.5">
              <Dumbbell className="w-4 h-4 text-blue-600" />
              <span className="text-gray-500">Премиальное оборудование</span>
            </div>
            <div className="flex items-center gap-1.5">
              <Trophy className="w-4 h-4 text-blue-600" />
              <span className="text-gray-500">Дипломированные тренеры</span>
            </div>
          </div>
        </div>
        <div className="flex flex-col relative items-center">
          <img className="rounded-xl h-100 w-130" src="./lux.jpg" alt="" />
          <div className="bg-white absolute flex justify-between items-center bottom-5 left-5 p-2 w-120 rounded-2xl">
            <div>
              <span className="text-blue-500 text-[15px]">
                Флагманский клуб
              </span>
              <p className="font-bold text-black text-lg">Wellness Club</p>
              <span className="text-slate-500">
                Бассейн 25м · Башня Федерация
              </span>
            </div>
            <button className="bg-blue-700 cursor-pointer px-4 py-2 text-white rounded-2xl">
              Обзор зала
            </button>
          </div>
        </div>
      </div>
      <hr className="text-slate-300" />
      <div className="flex w-[80%] mx-auto justify-around mt-10">
        <div>
          <p className="text-blue-500 text-4xl font-bold">10 clubs</p>
          <span className="text-slate-400">
            In Almaty, Astana, Shymkent and regions
          </span>
        </div>
        <div>
          <p className="text-blue-500 text-4xl font-bold">8+ coaches</p>
          <span className="text-slate-400">
            Masters of Sport and international certificates
          </span>
        </div>
        <div>
          <p className="text-blue-500 text-4xl font-bold">25 metrs</p>
          <span className="text-slate-400">
            Ozonated swimming pools and thermal zones
          </span>
        </div>
        <div>
          <p className="text-blue-500 text-4xl font-bold">98.7%</p>
          <span className="text-slate-400">
            Positive reviews from residents
          </span>
        </div>
      </div>
    </section>
  );
}

export default Hero;
