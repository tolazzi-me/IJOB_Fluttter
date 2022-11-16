import 'package:get/get.dart';
import 'package:ijob_app/data/remote/plan_remote_data_source.dart';
import 'package:ijob_app/data/remote/service_remote_data_source.dart';
import 'package:ijob_app/data/remote/subscription_remote_data_source.dart';
import 'package:ijob_app/data/remote/user_remote_data_source.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceRemoteSource>(
      () => ServiceRemoteSourceImp(),
      tag: (ServiceRemoteSource).toString(),
      fenix: true,
    );
    Get.lazyPut<UserRemoteDataSource>(
      () => UserRemoteDataSourceImp(),
      tag: (UserRemoteDataSource).toString(),
      fenix: true,
    );
    Get.lazyPut<PlanRemoteDataSource>(
      () => PlanRemoteDataSourceImp(),
      tag: (PlanRemoteDataSource).toString(),
      fenix: true,
    );
    Get.lazyPut<SubscriptionRemoteDataSource>(
      () => SubscriptionRemoteDataSourceImp(),
      tag: (SubscriptionRemoteDataSource).toString(),
      fenix: true,
    );
  }
}
