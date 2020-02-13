import React, { Component } from 'react';
import axios from 'axios';

class Login extends Component {
    constructor(props){
        super(props)
        this.state = {
            email: "",
            password: ""
        }
    }
handleChange = (event) => {
    this.setState({
      [event.target.id]: event.target.value
    })
  }
handleOnSubmit = (event) => {
    event.preventDefault()
    let request = {auth: {email: this.state.email, password: this.state.password}};
            axios.post('/v1/user/token', request)
            .then(response => {
                if (!response.ok) {throw Error(response.statusText);}
                return response.json()
                })
            .then(data => {localStorage.setItem("jwt", data.jwt)})
            .catch(error => console.log(error));
  }
render(){
    return(
      <form className="form" onSubmit={(event) => this.handleOnSubmit(event)}>
        <label htmlFor="email">Email: </label>
        <br />
        <input
          name="email"
          id="email"
          type="email"
          value={this.state.email}
          onChange={(event) => this.handleChange(event)}
        />
        <br /> <br />
        <label htmlFor="password">Password: </label>
        <br />
        <input
          name="password"
          id="password"
          type="password"
          value={this.state.password}
          onChange={(event) => this.handleChange(event)}
          />
        <br /><br />
        <input type="submit" />
          <br />
      </form>
    )
  }
}
export default Login;
