import {NativeModules} from 'react-native'

const initRewardedVideo = () => {
  return NativeModules.RewardedVideos.initAd()
}

const preloadRewardedVideo = () => {
  return NativeModules.RewardedVideos.preloadAd()
}

const showRewardedVideos = () => {
  return NativeModules.RewardedVideos.showAd()
}

const RewardedVideos = Object.assign({
  init: initRewardedVideo,
  preload: preloadRewardedVideo,
  show: showRewardedVideos
}, NativeModules.RewardedVideos)

export default RewardedVideos
