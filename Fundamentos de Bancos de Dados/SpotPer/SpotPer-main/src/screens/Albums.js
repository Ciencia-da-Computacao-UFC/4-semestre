import React, { Component } from 'react'

import {
    View,
    SafeAreaView,
    StyleSheet,
    Text,
    Pressable,
    FlatList,
    Dimensions
} from 'react-native'


const windowWidth = Dimensions.get('window').width

const albums = [
    {
        codigo_album: 1,
        descricao: 'Album 1'
    },
    {
        codigo_album: 2,
        descricao: 'Album 2'
    },
    {
        codigo_album: 3,
        descricao: 'Album 3'
    },
    {
        codigo_album: 4,
        descricao: 'Album 4'
    },
    {
        codigo_album: 5,
        descricao: 'Album 5'
    },

]
const initialState = {
    albums: []
}
export default class Albums extends Component {
    state = {
        ...initialState
    }

    albumItem = (album) => {
        return (
            <Pressable
                onPress={() => {
                    console.log(`Album ${album.descricao} pressed `)
                    this.props.navigation.navigate("Tracks", {
                        codigo_album: album.codigo_album,
                        codigoPlaylist: this.props.navigation.state.params.codigoPlaylist
                    });
                }}
            >
                <View style={styles.albumHolder}>
                    <Text style={styles.albumTitle}>{album.descricao}</Text>
                </View>
            </Pressable>
        )
    }

    fethAllAlbums = () => {
        fetch('http://127.0.0.1:5000/all_albums', {
            method: 'GET',
        }).then((res) => {
            res.json().then((json) => {
                console.log(json)
                this.setState({ albums: json })
            })
        })
    }

    componentDidMount() {
        this.fethAllAlbums()
    }
    render() {
        return (
            <SafeAreaView style={styles.safeArea}>
                <FlatList
                    data={this.state.albums}
                    renderItem={({ item }) => this.albumItem(item)}
                    numColumns={2}
                    contentContainerStyle={styles.flatlist}
                    keyExtractor={item => item.codigo_album.toString()}
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
    albumHolder: {
        height: (windowWidth / 2) - 8,
        width: (windowWidth / 2) - 8,
        borderWidth: 2,
        backgroundColor: '#555',
        margin: 2,
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 10,
        borderColor: '#777',
        borderWidth: 1
    },
    albumTitle: {
        color: '#fff',
        fontSize: 20
    },
    flatlist: {
        // backgroundColor: 'red',
        alignItems: 'center',
        // marginTop: 40
    }

})