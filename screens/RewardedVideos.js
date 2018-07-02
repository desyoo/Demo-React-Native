import React, {Component} from 'react'
import {StyleSheet, Text, View, Button, TouchableOpacity} from 'react-native'

import RewardedVideos from '../AppLovin/RewardedVideos'
import { NativeModules, NativeEventEmitter } from 'react-native'

export default class RewardedVideosDemo extends Component {

  log = new NativeEventEmitter(NativeModules.RewardedVideos)
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
    RewardedVideos.init()
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

        <Text style={styles.warningText}>
          You must turn ON 'Rewarded Videos' in AppLovin dashboard
        </Text>

        <TouchableOpacity
          onPress={()=>RewardedVideos.preload()}>
          <Text style={styles.h3text}>Load</Text>
        </TouchableOpacity>

        <TouchableOpacity
          onPress={()=>RewardedVideos.show()}>
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
    marginTop: '-30%',
    textAlign: "center"
  },
  warningText: {
    fontFamily: 'Helvetica',
    fontSize: 18,
    textAlign: "center",
    marginTop: '1%',
    color: "red"
  },
  h3text: {
    fontFamily: 'Helvetica',
    fontSize: 20,
    fontWeight: 'bold',
    color: 'grey',
    marginTop: '5%'
  },

});
