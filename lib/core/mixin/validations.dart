import 'package:ijob_app/utils/date_extension.dart';

mixin CustomValidations {
  String? isNotEmpty(String? value, [String? message]) {
    if (value!.isEmpty) {
      return message ?? "Eii, qual é seu nome completo?";
    }
    return null;
  }

  String? isValidEmail(String? value, [String? message]) {
    final regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!regex.hasMatch(value!)) {
      return message ?? "Eii, escolha um e-mail melhor ok?";
    }
    return null;
  }

  String? hasSixChars(String? value, [String? message]) {
    if (value!.length < 6) {
      return message ?? "Eii, pelo menos seis caracteres né?";
    }
    return null;
  }

  String? isValidName(String? value, [String? message]) {
    final splited = value!.trim().split(' ');
    for (var name in splited) {
      final isValid = RegExp(r"^[a-zA-Z]+(([',. -\s][a-zA-Z ])?[a-zA-Z]*)*$").hasMatch(name);
      if (!isValid) {
        return message ?? "Ops, seu nome não é valido";
      }
      break;
    }

    if (splited.length < 2) {
      return message ?? "Ops, preciso do seu nome e sobrenome";
    }
    return null;
  }

  String? isValidCellPhone(String? value, [String? message]) {
    if (value == null || value.isEmpty) {
      return message ?? 'Ops, número de telefone inválido';
    }
    final isValid = RegExp(r"^\(?(?:[14689][1-9]|2[12478]|3[1234578]|5[1345]|7[134579])\)? ?(?:[2-8]|9[1-9])[0-9]{3}\-?[0-9]{4}$").hasMatch(value);
    if (!isValid) {
      return message ?? "Ops, número de telefone inválido";
    }
    return null;
  }

  String? isValidBirthDate(String? value, [String? message]) {
    if (value == null || value.isEmpty) {
      return message ?? "Ops, data de nascimento inválida";
    }
    if (!DateTime.parse(value).isAtLeastYearsOld(18)) {
      return message ?? "Ops, você precisa ser maior de idade";
    }
    return null;
  }

  String? passwordHasMatch(String? value, String? value2, [String? message]) {
    if (value! != value2) {
      return message ?? "Ops, as senhas não conferem";
    }
    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) return validation;
    }
    return null;
  }
}
