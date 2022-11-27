import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:ijob_app/core/base/base_remote_source.dart';
import 'package:ijob_app/core/model/user_model.dart';
import 'package:mime/mime.dart';
import '../../core/model/user_location_model.dart';
import '../../utils/constants.dart';

abstract class UserRemoteDataSource {
  Future<Either<Exception, String>> login(String email, String password);
  Future<Either<Exception, User>> me();
  Future<Either<Exception, User>> store(User user);
  Future<Either<Exception, User>> updateMaxDistance(double maxDistance, String userId);
  Future<Either<Exception, User>> changeUserType(int type, String userId);
  Future<Either<Exception, UserLocation>> storeLocation(double latitude, double longitude);
  Future<Either<Exception, User>> storeAvatar(File avatar);
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

  @override
  Future<Either<Exception, User>> storeAvatar(File avatar) async {
    String fileName = avatar.path.split('/').last;
    String? mimeType = lookupMimeType(fileName) ?? 'application/octet-stream';
    String mime = mimeType.split('/')[0];
    String type = mimeType.split('/')[1];
    FormData formData = FormData.fromMap({
      "avatar": await MultipartFile.fromFile(
        avatar.path,
        filename: fileName,
        contentType: MediaType(mime, type),
      ),
    });
    const endPoint = '${Utils.baseUrl}/user/avatar';

    final dioCall = dioClient.post(
      endPoint,
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );
    return callApiWithErrorParser(dioCall).then(
      (servicePhotoOrError) => servicePhotoOrError.fold((error) {
        print('$error url: $endPoint');
        return left(error);
      }, (response) {
        return right(
          User.fromJson(response.data['data']),
        );
      }),
    );
  }
}
