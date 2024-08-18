from flask import Flask, jsonify, request
from datetime import date
import pymssql


database = ['127.0.0.1', 'sa', '!CamInho_da_LuZ#', "BDSpotPer"]

app = Flask(__name__)

# senha: !CamInho_da_LuZ#


@app.route('/')
def delete():
    # print(date.today())
    return "home"


@app.route('/all_albums', methods=["GET"])
def get_albums():
    conn = pymssql.connect(*database)
    cursor = conn.cursor(as_dict=True)
    cursor.execute('select * from album')
    result = []
    for row in cursor:
        temp_j = {
            "codigo_album": row['codigo_album'],
            "descricao": row['descricao']
        }
        result.append(temp_j)
    conn.close()
    # print(result)
    return jsonify(result)


@app.route('/album/<int:codigo_album>/')
def getAllTracks(codigo_album):
    conn = pymssql.connect(*database)
    cursor = conn.cursor(as_dict=True)
    cursor.execute(
        f'select * from faixa f where f.codigo_album = {codigo_album}')
    result = []
    for row in cursor:
        temp_j = {
            "numero_faixa": row['numero_faixa'],
            "descricao": row['descricao']
        }
        result.append(temp_j)
    conn.close()
    # print(result)
    return jsonify(result)


@app.route('/playlist/', methods=['POST'])
def createPlaylist():
    playlistNome = eval(request.data)['nomePlaylist']
    conn = pymssql.connect(*database)
    cursor = conn.cursor(as_dict=True)
    cursor.execute(
        f'insert into playlist OUTPUT Inserted.codigo_playlist values (\'{playlistNome}\', \'{date.today()}\', NULL)')
       
    codigoPlaylist = cursor.fetchone()
    conn.commit()
    conn.close()
    return codigoPlaylist


@app.route('/playlist', methods=['GET'])
def getAllPlaylists():
    conn = pymssql.connect(*database)
    cursor = conn.cursor(as_dict=True)
    cursor.execute('select * from playlist')
    result = []
    for row in cursor:
        temp_j = {
            "codigo_playlist": row['codigo_playlist'],
            "nome": row['nome']
        }
        result.append(temp_j)
    conn.close()
    # print(result)
    return jsonify(result)

@app.route('/playlist/<int:codigo_playlist>/', methods=['POST'])
def addTrackToPlaylist(codigo_playlist):
    codigoAlbum = eval(request.data)['codigo_album']
    numeroFaixa = eval(request.data)['numero_faixa'] 
    conn = pymssql.connect(*database)
    cursor = conn.cursor(as_dict=True)
    cursor.execute(
        f'insert into playlist_faixa values ({codigo_playlist}, {codigoAlbum}, {numeroFaixa}, 0, NULL)')
       
    conn.commit()
    conn.close()
    return ""

@app.route('/playlist/<int:codigo_playlist>/', methods=['GET'])
def getAllTracksFromPlaylist(codigo_playlist):
    conn = pymssql.connect(*database)
    cursor = conn.cursor(as_dict=True)
    cursor.execute(
        f'select a.codigo_album, f.numero_faixa, a.descricao as nome_album, f.descricao as nome_faixa from (playlist_faixa pf join faixa f on f.codigo_album = pf.codigo_album and f.numero_faixa = pf.numero_faixa) \
             join album a on a.codigo_album = f.codigo_album where codigo_playlist = {codigo_playlist}')
    result = []
    for row in cursor:
        temp_j = {
            "codigo_album": row['codigo_album'],
            "numero_faixa": row['numero_faixa'],
            "nome_album": row['nome_album'],
            "nome_faixa": row['nome_faixa']
        }
        result.append(temp_j)
       
    conn.commit()
    conn.close()
    return jsonify(result)

@app.route('/playlist/<int:codigo_playlist>/', methods=['DELETE'])
def deleteTrackFromPlaylist(codigo_playlist):
    codigoAlbum = eval(request.data)['codigo_album']
    numeroFaixa = eval(request.data)['numero_faixa'] 
    conn = pymssql.connect(*database)
    cursor = conn.cursor(as_dict=True)
    cursor.execute(
        f'delete from playlist_faixa where codigo_playlist = {codigo_playlist} and codigo_album = {codigoAlbum} and numero_faixa = {numeroFaixa}')
       
    conn.commit()
    conn.close()
    return "Faixa apagada com sucesso."







# @app.route('/all_albums', methods=["POST"])
# def create_albums():
#     print("Creating Album")
#     cursor = conn.cursor(as_dict=True)
#     cursor.execute('select * from album')
#     result = []
#     for row in cursor:
#         temp_j = {
#             "codigo_album": row['codigo_album'],
#             "descricao": row['descricao']
#         }
#         result.append(row)
#     # print(result)
#     return ""
