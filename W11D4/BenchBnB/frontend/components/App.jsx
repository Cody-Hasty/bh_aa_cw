import React from 'react'
import GreetingContainer from './Greeting/Greeting_Container';
import SignUpFormContainer from './signup_form_container';
import LogInFormContainer from './login_form_container';
import { Route, Switch, Link} from 'react-router-dom';

const App = () => (
  <div>
    <header>
      <Link to="/" className="header-link">
        <h1>Bench BnB</h1>
      </Link>
      <GreetingContainer />
    </header>
    <Switch>
      <Route exact path="/login" component={LogInFormContainer} />
      <Route exact path="/signup" component={SignUpFormContainer} />
    </Switch>
  </div>
);

export default App;