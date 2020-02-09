import React, { Component } from 'react';
import axios from 'axios';
import List from './List';

class ListsContainer extends Component {
    constructor(props){
        super(props)
        this.state = {
            lists: []
        }
    }
    componentDidMount() {
        axios.get('v1/products.json')
        .then(response => {
            console.log(response)
            this.setState({
                lists: response.data
            })
        })
        .catch(error => console.log(error))
    }
    render() {
            return (
                <table className="lists-container">
                  <tr>
                    <th>Title</th>
                    <th>Author</th>
                  </tr>
                    {this.state.lists.map( list => {
                        return (<List list={list} key={list.id} />)
                    })}
                </table>
            )
        }
}
export default ListsContainer;
