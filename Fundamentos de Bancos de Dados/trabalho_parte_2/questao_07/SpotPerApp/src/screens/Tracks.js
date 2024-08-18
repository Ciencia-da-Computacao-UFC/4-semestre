import React, { Component } from 'react'

import {
    View,
    SafeAreaView,
    StyleSheet,
    Text,
    Pressable,
    FlatList,
    Image,
    TouchableOpacity
} from 'react-native'

const tracks = [
    {
        numero_faixa: 1,
        descricao: 'Faixa 1'
    },
    {
        numero_faixa: 2,
        descricao: 'Faixa 2'
    },
    {
        numero_faixa: 3,
        descricao: 'Faixa 3'
    },
    {
        numero_faixa: 4,
        descricao: 'Faixa 4'
    },
    {
        numero_faixa: 5,
        descricao: 'Faixa 5'
    },
    {
        numero_faixa: 6,
        descricao: 'Faixa 6'
    },
]

const initialState = {
    tracks: [],
    playlistTracks: []
}

export default class AllTracks extends Component {
    state = {
        ...initialState
    }
    trackItem = (track) => {
        return (
            <View style={styles.trackHolder}>
                <View style={{ flexDirection: 'row' }}>
                    <Text style={{ paddingRight: 8 }}>{track.numero_faixa + '.'}</Text>
                    <Text>{track.descricao}</Text>
                </View>
                <TouchableOpacity
                    onPress={() => {
                        if (!track.isAdded) {
                            this.addTrackToPlaylist(track)
                        }
                    }}
                >
                    {!track.isAdded &&
                        <Image
                            style={styles.addButton}
                            source={require('../../assets/icons/add-button.png')}
                        />
                    }
                    {track.isAdded &&
                    <Text>Adicionada</Text>
                    
                    }
                </TouchableOpacity>
            </View>
        )
    }

    fetchAllSongsFromPlaylist = () => {
        fetch(`http://127.0.0.1:5000/playlist/${this.props.navigation.state.params.codigoPlaylist}/`, {
            method: 'GET',
        }).then((res) => {
            res.json().then((json) => {
                console.log('all from playlist', json)
                this.setState({ playlistTracks: json }, () => {
                    let tracksFinal = [...this.state.tracks]

                    tracksFinal.forEach((track) => {
                        for (let i = 0; i < this.state.playlistTracks.length; i++) {
                            if (this.state.playlistTracks[i].codigo_album == this.props.navigation.state.params.codigo_album &&
                                track.numero_faixa == this.state.playlistTracks[i].numero_faixa) {
                                track.isAdded = true;
                            }
                        }
                        this.setState({ tracks: tracksFinal })

                    })
                })
            })
        })
    }

    fetchAllTracksForAlbum = () => {
        fetch(`http://127.0.0.1:5000/album/${this.props.navigation.state.params.codigo_album}`, {
            method: 'GET',
        }).then((res) => {
            res.json().then((json) => {
                json.forEach(track => {
                    track.isAdded = false
                });
                this.setState({ tracks: json }, () => {
                    this.fetchAllSongsFromPlaylist()
                })
            })
        })
    }

    addTrackToPlaylist = (track) => {
        fetch(`http://127.0.0.1:5000/playlist/${this.props.navigation.state.params.codigoPlaylist}/`, {
            method: 'POST',
            body: JSON.stringify({
                codigo_album: this.props.navigation.state.params.codigo_album,
                numero_faixa: track.numero_faixa
            })
        }).then(() => {
            this.fetchAllSongsFromPlaylist()

        })
    }
    componentDidMount() {
        this.fetchAllTracksForAlbum()

    }
    render() {
        return (
            <SafeAreaView style={styles.safeArea}>
                <FlatList
                    data={this.state.tracks}
                    renderItem={({ item }) => this.trackItem(item)}
                    numColumns={1}
                    contentContainerStyle={styles.flatlist}
                    keyExtractor={item => (this.props.navigation.state.params.codigo_album.toString() +item.numero_faixa.toString())}
                    ListEmptyComponent={() => {
                        return (<Text style={styles.emptyTracks}>Nenhuma Faixa aqui.</Text>)
                    }}
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
    trackHolder: {
        backgroundColor: '#ddd',
        height: 60,
        width: '100%',
        marginVertical: 1,
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'space-between',
        paddingHorizontal: 20
    },
    addButton: {
        height: 30,
        width: 30,
        resizeMode: 'contain'
    },
    emptyTracks: {
        fontSize: 18,
        alignSelf: 'center',
        marginTop: 40,

    }

})