import { Route, Routes } from 'react-router-dom'
import Login from './pages/Login'
import Register from './pages/Register'
import Home from './pages/Home'
import Header from './components/Header'
import {PublicRoute, ProtectedRoute}  from './components/AuthCheck'
import DetailInfo from './pages/DetailInfo'

function App() {

  return (
    <>
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
        <Route path='/gym/:id' element={<DetailInfo/>}/>
      </Route>
     </Routes>
    </>
  )
}

export default App
