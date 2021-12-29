import { Link } from 'react-router-dom'

export const HomePage = () => {
    const userID = 10
    return (
        <div>
            HomePage

            <Link to={`/users/${userID}`}>Users</Link>
        </div>
    )
}
