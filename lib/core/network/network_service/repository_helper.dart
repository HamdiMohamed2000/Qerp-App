import 'package:dartz/dartz.dart';
import 'package:qerp_app/core/network/network_service/exceptions.dart';
import 'package:qerp_app/core/network/network_service/failure.dart';

mixin RepositoryHelper {
  Future<Either<Failure,T>> handleEither<T>(Future<T> Function() call)async{
    try{
      final result = await call();
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(message: e.message));
    }on ValidationException catch(e){
      return Left(ServerFailure(message: e.message));
    }on NetworkException catch(e){
      return Left(NetworkFailure(message: e.message));
    }catch(e){
      return Left(ServerFailure(message: "Unexpected error $e"));
    }
  }
}