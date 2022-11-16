import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ijob_app/core/model/service_model.dart';

import '../../core/base/base_remote_source.dart';
import '../../utils/constants.dart';

abstract class ServiceRemoteSource {
  Future<Either<Exception, List<Service>>> getServices();
  Future<Either<Exception, List<Service>>> getServicesNear();
}

class ServiceRemoteSourceImp extends BaseRemoteSource implements ServiceRemoteSource {
  @override
  Future<Either<Exception, List<Service>>> getServices() {
    const endPoint = '${Utils.baseUrl}/service';

    final dioCall = dioClient.get(endPoint);
    return callApiWithErrorParser(dioCall).then((errorOrPlan) => errorOrPlan.fold((error) {
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
    return callApiWithErrorParser(dioCall).then((errorOrPlan) => errorOrPlan.fold((error) {
          print('$error url: $endPoint');
          return left(error);
        }, (response) => right(_parseListServicesFromJson(response))));
  }
}
