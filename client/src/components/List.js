import React from 'react';
const List = ({list}) =>
    <tr className="single-list" key={list.id}>
        <td>{list.title}</td>
        <td>{list.author}</td>
    </tr>
export default List;
