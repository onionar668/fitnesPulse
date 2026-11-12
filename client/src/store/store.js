import axios from 'axios'
import {create} from 'zustand'

export const useUserStore = create((set) =>( {
    user: null,
    token: null,
    fetchUser: async() => {
        const token = localStorage.getItem('token')
        if(!token) return

        try{
            const response = await axios.get('http://localhost:8000/api/v1/user/me', {headers: {Authorization: `Bearer ${token}`}})
            set({user: response.data.data})
        }catch(err){
            console.log(err.response?.data?.error)
            set({user: null, token: null})
        }
    },
    logout: () => set({ user: null, token: null }),
}))