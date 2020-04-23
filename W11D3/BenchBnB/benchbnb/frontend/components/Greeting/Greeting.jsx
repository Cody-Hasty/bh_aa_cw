import React from 'react';
import {Link} from 'react-router-dom'

const Greeting = (props) => {
    function clickHander(){
        props.logout();
    }
    
    return (
        <div>
            {
                props.currentUser ? ( 
                    <div>
                        <h1>{currentUser.username}</h1><button onClick={this.clickHander}>Log Out</button>
                    </div>
                    ) : (
                    <div>
                        <Link to="/signup" /> <Link to="/login" />
                    </div>
                )
            }


        </div>
    )
}


export default Greeting;