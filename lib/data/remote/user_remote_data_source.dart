import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ijob_app/core/base/base_remote_source.dart';
import 'package:ijob_app/core/model/user_model.dart';
import '../../utils/constants.dart';

abstract class UserRemoteDataSource {
  Future<Either<Exception, String>> login(String email, String password);
  Future<Either<Exception, User>> me();
}

class UserRemoteDataSourceImp extends BaseRemoteSource
    implements UserRemoteDataSource {
  @override
  Future<Either<Exception, String>> login(String email, String password) {
    const endPoint = '${Utils.baseUrl}/user/authenticate';
    final dioCall =
        dioClient.post(endPoint, data: {'email': email, 'password': password});

    return callApiWithErrorParser(dioCall).then((resultOrError) {
      return resultOrError.fold(
          (error) => left(error), (response) => right(response.data['token']));
    });
  }

  @override
  Future<Either<Exception, User>> me() {
    const endPoint = '${Utils.baseUrl}/user/me';
    final dioCall = dioClient.get(endPoint);
    return callApiWithErrorParser(dioCall).then((resultOrError) {
      return resultOrError.fold((error) => left(error),
          (response) => right(_parseUserFromJson(response)));
    });
  }

  User _parseUserFromJson(Response<dynamic> response) {
    return User.fromJson(response.data);
  }
}
