import { Link } from 'react-router-dom'

export const HomePage = () => {
    const userID = 10
    return (
        <div>
            HomePage

            <Link to={`/test/users/${userID}`}>Users</Link>
        </div>
    )
}
