import 'package:dartz/dartz.dart';
import 'package:gerencianet/gerencianet.dart';

abstract class GerencianetRemoteDataSource {
  Future<Either<Exception, String>> getPaymentToken(
      String cardNumber, int cvv, String expirationMonth, String expirationYear, String brand);
}

class GerencianetRemoteDataSourceImp implements GerencianetRemoteDataSource {
  Map<String, dynamic> cred = {
    'client_id': 'Client_Id_088a46c2dfdf0ff68b9dcab1a846876e5085cba4',
    'client_secret': 'Client_Secret_e36fd5576a3bc4f1dd540cbd4ca608d7c96970c8',
    'account_id': '0e5e7b02738a4c9675d66d14e51b27e3',
    'sandbox': true,
  };
  @override
  Future<Either<Exception, String>> getPaymentToken(
      String cardNumber, int cvv, String expirationMonth, String expirationYear, String brand) async {
    try {
      final _gerencianet = Gerencianet(cred);
      Map<String, Object> card = {
        "brand": brand,
        "number": cardNumber,
        "cvv": cvv.toString(),
        "expiration_month": expirationMonth,
        "expiration_year": expirationYear
      };
      print(card.toString());
      final token = await _gerencianet.call('paymentToken', body: card);
      print(token['data']['payment_token']);
      return right(token['data']['payment_token']);
    } catch (e) {
      print('error on generate payment token: $e');
      return left(Exception(e));
    }
  }
}
