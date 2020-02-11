import React, { Component } from 'react';
import axios from 'axios';
import './style/Like.css';


class Like extends Component {
    constructor(props){
        super(props)
        this.state = {
            liked: false,
            likes_count: this.props.product.likes_count
        }
    }

  handleLike = value => () => {
    if (!this.state.liked) {
        axios.post('/v1/likes', {
                 user_id: 1,
                 product_id: value
               })
        .then(response => {
            console.log(response)
            this.setState({
            liked: true,
            likes_count: this.state.likes_count + 1
            })
        })
        .catch(error => console.log(error))
    } else {
       console.log('find user like if exist and delete it')
      }
  };

    render() {
            return (
              <button
              className={this.state.liked ? 'liked' : 'unliked'}
              onClick={this.handleLike(this.props.product.id)}
              >
              {`Likes ${this.state.likes_count}`}
              </button>
            )
        }
}
export default Like;
