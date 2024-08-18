import MSSQL from 'react-native-mssql';

const config = {
    server: '127.0.0.1', //ip address of the mssql database
    username: 'sa', //username to login to the database
    password: '!CamInho_da_LuZ#', //password to login to the database
    database: 'BDSpotPer', //the name of the database to connect to
    // port: 1234, //OPTIONAL, port of the database on the server
    // timeout: 5, //OPTIONAL, login timeout for the server
}

export async function getAllAlbums(){
    const connected = await MSSQL.connect(config);
    
    // const query = 'Select * from Album'
    // const result = await MSSQL.executeQuery(query);
    const closed = await MSSQL.close();
    return result

}

// const connected = await MSSQL.connect(config);


// const result = await MSSQL.executeQuery(query);

// const closed = await MSSQL.close();