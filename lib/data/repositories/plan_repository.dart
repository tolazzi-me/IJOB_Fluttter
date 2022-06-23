import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:ijob_app/data/remote/plan_remote_data_source.dart';

import '../../core/model/plan_model.dart';

abstract class PlanRepository {
  Future<Either<Exception, List<Plan>>> getPlans();
}

class PlanRepositoryImp implements PlanRepository {
  final PlanRemoteDataSource _remoteDataSource = Get.find(tag: (PlanRemoteDataSource).toString());
  @override
  Future<Either<Exception, List<Plan>>> getPlans() {
    return _remoteDataSource.getPlans();
  }
}
