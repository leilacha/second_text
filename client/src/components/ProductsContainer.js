import React, { Component } from 'react';
import axios from 'axios';
import Product from './Product';

class ProductsContainer extends Component {
    constructor(props){
        super(props)
        this.state = {
            products: []
        }
    }
    componentDidMount() {
        axios.get('v1/products.json')
        .then(response => {
            console.log(response)
            this.setState({
                products: response.data
            })
        })
        .catch(error => console.log(error))
    }
    render() {
            return (
                <table className="products-container">
                  <thead>
                      <tr>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Likes count</th>
                      </tr>
                  </thead>
                  <tbody>
                    {this.state.products.map( product => {
                        return (<Product product={product} key={product.id} />)
                    })}
                  </tbody>
                </table>
            )
        }
}
export default ProductsContainer;
