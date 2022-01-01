import { useContext } from 'react';
// import { useLocation } from 'react-router'
import { Navigate, Outlet, useLocation } from 'react-router-dom'

const useAuth = () => {
    const user = {
        loggedIn: false
    }
    return user && user.loggedIn
}

export const ProtectedRoutes = () => {
    const location = useLocation()
    const isAuth = useAuth()
    // todo lo que se pase en state se guarda en 'location'
    return isAuth ? <Outlet /> : <Navigate to="/test/" />
}

export default ProtectedRoutes