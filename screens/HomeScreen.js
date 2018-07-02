import React, {Component} from 'react';
import {StyleSheet, Text, View, Button, FlatList, List, TouchableHighlight} from 'react-native';
import { createStackNavigator } from 'react-navigation';

export default class HomeScreen extends Component {

  menu = [
    {
      id: 1,
      title: "Interstitials",
      subtitle: "Full screen ads, graphic or video"
    },
    {
      id: 2,
      title: "Rewarded Videos (Incentivized Ads)",
      subtitle: "Reward your users for watching these on-demand videos"
    },
    {
      id: 3,
      title: "Banners",
      subtitle: "320x50 Classic banner ads"
    }
  ]

  navigate(id) {
    switch (id){
      case 1:
        this.props.navigation.navigate('Interstitials')
        break
      case 2:
        this.props.navigation.navigate('Rewarded_Videos')
        break
      case 3:
        this.props.navigation.navigate('Banners')
        break
    }
  }

  render() {
    return (
      <View style={styles.container}>
        <FlatList
          data={this.menu}
          renderItem={({item}) =>
            <TouchableHighlight
              style={styles.flatview}
              onPress={() => this.navigate(item.id)}
              underlayColor="rgba(255,255,255,0.3)"
              >
              <View style={styles.cell}>
                <Text style={styles.h3text}>{item.title}</Text>
                <Text style={styles.bodyText}>{item.subtitle}</Text>
              </View>
            </TouchableHighlight>
          }
          keyExtractor={item=>item.title}
          />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  h2text: {
    fontFamily: 'Helvetica',
    fontSize: 30,
    fontWeight: 'bold'
  },
  h3text: {
    fontFamily: 'Helvetica',
    fontSize: 20,
    fontWeight: 'bold'
  },
  bodyText: {
    paddingTop: 5,
    fontFamily: 'Helvetica',
    fontSize: 15
  },
  container: {
    flex: 1,
    margin: "5%"
  },
  cell: {
    margin: "5%"
  }
});
