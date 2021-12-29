import { useNavigate, Routes, Route, Link, Outlet } from 'react-router-dom'

export const Dashboard = () => {

    const navigate = useNavigate()

    const handleClick = () => {
        navigate('/')
    }

    return (
        <div>
            Dashboard

            <button onClick={handleClick}>Logout</button>

            <p><Link to='welcome'>WelcomePage</Link></p>
            <Link to='goodbye'>Goodbye</Link>
            {/* 
            <Routes>
                <Route path="welcome" element={<p>Welcome!</p>} />
            </Routes> */}
            <Outlet />
        </div>
    )
}
