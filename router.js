import { createStackNavigator } from 'react-navigation';

import HomeScreen from './screens/HomeScreen'
import InterstitialsDemo from './screens/Interstitials'
import RewardedVideosDemo from './screens/RewardedVideos'
import BannersDemo from './screens/Banners'

export default Nav = createStackNavigator({
    Home: {
      screen: HomeScreen,
      navigationOptions: {
        title: 'AppLovin'
      }
    },
    Interstitials: {
      screen: InterstitialsDemo,
      navigationOptions: {
        title: 'Interstitials'
      }
    },
    Rewarded_Videos: {
      screen: RewardedVideosDemo,
      navigationOptions: {
        title: 'Rewarded Videos'
      }
    },
    Banners: {
      screen: BannersDemo,
      navigationOptions: {
        title: 'Banners'
      }
    }

})
