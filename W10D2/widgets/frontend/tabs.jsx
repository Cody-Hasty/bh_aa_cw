import React from 'react';

class Tabs extends React.Component{

    constructor(props){
        super(props)
        this.state = { title: this.props.list[0].title, content: this.props.list[0].content, index: 0};

    }

    setTab(idx, tab) {
        this.setState({index: idx, title: tab.title, content: tab.content })
    }



    // setAllTabs(){
    //     let tabs = this.props.list;
    //     for (let i = 0; i < tabs.length; i++){

    //     }
    // }

    render(){
        return (
            <ul className="tab">
                <header>
                        <button onClick={() => this.setTab(0, this.props.list[0])} ><h1>{this.props.list[0].title}</h1></button>
                        <button onClick={() => this.setTab(1, this.props.list[1])} ><h1>{this.props.list[1].title}</h1></button>
                        <button onClick={() => this.setTab(2, this.props.list[2])} ><h1>{this.props.list[2].title}</h1></button>
                </header>
                <article>{this.state.content}</article>            
            </ul>
        )
    }
}

export default Tabs;