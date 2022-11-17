import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ijob_app/core/model/like_model.dart';
import 'package:ijob_app/core/model/service_model.dart';
import 'package:ijob_app/core/model/service_photo_model.dart';

import '../../core/base/base_remote_source.dart';
import '../../utils/constants.dart';

abstract class ServiceRemoteSource {
  Future<Either<Exception, List<Service>>> getServices();
  Future<Either<Exception, List<Service>>> getServicesNear();
  Future<Either<Exception, Like>> likeService(String serviceId);
  Future<Either<Exception, Service>> store(String title, String description, File? photo);
  Future<Either<Exception, List<ServicePhoto>>> storePhoto(File photo, String serviceId);
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

  @override
  Future<Either<Exception, Service>> store(String title, String description, File? photo) {
    const endPoint = '${Utils.baseUrl}/service';
    final service = {"title": title, "description": description, "serviceCategory": 'ae281ec1-c530-4427-a4cc-e14abd1213cb'};

    final dioCall = dioClient.post(endPoint, data: service);
    return callApiWithErrorParser(dioCall).then(
      (serviceOrError) => serviceOrError.fold((error) {
        print('$error url: $endPoint');
        return left(error);
      }, (response) async {
        final createdService = Service.fromJson(response.data['data']);
        if (photo != null && photo.path.isNotEmpty) {
          final servicePhotoOrError = await storePhoto(photo, createdService.id!);
          servicePhotoOrError.fold((l) => print(l), (r) => print(r));
        }
        return right(createdService);
      }),
    );
  }

  @override
  Future<Either<Exception, List<ServicePhoto>>> storePhoto(File photo, String serviceId) async {
    String fileName = photo.path.split('/').last;

    FormData formData = FormData.fromMap({
      "images": await MultipartFile.fromFile(photo.path, filename: fileName),
    });
    print(formData.fields);
    final endPoint = '${Utils.baseUrl}/service/photos/$serviceId';

    final dioCall = dioClient.post(endPoint, data: formData);
    return callApiWithErrorParser(dioCall).then(
      (servicePhotoOrError) => servicePhotoOrError.fold((error) {
        print('$error url: $endPoint');
        return left(error);
      }, (response) {
        return right(
          (response.data['data'] as List).map((e) => ServicePhoto.fromJson(e)).toList(),
        );
      }),
    );
  }
}
