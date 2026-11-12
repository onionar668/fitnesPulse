import { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import { useUserStore } from "../store/store";

function Login() {
  const navigate = useNavigate();
  const {fetchUser} = useUserStore()
  const [login, setLogin] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");

  const handleLogin = async (e) => {
    e.preventDefault();
    setError("");
    try {
      const response = await axios.post("http://localhost:8000/api/v1/auth/login", {
        login,
        password,
      });
      localStorage.setItem('token', response.data.token);
      await fetchUser()
      navigate("/");
    } catch (err) {
      setError(err.response?.data?.error);
    }
  };
  return (
    <div className="flex items-center justify-center min-h-[100vh]">
      <div className="flex flex-col items-center  shadow-2xl w-[700px] py-5 rounded-lg">
        <h1 className="text-2xl mb-5 text-blue-500">Login</h1>
        {error && <p className="text-red-500 p-2">{error}</p>}
        <form className="flex flex-col items-start gap-6" onSubmit={handleLogin}>
          <input
            placeholder="Email or phone"
            type="text"
            value={login}
            onChange={(e) => setLogin(e.target.value)}
            className="bg-gray-200 p-2 rounded-2xl outline-none"
          />

          <input
            placeholder="Password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            type="text"
            className="bg-gray-200 p-2 rounded-2xl outline-none"
          />

          <button
            type="submit"
            className="bg-blue-500 rounded-4xl px-10 mx-auto text-white cursor-pointer py-2"
          >
            Login
          </button>
        </form>
        <a href="/register" className="text-blue-500">Don't have account? Click here</a>
      </div>
    </div>
  );
}

export default Login;
