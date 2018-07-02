import {NativeModules} from 'react-native'

const initBanner =  () => {
  return NativeModules.Banners.initAd()
}

const loadNextAd = () => {
  return NativeModules.Banners.loadNextAd()
}

const closeAd = () => {
  return NativeModules.Banners.closeAd()
}

const Banners = Object.assign({
  init: initBanner,
  show: loadNextAd,
  close: closeAd
}, NativeModules.Banners)

export default Banners
