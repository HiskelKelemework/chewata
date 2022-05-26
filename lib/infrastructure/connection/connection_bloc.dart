import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart';
part 'connection_event.dart';
part 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnEvent, ConnState> {
  final Socket _socket = io(
    "http://localhost:3000",
    OptionBuilder().setTransports(['websocket']).build(),
  );

  ConnectionBloc() : super(Connecting()) {
    on<Connect>(_onConnect);
    on<Disconnect>(_onDisconnect);
    on<_Connecting>((_, Emitter emit) => emit(Connecting()));
    on<_Connected>((_, Emitter emit) => emit(Connected()));
    on<_Disconnected>((_, Emitter emit) => emit(Disconnected()));
    on<_ConnectionError>((_, Emitter emit) => emit(ErrorOccured()));

    _socket.onConnect((_) => add(_Connected()));
    _socket.onDisconnect((_) => add(_Disconnected()));
    _socket.onError((err) => add(_ConnectionError()));
    _socket.onReconnectAttempt((_) => add(_Connecting()));
  }

  @override
  Future<void> close() {
    _socket.close();
    return super.close();
  }

  void _onConnect(Connect event, Emitter emit) {
    emit(Connecting());
    _socket.connect();
  }

  void _onDisconnect(Disconnect event, Emitter emit) {
    _socket.disconnect();
    emit(Disconnected());
  }

  void addListener(String eventName, Function(dynamic) handler) {
    _socket.on(eventName, handler);
  }

  void removeListener(String eventName) {
    _socket.off(eventName);
  }
}
