import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/model/user_model.dart';
import 'package:ijob_app/data/remote/user_remote_data_source.dart';

abstract class UserRepository {
  Future<Either<Exception, String>> login(String email, String password);
  Future<Either<Exception, User>> me();
  Future<Either<Exception, User>> store(User user);
}

class UserRepositoryImp implements UserRepository {
  final UserRemoteDataSource _remoteDataSource =
      Get.find(tag: (UserRemoteDataSource).toString());

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
}
