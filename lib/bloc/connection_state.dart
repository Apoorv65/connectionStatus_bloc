part of 'connection_bloc.dart';


abstract class Connection_State {}

class ConnectionInitial extends Connection_State {}

class ConnectionLost extends Connection_State {}

class ConnectionGain extends Connection_State {}
