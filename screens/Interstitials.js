import React, {Component} from 'react'
import {StyleSheet, Text, View, Button, TouchableOpacity} from 'react-native'

import Interstitials from '../AppLovin/Interstitials'
import { NativeModules, NativeEventEmitter } from 'react-native'

export default class InterstitialsDemo extends Component {

  log = new NativeEventEmitter(NativeModules.Interstitials)
  listener = this.log.addListener('log', (data) => {
      console.log("Log:", data)
      this.setState({
        log: data
      })
  })

  constructor(props){
    super(props)
    this.state = {
      log: "Ready to load ads"
    }
    Interstitials.init()
  }

  componentWillUnmount(){
    this.listener.remove()
  }

  render(){
    return (
      <View style={styles.container}>
        <Text style={styles.h2text}>
          {this.state.log}
        </Text>
        <TouchableOpacity
          onPress={()=>Interstitials.show()}
        >
          <Text style={styles.h3text}>Show</Text>
      </TouchableOpacity>
      </View>
  )}
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    margin: "5%",
    justifyContent: "center",
    alignItems: "center"
  },
  h2text: {
    fontFamily: 'Helvetica',
    fontSize: 26,
    fontWeight: 'bold',
    marginTop: '-10%',
    marginBottom: '5%',
    textAlign: "center"
  },
  h3text: {
    fontFamily: 'Helvetica',
    fontSize: 20,
    fontWeight: 'bold',
    color: 'grey'
  },

});
