from flask import Flask
from flask_socketio import SocketIO, emit, join_room, leave_room
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
socketio = SocketIO(app, cors_allowed_origins="*")

@socketio.on_error_default  # Captura todos los espacios de nombres sin un manejador de errores registrado.
def default_error_handler(e):
    print(f'Ha ocurrido un error: {str(e)}')
    emit('error', {'error': 'Ocurrió un error inesperado'})

@app.route('/')
def index():
    return "Servidor de señalización para WebRTC"

# Evento de conexión WebSocket
@socketio.on('connect')
def handle_connect():
    print('Cliente conectado')

# Evento de desconexión WebSocket
@socketio.on('disconnect')
def handle_disconnect():
    print('Cliente desconectado')

# Unirse a una sala específica
@socketio.on('join')
def on_join(data):
    try:
        userId = data['userId']
        room = data['room']
        if not userId or not room:
            raise ValueError('Faltan datos necesarios: userId o room.')
        join_room(room)
        print(f'{userId} se ha unido a la sala: {room}')
        #emit('joined_room', {'message': f'{userId} se ha unido a la sala {room}'})
        emit('joined_room', {'message': f'{userId} se ha unido a la sala {room}'}, to=room)
    except KeyError as e:
        emit('error', {'error': f'Falta el campo {e.args[0]}'})
    except ValueError as e:
        emit('error', {'error': str(e)})


# Manejar el envío de oferta SDP
@socketio.on('send_offer')
def handle_send_offer(json):
    try:
        room = json['target']
        emit('receive_offer', json, room=room)
    except KeyError as e:
        emit('error', {'error': f'Falta el campo {e.args[0]}'})

# Manejar el envío de respuesta SDP
@socketio.on('send_answer')
def handle_send_answer(json):
    try:
        room = json['target']
        emit('receive_answer', json, room=room)
    except KeyError as e:
        emit('error', {'error': f'Falta el campo {e.args[0]}'})

# Manejar el envío de candidatos ICE
@socketio.on('send_candidate')
def handle_send_candidate(json):
    try:
        room = json['target']
        emit('receive_candidate', json, room=room)
    except KeyError as e:
        emit('error', {'error': f'Falta el campo {e.args[0]}'})

if __name__ == '__main__':
    socketio.run(app, debug=True, host='0.0.0.0', port=80)
