import 'dart:io';

import 'base_api_exception.dart';

class ConflictException extends BaseApiException {
  ConflictException(String message, String status) : super(httpCode: HttpStatus.conflict, message: message, status: "conflict");
}
