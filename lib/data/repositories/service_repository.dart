import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:ijob_app/data/remote/service_remote_data_source.dart';

import '../../core/model/like_model.dart';
import '../../core/model/service_model.dart';
import '../remote/plan_remote_data_source.dart';

abstract class ServiceRepository {
  Future<Either<Exception, List<Service>>> getServices();
  Future<Either<Exception, List<Service>>> getServicesNear();
  Future<Either<Exception, Like>> likeService(String serviceId);
}

class ServiceRepositoryImp implements ServiceRepository {
  final ServiceRemoteSource _remoteDataSource = Get.find(tag: (PlanRemoteDataSource).toString());
  @override
  Future<Either<Exception, List<Service>>> getServices() {
    return _remoteDataSource.getServices();
  }

  @override
  Future<Either<Exception, List<Service>>> getServicesNear() {
    return _remoteDataSource.getServicesNear();
  }

  @override
  Future<Either<Exception, Like>> likeService(String serviceId) {
    return _remoteDataSource.likeService(serviceId);
  }
}
