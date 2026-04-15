import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final Map<String,dynamic>? error;

  const Failure({required this.message,this.error});
  @override
  List<Object?> get props => [message,error];
}

class ServerFailure extends Failure{
  const ServerFailure({required super.message,super.error});

}

class NetworkFailure extends Failure{
  const NetworkFailure({required super.message});
}

class CacheFailure extends Failure{
  const CacheFailure({required super.message});

}