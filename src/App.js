import './App.css';
import { BrowserRouter, Route, Routes, Navigate } from 'react-router-dom';

import { HomePage } from './pages/HomePage';
import { AboutPage } from './pages/AboutPage';
import { UsersPage } from './pages/UsersPage';
import { NotFoundPage } from './pages/NotFoundPage';
import { Navbar } from './components/Navbar';
import UserPage from './pages/UserPage';
import { Dashboard } from './pages/Dashboard';

function App() {

  return (
    <BrowserRouter>
      <Navbar />
      <Routes>
        <Route path='/test/' element={<HomePage />} />
        <Route path='/test/about' element={<AboutPage />} />
        <Route path='/test/users' element={<UsersPage />} />
        <Route path='/test/users/:id' element={<UserPage />} />
        {/* Navigate redirecciona a otra ruta */}
        <Route path='/test/usuarios' element={<Navigate to='/users' />} />

        <Route path='/test/dashboard/*' element={<Dashboard />} >
          <Route path="welcome" element={<p>Welcome!</p>} />
          <Route path="goodbye" element={<p>Goodbye!</p>} />
        </Route>

        {/* '*' significa para cualquier otra ruta */}
        <Route path='*' element={<NotFoundPage />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
