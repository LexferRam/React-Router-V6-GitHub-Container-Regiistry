import logo from './logo.svg';
import './App.css';
import { BrowserRouter } from 'react-router-dom';

function App() {

  return (
    <div className="App">
      <BrowserRouter>
        test
        {process.env.REACT_APP_TEST}
      </BrowserRouter>
    </div>
  );
}

export default App;
