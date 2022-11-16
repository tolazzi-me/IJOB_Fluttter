import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ijob_app/core/model/like_model.dart';
import 'package:ijob_app/core/model/service_model.dart';

import '../../core/base/base_remote_source.dart';
import '../../utils/constants.dart';

abstract class ServiceRemoteSource {
  Future<Either<Exception, List<Service>>> getServices();
  Future<Either<Exception, List<Service>>> getServicesNear();
  Future<Either<Exception, Like>> likeService(String serviceId);
}

class ServiceRemoteSourceImp extends BaseRemoteSource implements ServiceRemoteSource {
  @override
  Future<Either<Exception, List<Service>>> getServices() {
    const endPoint = '${Utils.baseUrl}/service';

    final dioCall = dioClient.get(endPoint);
    return callApiWithErrorParser(dioCall).then((servicesOrError) => servicesOrError.fold((error) {
          print('$error url: $endPoint');
          return left(error);
        }, (response) => right(_parseListServicesFromJson(response))));
  }

  List<Service> _parseListServicesFromJson(Response response) {
    return (response.data['data'] as List).map((e) => Service.fromJson(e)).toList();
  }

  @override
  Future<Either<Exception, List<Service>>> getServicesNear() {
    const endPoint = '${Utils.baseUrl}/service/near';

    final dioCall = dioClient.get(endPoint);
    return callApiWithErrorParser(dioCall).then((servicesOrError) => servicesOrError.fold((error) {
          print('$error url: $endPoint');
          return left(error);
        }, (response) => right(_parseListServicesFromJson(response))));
  }

  @override
  Future<Either<Exception, Like>> likeService(String serviceId) {
    final endPoint = '${Utils.baseUrl}/service/like/$serviceId';

    final dioCall = dioClient.post(endPoint);
    return callApiWithErrorParser(dioCall).then(
      (likedOrError) => likedOrError.fold(
        (error) {
          print('$error url: $endPoint');
          return left(error);
        },
        (response) => right(
          Like.fromJson(response.data['data']),
        ),
      ),
    );
  }
}
