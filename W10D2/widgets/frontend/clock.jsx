import React from 'react';

class Clock extends React.Component{

    constructor(props) {
        super(props)
        this.state = { time: new Date() };
        this.tick = this.tick.bind(this);
    }

    tick() {
        this.setState({ time : new Date() });
    }

    componentDidMount() {
        this.interval = setInterval(this.tick, 1000);
    }

    render() {
        let timeNow = this.state.time.getHours() + " : " + this.state.time.getMinutes() + " : " + this.state.time.getSeconds();
        return (<div className="time">
                    <div>Current Time</div> 
                    <div> {timeNow} </div>
                </div>
            )
    }
}

export default Clock;