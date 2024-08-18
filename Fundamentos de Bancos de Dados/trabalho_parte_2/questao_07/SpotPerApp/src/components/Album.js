import React from 'react'

import {
    View,
    Text,
    Pressable,
    StyleSheet
} from 'react-native'

const Album = (props) => {
    return(
        <View style={styles.albumHolder}>
            <Text>Test</Text>
        </View>
    )
}

const styles = StyleSheet.create({
    albumHolder:{
        marginTop: 80,
        height: 80,
        width: '100%',
        backgroundColor: 'blue'
    }
})

export default Album