import React from 'react';

// Weather API key = e6b912d13b63ce08449cc42d202e94af

// api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={your api key}

class Weather extends React.Component {

    constructor(props) {
        super(props);
        this.state = { location: '', weather: ''};
    }

    getLocation() {
        this.setState({ location : navigator.geolocation.getCurrentPosition(this.getWeather()), weather: ''});
    }

    getWeather(pos) {
        let crd = pos.coords;
        this.setState({ location: this.state.location, weather : 'api.openweathermap.org / data / 2.5 / weather ? lat = { crd.latitude } & lon={ crd.longitude }& appid={ e6b912d13b63ce08449cc42d202e94af }'});
    }

    render() {
        return (
            <div className="weather">
                <div>Current weather</div>
                <div>{this.state.weather}</div>
            </div>
        );
    }
}