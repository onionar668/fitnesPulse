import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { useUserStore } from "../store/store";

function Header() {
  const {user, fetchUser, logout} = useUserStore()
  const [userDropDown, setUserDropDown] = useState(false)
  const navigate = useNavigate()

  useEffect(() => {
   if(!user){
    fetchUser()
   }
  }, [user, fetchUser]);
  
  const handleLogout = () => {
    localStorage.removeItem('token')
    logout()
    setUserDropDown(false)
    navigate('/login')
  }

  return (
    <div className="flex justify-around h-[100px] items-center">
      <div className="flex gap-4 items-center">
        <button className="bg-blue-500 rounded-xl px-4 py-2 text-white text-xl font-extrabold">
          P
        </button>
        <div className="flex flex-col items-center">
          <p className="text-gray-900 text-xl font-extrabold">FitnesPulse</p>
          <p className="text-gray-500 text-md">Fitnes chain</p>
        </div>
      </div>
      <ul className="flex gap-5">
        <li>
          <button className="text-gray-500 hover:text-blue-500 font-medium" onClick={() => navigate('/')}>
            Gyms
          </button>
        </li>
        <li>
          <button className="text-gray-500 hover:text-blue-500 font-medium" onClick={() => navigate("/coaches")}>
            Coaches
          </button>
        </li>
        <li>
          <a className="text-gray-500 hover:text-blue-500 font-medium" href="">
            Schedules
          </a>
        </li>
        <li>
          <a className="text-gray-500 hover:text-blue-500 font-medium" href="">
            Subscriptions
          </a>
        </li>
        <li>
          <a className="text-gray-500 hover:text-blue-500 font-medium" href="">
            Reviews
          </a>
        </li>
      </ul>
      {user ? (
        <div onClick={() => setUserDropDown(!userDropDown)} className="flex gap-4 items-center cursor-pointer relative bg-gray-200 py-1 px-5 rounded-xl border-1 border-gray-400">
          <img
            src={
              user.avatar_url != null
               ? `http://localhost:8000/api/v1/storage${user.avatar_url}`
                : "./images.png"
            }
            className="w-[30px] h-[30px] rounded-full"
            alt=""
          />
          <div className="flex flex-col items-start">
            <button className="text-black cursor-pointer">
              {user.name}
            </button>
            {user.subscription.length > 0 && user.subscription[0].status === 'active' ? (
              <p className="text-blue-500 text-[10px]">Active subscription</p>
            ) : (
              <p className="text-black text-[10px]">No subscription</p>
            )}
          </div>
          {userDropDown && (
            <div className="absolute cursor-default top-14 z-10 left-0 bg-white rounded-xl p-5 flex flex-col gap-4 border border-slate-300">
              <p>Name: <span className="text-blue-400">{user.name}</span></p>
              <span className="text-slate-400">{user.email}</span>
              <button className="bg-red-500 rounded-xl px-2 cursor-pointer text-white" onClick={handleLogout}>Exit</button>
            </div>
          )}
        </div>
      ) : (
        <div>
          <p>No login</p>
        </div>
      )}
    </div>
  );
}

export default Header;
