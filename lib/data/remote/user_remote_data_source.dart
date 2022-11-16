import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ijob_app/core/base/base_remote_source.dart';
import 'package:ijob_app/core/model/user_model.dart';
import '../../core/model/user_location_model.dart';
import '../../utils/constants.dart';

abstract class UserRemoteDataSource {
  Future<Either<Exception, String>> login(String email, String password);
  Future<Either<Exception, User>> me();
  Future<Either<Exception, User>> store(User user);
  Future<Either<Exception, User>> updateMaxDistance(double maxDistance, String userId);
  Future<Either<Exception, User>> changeUserType(int type, String userId);
  Future<Either<Exception, UserLocation>> storeLocation(double latitude, double longitude);
}

class UserRemoteDataSourceImp extends BaseRemoteSource implements UserRemoteDataSource {
  @override
  Future<Either<Exception, String>> login(String email, String password) {
    const endPoint = '${Utils.baseUrl}/user/authenticate';
    final dioCall = dioClient.post(endPoint, data: {'email': email, 'password': password});

    return callApiWithErrorParser(dioCall).then((resultOrError) {
      return resultOrError.fold((error) => left(error), (response) => right(response.data['token']));
    });
  }

  @override
  Future<Either<Exception, User>> me() {
    const endPoint = '${Utils.baseUrl}/user/me';
    final dioCall = dioClient.get(endPoint);
    return callApiWithErrorParser(dioCall).then((resultOrError) {
      return resultOrError.fold((error) => left(error), (response) => right(_parseUserFromJson(response)));
    });
  }

  User _parseUserFromJson(Response<dynamic> response) {
    return User.fromJson(response.data);
  }

  @override
  Future<Either<Exception, User>> store(User user) {
    const endPoint = '${Utils.baseUrl}/user';
    final dioCall = dioClient.post(endPoint, data: user.toJson());
    return callApiWithErrorParser(dioCall).then((resultOrError) {
      return resultOrError.fold((error) => left(error), (response) {
        return right(User.fromJson(response.data['data']['user']));
      });
    });
  }

  @override
  Future<Either<Exception, User>> updateMaxDistance(double maxDistance, String userId) {
    final endPoint = '${Utils.baseUrl}/user/$userId';
    Map<String, dynamic> data = {
      'maxDistance': maxDistance.toInt(),
    };
    final dioCall = dioClient.patch(endPoint, data: data);
    return callApiWithErrorParser(dioCall).then((resultOrError) {
      return resultOrError.fold((error) => left(error), (response) {
        return right(User.fromJson(response.data));
      });
    });
  }

  @override
  Future<Either<Exception, User>> changeUserType(int type, String userId) {
    final endPoint = '${Utils.baseUrl}/user/$userId';
    Map<String, dynamic> data = {
      'userActiveType': type,
    };
    final dioCall = dioClient.patch(endPoint, data: data);
    return callApiWithErrorParser(dioCall).then((resultOrError) {
      return resultOrError.fold((error) => left(error), (response) {
        return right(User.fromJson(response.data));
      });
    });
  }

  @override
  Future<Either<Exception, UserLocation>> storeLocation(double latitude, double longitude) {
    const endPoint = '${Utils.baseUrl}/location';
    Map<String, dynamic> data = {
      'coordinates': [longitude, latitude],
    };
    final dioCall = dioClient.post(endPoint, data: data);
    return callApiWithErrorParser(dioCall).then((resultOrError) {
      return resultOrError.fold((error) => left(error), (response) {
        return right(UserLocation.fromJson(response.data['data']));
      });
    });
  }
}
