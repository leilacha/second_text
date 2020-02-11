import React from 'react';
import Like from './Like';

const Product = ({product}) =>
    <tr className="single-product" key={product.id}>
        <td>{product.title}</td>
        <td>{product.author}</td>
        <td><Like product={product} /></td>
    </tr>
export default Product;
