import { Route, Routes } from 'react-router-dom'
import Login from './pages/Login'
import Register from './pages/Register'
import Home from './pages/Home'
import Header from './components/Header'
import {PublicRoute, ProtectedRoute}  from './components/AuthCheck'
import DetailInfo from './pages/DetailInfo'
import Coaches from './pages/Coaches'
import Footer from './components/Footer'
import {Toaster} from 'react-hot-toast'

function App() {

  return (
    <>
    <Toaster position='bottom-right' reverseOrder={false}/>
    <Header/>
    <hr className='text-gray-500'/>
     <Routes>
      <Route element={<PublicRoute/>}>
        <Route path='/login' element={<Login/>}/>
        <Route path='/register' element={<Register/>}/>
        <Route path='*' element={<Login/>}/>
      </Route>
      <Route element={<ProtectedRoute/>}>
        <Route path='/' element={<Home/>}/>
        <Route path='/coaches' element={<Coaches/>}/>
        <Route path='/gym/:id' element={<DetailInfo/>}/>
      </Route>
     </Routes>
     <Footer/>
    </>
  )
}

export default App
