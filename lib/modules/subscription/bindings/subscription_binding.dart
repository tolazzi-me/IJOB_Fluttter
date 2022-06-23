import 'package:get/get.dart';
import 'package:ijob_app/data/remote/gerencianet_remote_data_source.dart';
import 'package:ijob_app/data/repositories/gerencianet_repository.dart';
import 'package:ijob_app/data/repositories/user_repository.dart';
import 'package:ijob_app/modules/subscription/controllers/subscription_controller.dart';

import '../../../data/remote/user_remote_data_source.dart';

class SubscriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRemoteDataSource>(
      () => UserRemoteDataSourceImp(),
      tag: (UserRemoteDataSource).toString(),
    );
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImp(),
      tag: (UserRepository).toString(),
      fenix: true,
    );
    Get.lazyPut<GerencianetRemoteDataSource>(
      () => GerencianetRemoteDataSourceImp(),
      tag: (GerencianetRemoteDataSource).toString(),
    );
    Get.lazyPut<GerencianetRepository>(
      () => GerencianetRepositoryImp(),
      tag: (GerencianetRepository).toString(),
      fenix: true,
    );
    Get.lazyPut(() => SubscriptionController());
  }
}
