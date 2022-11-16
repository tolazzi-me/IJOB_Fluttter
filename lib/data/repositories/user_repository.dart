import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/model/user_location_model.dart';
import 'package:ijob_app/core/model/user_model.dart';
import 'package:ijob_app/data/remote/user_remote_data_source.dart';

abstract class UserRepository {
  Future<Either<Exception, String>> login(String email, String password);
  Future<Either<Exception, User>> me();
  Future<Either<Exception, User>> store(User user);
  Future<Either<Exception, User>> updateMaxDistance(double maxDistance, String userId);
  Future<Either<Exception, User>> changeUserType(int type, String userId);
  Future<Either<Exception, UserLocation>> storeLocation(double latitude, double longitude);
}

class UserRepositoryImp implements UserRepository {
  final UserRemoteDataSource _remoteDataSource = Get.find(tag: (UserRemoteDataSource).toString());

  @override
  Future<Either<Exception, String>> login(String email, String password) {
    return _remoteDataSource.login(email, password);
  }

  @override
  Future<Either<Exception, User>> me() {
    return _remoteDataSource.me();
  }

  @override
  Future<Either<Exception, User>> store(User user) {
    return _remoteDataSource.store(user);
  }

  @override
  Future<Either<Exception, User>> updateMaxDistance(double maxDistance, String userId) {
    return _remoteDataSource.updateMaxDistance(maxDistance, userId);
  }

  @override
  Future<Either<Exception, User>> changeUserType(int type, String userId) {
    return _remoteDataSource.changeUserType(type, userId);
  }

  @override
  Future<Either<Exception, UserLocation>> storeLocation(double latitude, double longitude) {
    return _remoteDataSource.storeLocation(latitude, longitude);
  }
}
