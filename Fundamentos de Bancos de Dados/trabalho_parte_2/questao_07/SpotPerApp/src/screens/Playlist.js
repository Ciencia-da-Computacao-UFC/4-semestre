import React, { Component } from 'react'

import {
    View,
    SafeAreaView,
    StyleSheet,
    Text,
    Pressable,
    FlatList,
    Image,
    Touchable,
    TouchableOpacity,

} from 'react-native'

const playlistTracks = [
    {
        nome_album: 'Album A',
        numero_faixa: 1,
        descricao: 'Faixa 1'
    },
    {
        nome_album: 'Album B',
        numero_faixa: 2,
        descricao: 'Faixa 2'
    },
    {
        nome_album: 'Album C',
        numero_faixa: 3,
        descricao: 'Faixa 3'
    },
    {
        nome_album: 'Album D',
        numero_faixa: 6,
        descricao: 'Faixa 6'
    },
]

const initialState = {
    playlistTracks: []
}
export default class Playlist extends Component {
    state = {
        ...initialState
    }
    deleteTrackFromPlaylist = (codigoPlaylist, codigoAlbum, numeroFaixa) => {
        console.log(codigoPlaylist, codigoAlbum, numeroFaixa)
        fetch(`http://127.0.0.1:5000/playlist/${codigoPlaylist}/`, {
            method: 'DELETE',
            body: JSON.stringify({
                codigo_album: codigoAlbum,
                numero_faixa: numeroFaixa
            })
        }).then((res) => {
            this.fetchAllTracksFromPlaylist()

        })
    }
    playlistItem = (playlist) => {
        return (
            <View style={styles.playlistHolder}>
                <View style={{ flexDirection: 'row' }}>
                    <Text style={{ paddingRight: 8 }}>{playlist.nome_album + '.'}</Text>
                    <Text>{playlist.nome_faixa}</Text>
                </View>
                <TouchableOpacity
                    onPress={() => {
                        console.log('deleting')
                        this.deleteTrackFromPlaylist(this.props.navigation.state.params.codigoPlaylist, playlist.codigo_album, playlist.numero_faixa)
                    }}
                >
                    <Image
                        style={styles.addButton}
                        source={require('../../assets/icons/delete-button.png')}
                    />
                </TouchableOpacity>
            </View>
        )
    }
    fetchAllTracksFromPlaylist = () => {
        fetch(`http://127.0.0.1:5000/playlist/${this.props.navigation.state.params.codigoPlaylist}/`, {
            method: 'GET',
        }).then((res) => {
            res.json().then((json) => {
                this.setState({ playlistTracks: json })
            })
        })
    }
    componentDidMount() {
        this.fetchAllTracksFromPlaylist()
        this.willFocusSubscription = this.props.navigation.addListener(
            'willFocus',
            () => {
              this.fetchAllTracksFromPlaylist();
            }
          );
    }
    componentWillUnmount() {
        this.willFocusSubscription.remove();
      }
    // componentDidUpdate(){
    
    //     this.fetchAllTracksFromPlaylist()

    // }

    render() {
        return (
            <SafeAreaView style={styles.safeArea}>
                <TouchableOpacity 
                onPress={() => {
                    this.props.navigation.navigate("Albums", {
                        nomePlaylist: this.props.navigation.state.params.nomePlaylist,
                        codigoPlaylist: this.props.navigation.state.params.codigoPlaylist
                    });
                }}
                
                style={styles.addSongsButton}>
                    <Text style={styles.addSongsText}>Adicionar Músicas</Text>
                </TouchableOpacity>
                <FlatList
                    data={this.state.playlistTracks}
                    renderItem={({ item }) => this.playlistItem(item)}
                    numColumns={1}
                    contentContainerStyle={styles.flatlist}
                    keyExtractor={item => (item.codigo_album.toString() + item.numero_faixa.toString())}
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
    addSongsButton: {
        backgroundColor: '#555',
        padding: 12,
        width: '80%',
        borderRadius: 6,
        justifyContent: 'center',
        alignItems: 'center',
        alignSelf: 'center',
        margin: 20

    },
    addSongsText: {
        fontSize: 18,
        color: '#fff',
        fontWeight: 'bold'

    }

})