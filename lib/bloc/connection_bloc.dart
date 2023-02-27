import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';

part 'connection_event.dart';
part 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, Connection_State> {

  final Connectivity  _connectivity = Connectivity();

  StreamSubscription? connectivitySub;

  ConnectionBloc() : super(ConnectionInitial()) {
    on<ConnectionLostEvent>((event, emit) =>emit(ConnectionLost()));
    on<ConnectionGainEvent>((event, emit) => emit(ConnectionGain()));
    connectivitySub = _connectivity.onConnectivityChanged.listen((result) {
      if (result ==ConnectivityResult.mobile||result==ConnectivityResult.wifi){
        add(ConnectionGainEvent());
      }else{
        add(ConnectionLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySub?.cancel();
    return super.close();
  }
}
