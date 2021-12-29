import { NavLink } from 'react-router-dom'
import './navbar.css'

export const Navbar = () => {
    return (
        <div>
            <ul>
                <li>
                    <NavLink className={({ isActive }) => isActive ? 'active' : ''} to="/test/">Home</NavLink>
                </li>
                <li>
                    <NavLink className={({ isActive }) => isActive ? 'active' : ''} to="/test/about">About</NavLink>
                </li>
                <li>
                    <NavLink className={({ isActive }) => isActive ? 'active' : ''} to="/test/users">Users</NavLink>
                </li>
                <li>
                    <NavLink className={({ isActive }) => isActive ? 'active' : ''} to="/test/dashboard">Dashboard</NavLink>
                </li>
            </ul>
        </div>
    )
}
