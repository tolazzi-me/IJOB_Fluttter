import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ijob_app/core/base/base_remote_source.dart';
import 'package:ijob_app/core/model/plan_model.dart';
import 'package:ijob_app/utils/constants.dart';

abstract class PlanRemoteDataSource {
  Future<Either<Exception, List<Plan>>> getPlans();
}

class PlanRemoteDataSourceImp extends BaseRemoteSource implements PlanRemoteDataSource {
  @override
  Future<Either<Exception, List<Plan>>> getPlans() {
    const endPoint = '${Utils.baseUrl}/subscription/plan';

    final dioCall = dioClient.get(endPoint);
    return callApiWithErrorParser(dioCall).then((errorOrPlan) => errorOrPlan.fold((error) {
          print(error);
          return left(error);
        }, (response) => right(_parseListPlanFromJson(response))));
  }

  List<Plan> _parseListPlanFromJson(Response response) {
    return (response.data['data'] as List).map((e) => Plan.fromJson(e)).toList();
  }
}
