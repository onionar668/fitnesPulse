import axios from "axios"
import { ArrowLeft, Clock, MapPin, Star, Wallet } from "lucide-react"
import { useEffect, useState } from "react"
import { useNavigate, useParams } from "react-router-dom"

function DetailInfo() {
    const [gym, setGym] = useState(null)
    const {id} = useParams()
    const navigate = useNavigate()

    useEffect(() => {
        const fetchData = async() => {
            try{
                const response = await axios.get(`http://localhost:8000/api/v1/gym/${id}`)
                setGym(response.data.data)
            }catch(err){
                console.log(err)
            }
        }
        fetchData()
    }, [])
  return (
    <section className="bg-slate-100 w-full h-full">
    <div className="w-300 mx-auto pt-20">
      <div className="flex justify-between">
        <button onClick={() => navigate('/')} className="cursor-pointer flex items-center"><ArrowLeft className="h-4 w-4"/>Back</button>
        <p className="text-blue-500">Club: <span className="bg-slate-200 p-2 rounded-xl border border-slate-400 text-black">{gym?.region}  •  {gym?.name}</span></p>
      </div>

      <div className="w-full flex justify-between items-center p-4 mt-10 bg-white rounded-2xl border border-slate-400">
        <img className="w-[50%] h-full object-contain rounded-2xl" src={`http://localhost:8000/storage/${gym?.image_url}`} alt="" />
        <div className="flex flex-col items-start gap-4">
            <div className="flex justify-between w-[90%]">
                <p className="bg-blue-300 text-blue-700 font-medium rounded-xl py-1 px-4">{gym?.region}</p>
                <div className="flex gap-1 items-center bg-yellow-200 border border-amber-300 px-5 rounded-xl">
                    <Star className="w-2 h-2 fill-amber-600 text-amber-600"/>
                    <p className="text-amber-600 text-[12px]">{gym?.avgRating}</p>
                    <p className="text-orange-500 text-[12px]">({gym?.reviews.length} reviews)</p>
                </div>
            </div>
            <h2 className="text-4xl font-bold">{gym?.name}</h2>
            <p className="flex items-center gap-4"><MapPin className="w-5 h-5 text-blue-500"/> {gym?.address}</p>
            <p className="flex items-center gap-4"><Clock className="w-5 h-5 text-blue-500"/> 10:00</p>
            <hr />
            <p>{gym?.description}</p>
            <hr />
            <div className="flex flex-col gap-2 w-[90%]">
                <button className="bg-blue-600 text-white rounded-xl py-2 cursor-pointer w-full flex gap-2 items-center justify-center"><Wallet/>Buy club card</button>
                <button className="bg-slate-200 rounded-xl py-2 cursor-pointer">Reviews for club</button>
            </div>
        </div>
      </div>

      <div>
        <p>Coaches team</p>
        <p>Coaches club "{gym?.name}"</p>
        <div>
            <div>
                <img src={`http://localhost:8000/storage/${gym?.coaches.avatar}`} alt="" />
            </div>
        </div>
      </div>
    </div>
    </section>
  )
}

export default DetailInfo
