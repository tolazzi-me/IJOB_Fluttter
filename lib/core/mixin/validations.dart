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
    final splited = value!.split(' ');
    splited.removeWhere((element) => element.contains(' '));
    if (splited.length < 2) {
      return message ?? "Ops, preciso do seu nome e sobrenome";
    }
    return null;
  }

  String? isValidBirthDate(String? value, [String? message]) {
    if (value == null || DateTime.parse(value).compareTo(DateTime.now()) > 0) {
      return message ?? "Ops, data de nascimento inválida";
    }
    return null;
  }

  String? passwordHasMatch(String? value, String? value2, [String? message]) {
    if (value! != value2) {
      return message ?? "As senhas não conferem";
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
