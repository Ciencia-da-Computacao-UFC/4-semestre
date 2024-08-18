import React, { Component } from 'react'

import {
    View,
    SafeAreaView,
    StyleSheet,
    Text,
    Pressable,
    FlatList,
    Image
} from 'react-native'

const allplaylists = [
    {
        codigo_playlist: 1,
        nome: 'Playlist 1'
    },
    {
        codigo_playlist: 2,
        nome: 'Playlist 2'
    },
    {
        codigo_playlist: 3,
        nome: 'Playlist 3'
    },
    {
        codigo_playlist: 4,
        nome: 'Playlist 4'
    },
    {
        codigo_playlist: 5,
        nome: 'Playlist 5'
    },
    {
        codigo_playlist: 6,
        nome: 'Playlist 6'
    },
]

const initialState = {
    allPlaylists: []
}
export default class AllPlaylists extends Component {
    state = {
        ...initialState
    }
    playlistItem = (playlist) => {
        return (
            <Pressable
                onPress={() => {
                    this.props.navigation.navigate("Playlist", {
                        codigoPlaylist: playlist.codigo_playlist,
                        nomePlaylist: playlist.nome
                    });
                }}
                style={styles.playlistHolder}>
                <View style={{ flexDirection: 'row' }}>
                    <Text style={{ paddingRight: 8, color: '#fff', fontSize: 15, fontWeight: 'bold' }}>{playlist.nome + '.'}</Text>
                </View>
                <Image
                    style={styles.editButton}
                    source={require('../../assets/icons/edit-button.png')}
                />
            </Pressable>
        )
    }
    componentDidMount() {
        fetch('http://127.0.0.1:5000/playlist', {
            method: 'GET',
        }).then((res) => {
            res.json().then((json) => {
                this.setState({ allPlaylists: json })
            })
        })
    }
    render() {
        return (
            <SafeAreaView style={styles.safeArea}>
                <FlatList
                    data={this.state.allPlaylists}
                    renderItem={({ item }) => this.playlistItem(item)}
                    numColumns={1}
                    contentContainerStyle={styles.flatlist}
                    keyExtractor={item => item.codigo_playlist.toString()}
                // ListEmptyComponent={this.emptyProjectsMessage}
                />
            </SafeAreaView>
        )
    }
}

const styles = StyleSheet.create({
    safeArea: {
        flex: 1
    },
    container: {
        flex: 1,
        alignItems: 'center',
        justifyContent: 'center',
        // backgroundColor: 'red'
    },
    playlistHolder: {
        backgroundColor: '#555',
        height: 60,
        width: '100%',
        marginVertical: 1,
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'space-between',
        paddingHorizontal: 20
    },
    editButton: {
        height: 30,
        width: 30,
        resizeMode: 'contain'
    },

})