import 'dart:io';

import 'package:ijob_app/network/exceptions/api_exception.dart';

class ConflictException extends ApiException {
  ConflictException(String message, String status) : super(httpCode: HttpStatus.conflict, message: message, status: "conflict");
}
