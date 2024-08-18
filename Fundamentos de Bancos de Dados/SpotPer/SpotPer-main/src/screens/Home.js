import React, { Component } from 'react'

import {
    View,
    SafeAreaView,
    StyleSheet,
    Text,
    Pressable,
    Modal,
    TextInput
} from 'react-native'

// senha: !CamInho_da_LuZ#

const initialState = {
    modalVisible: false,
    nomePlaylist: ''
}
export default class Home extends Component {
    state = {
        ...initialState
    }
    render() {
        return (
            <SafeAreaView style={styles.safeArea}>
                <Modal
                    animationType="slide"
                    transparent={true}
                    visible={this.state.modalVisible}
                    onRequestClose={() => {
                        Alert.alert("Modal has been closed.");
                        this.setState({ modalVisible: true });
                    }}
                >
                    <View style={{
                        flex: 1,
                        backgroundColor: '#000000bb',
                        justifyContent: 'center',
                        alignItems: 'center'
                    }}>
                        <TextInput
                            style={styles.input}
                            autoFocus
                            onChangeText={(text) => {
                                this.setState({ nomePlaylist: text })
                            }}
                            // value={number}
                            placeholder="Nome Playlist..."
                        // keyboardType="numeric"
                        />
                        <View style={{ flexDirection: 'row' }}>
                            <Pressable
                                onPress={() => {
                                    this.setState({ modalVisible: false })
                                }}
                                style={styles.cancelButton}>
                                <Text style={styles.playlistNome}>Cancelar</Text>
                            </Pressable>

                            <Pressable
                                onPress={() => {
                                    this.setState({ modalVisible: false })
                                    fetch('http://127.0.0.1:5000/playlist/', {
                                        method: 'POST',
                                        body: JSON.stringify({
                                            nomePlaylist: this.state.nomePlaylist
                                        })
                                    }).then((res) => {
                                        res.json().then((json) => {
                                            this.props.navigation.navigate("Albums", {
                                                nomePlaylist: this.state.nomePlaylist,
                                                codigoPlaylist: json.codigo_playlist
                                            });
                                        })

                                    })


                                }}
                                style={styles.nextButton}>
                                <Text style={styles.playlistNome}>Próximo</Text>
                            </Pressable>
                        </View>
                    </View>

                </Modal>
                <View style={styles.container}>
                    <Pressable
                        onPress={() => {
                            this.setState({ modalVisible: !this.state.modalVisible })
                        }}
                        style={styles.createPlaylistButton}
                    >
                        <Text style={styles.buttonText}>Criar Playlist</Text>
                    </Pressable>

                    <Pressable
                        onPress={() => {
                            console.log("Create view pressed.")
                            this.props.navigation.navigate("AllPlaylists");
                        }}
                        style={[styles.createPlaylistButton, , {backgroundColor: '#555'}]}
                    >
                        <Text style={[styles.buttonText]}>Editar Playlists</Text>
                    </Pressable>
                </View>
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
    createPlaylistButton: {
        backgroundColor: '#555',
        width: '90%',
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 10,
        margin: 12,
        padding: 25,

    },
    buttonText: {
        fontSize: 18,
        color: '#fff',
        fontWeight: 'bold'
    },
    input: {
        width: '90%',
        height: 50,
        backgroundColor: '#fff',
        borderRadius: 8,
        paddingHorizontal: 8
    },
    nextButton: {
        backgroundColor: '#4A5B49',
        height: 45,
        width: '40%',
        justifyContent: 'center',
        alignItems: 'center',
        marginTop: 12,
        borderRadius: 10,
        fontSize: 16,

    },
    cancelButton: {
        backgroundColor: 'grey',
        height: 45,
        width: '40%',
        justifyContent: 'center',
        alignItems: 'center',
        marginTop: 12,
        borderRadius: 10,
        fontSize: 12,
        marginRight: 12

    },
    playlistNome: {
        fontSize: 18,
        color: '#fff',
        fontWeight: 'bold'
    }
})