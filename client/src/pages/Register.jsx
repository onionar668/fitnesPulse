import { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";

function Register() {
  const navigate = useNavigate();
  const [name, setName] = useState("");
  const [phone, setPhone] = useState("");
  const [email, setEmail] = useState("");
//   const [avatar, setAvatar] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");

  const handleRegister = async (e) => {
    e.preventDefault();
    setError("");
    try {
      const response = await axios.post("http://localhost:8000/api/v1/auth/register", {
        name,
        phone,
        email,
        password,
      });
      localStorage.setItem('token', response.data.token);
      navigate("/");
    } catch (err) {
      setError(err.response?.data?.message);
    }
  };
  return (
    <div className="flex items-center justify-center min-h-[100vh]">
      <div className="flex flex-col items-center  shadow-2xl w-[700px] py-5 rounded-lg">
        <h1 className="text-2xl mb-5 text-amber-500">Register</h1>
        {error && <p className="text-red-500">{error}</p>}
        <form className="flex flex-col items-start gap-6" onSubmit={handleRegister}>
         <div className="flex gap-4">
             <input
            placeholder="Name"
            type="text"
            value={name}
            onChange={(e) => setName(e.target.value)}
            className="bg-gray-200 p-2 rounded-2xl outline-none"
          />

          <input
            placeholder="Email"
            type="text"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            className="bg-gray-200 p-2 rounded-2xl outline-none"
          />
         </div>

         <div className="flex gap-4">
             <input
            placeholder="Phone"
            type="text"
            value={phone}
            onChange={(e) => setPhone(e.target.value)}
            className="bg-gray-200 p-2 rounded-2xl outline-none"
          />

          <input
            placeholder="Password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            type="text"
            className="bg-gray-200 p-2 rounded-2xl outline-none"
          />
         </div>

          <button
            type="submit"
            className="bg-amber-500 rounded-4xl px-10 mx-auto text-white cursor-pointer py-2"
          >
            Register
          </button>
        </form>
        <a href="/" className="text-blue-500">Already have account? Click here</a>
      </div>
    </div>
  );
}

export default Register;
