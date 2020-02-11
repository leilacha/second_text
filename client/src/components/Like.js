import React, { Component } from 'react';
import axios from 'axios';
import './style/Like.css';


class Like extends Component {
    constructor(props){
        super(props)
        this.state = {
            liked: false
        }
    }
  handleLike = value => () => {
        axios.post('/v1/likes', {
                 user_id: 1,
                 product_id: value
               })
        .then(response => {
            console.log(response)
            this.setState({
            liked: true
            })
        })
        .catch(error => console.log(error))
  };

    render() {
            return (
              <button
              className={this.state.liked ? 'liked' : 'unliked'}
              onClick={this.handleLike(this.props.product.id)}
              >
              {`Likes ${this.props.product.likes_count}`}
              </button>
            )
        }
}
export default Like;
