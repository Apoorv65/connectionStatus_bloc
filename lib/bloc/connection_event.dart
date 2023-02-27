part of 'connection_bloc.dart';

abstract class ConnectionEvent {}

class ConnectionLostEvent extends ConnectionEvent {}

class ConnectionGainEvent extends ConnectionEvent {}

