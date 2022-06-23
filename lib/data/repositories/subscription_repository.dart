import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/model/subscription_model.dart';
import 'package:ijob_app/data/remote/subscription_remote_data_source.dart';

abstract class SubscriptionRepository {
  Future<Either<Exception, bool>> paySubscription(Subscription subscription);
}

class SubscriptionRepositoryImp implements SubscriptionRepository {
  final SubscriptionRemoteDataSource _remoteDataSource = Get.find(tag: (SubscriptionRemoteDataSource).toString());
  @override
  Future<Either<Exception, bool>> paySubscription(Subscription subscription) {
    return _remoteDataSource.paySubscription(subscription);
  }
}
