import React, { Component } from 'react';
import { BrowserRouter as Router, Switch, Route, Link } from 'react-router-dom';
import './App.css';
import ProductsContainer from './components/ProductsContainer';
import Login from './components/Login';

class App extends Component {
  render() {
    return (
        <div>
            <Router>
                <div>
                  <h2>Welcome to React Router Tutorial</h2>
                  <nav className="navbar navbar-expand-lg navbar-light bg-light">
                  <ul className="navbar-nav mr-auto">
                    <li><Link to={'/login'} className="nav-Login"> Login </Link></li>
                  </ul>
                  </nav>
                  <hr />
                  <Switch>
                      <Route path='/login' component={Login} />
                  </Switch>
                </div>
            </Router>
          <div className="App">
            <ProductsContainer />
          </div>
      </div>
    );
  }
}

export default App;
