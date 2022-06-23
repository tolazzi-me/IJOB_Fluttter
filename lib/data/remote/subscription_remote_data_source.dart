import 'package:dartz/dartz.dart';
import 'package:ijob_app/core/base/base_remote_source.dart';
import 'package:ijob_app/core/model/subscription_model.dart';
import 'package:ijob_app/utils/constants.dart';

abstract class SubscriptionRemoteDataSource {
  Future<Either<Exception, bool>> paySubscription(Subscription subscription);
}

class SubscriptionRemoteDataSourceImp extends BaseRemoteSource implements SubscriptionRemoteDataSource {
  @override
  Future<Either<Exception, bool>> paySubscription(Subscription subscription) async {
    const endPoint = '${Utils.baseUrl}/subscription';
    final data = {
      'plan': {'idPlan': subscription.plan.id},
      'payment': subscription.payment.toJson(),
    };
    final dioCall = dioClient.post(endPoint, data: data);
    return callApiWithErrorParser(dioCall).then((errorOrSuccess) {
      return errorOrSuccess.fold((error) {
        print(error);
        return left(Exception(error));
      }, (success) {
        print(success.data);
        return right(true);
      });
    });
  }
}
