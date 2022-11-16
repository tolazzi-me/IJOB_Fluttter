import 'package:get/get.dart';
import 'package:ijob_app/data/repositories/plan_repository.dart';
import 'package:ijob_app/data/repositories/service_repository.dart';
import 'package:ijob_app/data/repositories/subscription_repository.dart';
import 'package:ijob_app/data/repositories/user_repository.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImp(),
      tag: (UserRepository).toString(),
      fenix: true,
    );
    Get.lazyPut<PlanRepository>(
      () => PlanRepositoryImp(),
      tag: (PlanRepository).toString(),
      fenix: true,
    );
    Get.lazyPut<SubscriptionRepository>(
      () => SubscriptionRepositoryImp(),
      tag: (SubscriptionRepository).toString(),
      fenix: true,
    );
    Get.lazyPut<ServiceRepository>(
      () => ServiceRepositoryImp(),
      tag: (ServiceRepository).toString(),
      fenix: true,
    );
  }
}
