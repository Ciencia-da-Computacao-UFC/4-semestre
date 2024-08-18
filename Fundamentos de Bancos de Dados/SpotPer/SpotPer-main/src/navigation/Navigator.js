import 'react-native-gesture-handler';
import { createStackNavigator } from 'react-navigation-stack'
import { createAppContainer } from "react-navigation";

import Home from '../screens/Home'
import Albums from '../screens/Albums'
import Album from '../components/Album'
import Tracks from '../screens/Tracks'
import AllPlaylists from '../screens/AllPlaylists'
import Playlist from '../screens/Playlist'

const mainNavigatorStack = createStackNavigator({
  Home: {
    screen: Home,
    navigationOptions: {
      title: 'SpotPer',
      //   headerShown: false,
      gestureEnabled: false
    },
  },
  Albums: {
    screen: Albums,
    navigationOptions: {
      title: 'Álbuns',
      //   headerShown: false,
      gestureEnabled: false
    },
  },
  Album: {
    screen: Album,
    navigationOptions: {
      //   headerShown: false,
      gestureEnabled: false
    },
  },
  Tracks: {
    screen: Tracks,
    navigationOptions: {
      title: 'Faixas',
      //   headerShown: false,
      gestureEnabled: false
    },
  },
  AllPlaylists: {
    screen: AllPlaylists,
    navigationOptions: {
      title: 'Playlists',
      //   headerShown: false,
      gestureEnabled: false
    },
  },
  Playlist: {
    screen: Playlist,
    navigationOptions: {
      title: 'Faixas da Playlist',
      //   headerShown: false,
      gestureEnabled: false
    },
  },

}, {
  initialRouteName: ('Home'),


});

const Navigator = createAppContainer(mainNavigatorStack)
export default Navigator