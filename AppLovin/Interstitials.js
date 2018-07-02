import {NativeModules} from 'react-native'

const initInterstitial =  () => {
  return NativeModules.Interstitials.initAd()
}

const showInterstitial = () => {
  return NativeModules.Interstitials.showAd()
}

const Interstitials = Object.assign({
  init: initInterstitial,
  show: showInterstitial
}, NativeModules.Interstitials)

export default Interstitials
