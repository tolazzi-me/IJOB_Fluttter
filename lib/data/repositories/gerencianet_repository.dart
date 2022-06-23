import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:ijob_app/data/remote/gerencianet_remote_data_source.dart';

abstract class GerencianetRepository {
  Future<Either<Exception, String>> getPaymentToken(
      String cardNumber, int cvv, String expirationMonth, String expirationYear, String brand);
}

class GerencianetRepositoryImp implements GerencianetRepository {
  final GerencianetRemoteDataSource _remoteDataSource = Get.find(tag: (GerencianetRemoteDataSource).toString());
  @override
  Future<Either<Exception, String>> getPaymentToken(
      String cardNumber, int cvv, String expirationMonth, String expirationYear, String brand) {
    return _remoteDataSource.getPaymentToken(cardNumber, cvv, expirationMonth, expirationYear, brand);
  }
}
