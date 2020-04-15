import React from 'react'
import Clock from './clock';
import Tabs from './tabs';

let list = [
    { title: "first", content: "first tab"},
    { title: "second", content: "second tab"},
    { title: "third", content: "third tab"},
];

const Root = (props) => {
    return (
        <div>
            <Clock />
            <Tabs list={list}/>
        </div>
    )
}

export default Root;