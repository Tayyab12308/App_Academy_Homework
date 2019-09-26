import React from 'react';
import {
  Route,
  Link,
  NavLink
} from 'react-router-dom';

import Red from './red';
import Green from './green';
import Blue from './blue';
import Violet from './violet';

class Rainbow extends React.Component {
  render() {
    return (
      <div>
        <h1>Rainbow Router!</h1>
        {<NavLink exact to="/red">Red Only</NavLink>}
        {<NavLink exact to="/blue">Blue Only</NavLink>}
        {<NavLink exact to="/green">Green Only</NavLink>}
        {<NavLink exact to="/Violet">Violet Only</NavLink>}

        <div id="rainbow">
          {<Route path="/red" component={Red} />}
          {<Route path="/blue" component={Blue} />}
          {<Route path="/green" component={Green} />}
          {<Route path="/Violet" component={Violet} />}
        </div>
      </div>
    );
  }
};

export default Rainbow;
