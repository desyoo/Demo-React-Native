import React, {Component} from 'react';
import { createStackNavigator } from 'react-navigation';

import Nav from './router'

import {NativeModules} from 'react-native';

console.disableYellowBox = true;

export default class App extends Component {
  render(){
    return <Nav></Nav>
  }
}
