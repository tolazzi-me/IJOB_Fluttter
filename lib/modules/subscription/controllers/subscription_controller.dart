import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_controller.dart';
import 'package:ijob_app/core/model/plan_model.dart';
import 'package:ijob_app/core/model/subscription_model.dart';
import 'package:ijob_app/core/model/user_model.dart';
import 'package:ijob_app/core/widget/snackbar.dart';
import 'package:ijob_app/data/repositories/gerencianet_repository.dart';
import 'package:ijob_app/data/repositories/subscription_repository.dart';
import 'package:ijob_app/data/repositories/user_repository.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_pages.dart';

class SubscriptionController extends BaseController {
  final UserRepository _userRepository =
      Get.find(tag: (UserRepository).toString());
  final SubscriptionRepository _subscriptionRepository =
      Get.find(tag: (SubscriptionRepository).toString());
  final GerencianetRepository _gerencianetRepository =
      Get.find(tag: (GerencianetRepository).toString());

  final _currentStep = 0.obs;
  final _nameEC = TextEditingController(text: '').obs;
  final _cpfEC = TextEditingController(text: '').obs;
  final _emailEC = TextEditingController(text: '').obs;
  final _birthEC = TextEditingController(text: '').obs;
  final _phoneNumberEC = TextEditingController(text: '').obs;
  final _streetEC = TextEditingController(text: '').obs;
  final _numberAddressEC = TextEditingController(text: '').obs;
  final _neighborhoodEC = TextEditingController(text: '').obs;
  final _zipCodeEC = TextEditingController(text: '').obs;
  final _complementEC = TextEditingController(text: '').obs;
  final _stateEC = TextEditingController(text: '').obs;
  final _cityEC = TextEditingController(text: '').obs;
  final _street1EC = TextEditingController(text: '').obs;
  final _numberAddress1EC = TextEditingController(text: '').obs;
  final _neighborhood1EC = TextEditingController(text: '').obs;
  final _zipCode1EC = TextEditingController(text: '').obs;
  final _complement1EC = TextEditingController(text: '').obs;
  final _state1EC = TextEditingController(text: '').obs;
  final _city1EC = TextEditingController(text: '').obs;
  final _cardNumberEC = TextEditingController(text: '').obs;
  final _expirationEC = TextEditingController(text: '').obs;
  final _cvvEC = TextEditingController(text: '').obs;
  final _brand = ''.obs;

  final _isSameAddress = true.obs;
  // ignore: unnecessary_cast
  final Rx<User?> _user = (null as User?).obs;

  int get currentStep => _currentStep.value;
  bool get isSameAddress => _isSameAddress.value;
  TextEditingController get nameEC => _nameEC.value;
  TextEditingController get cpfEC => _cpfEC.value;
  TextEditingController get emailEC => _emailEC.value;
  TextEditingController get birthEC => _birthEC.value;
  TextEditingController get phoneNumberEC => _phoneNumberEC.value;

  TextEditingController get streetEC => _streetEC.value;
  TextEditingController get numberAddressEC => _numberAddressEC.value;
  TextEditingController get neighborhoodEC => _neighborhoodEC.value;
  TextEditingController get zipCodeEC => _zipCodeEC.value;
  TextEditingController get complementEC => _complementEC.value;
  TextEditingController get stateEC => _stateEC.value;
  TextEditingController get cityEC => _cityEC.value;

  TextEditingController get street1EC => _street1EC.value;
  TextEditingController get numberAddress1EC => _numberAddress1EC.value;
  TextEditingController get neighborhood1EC => _neighborhood1EC.value;
  TextEditingController get zipCode1EC => _zipCode1EC.value;
  TextEditingController get complement1EC => _complement1EC.value;
  TextEditingController get state1EC => _state1EC.value;
  TextEditingController get city1EC => _city1EC.value;

  TextEditingController get cardNumberEC => _cardNumberEC.value;
  TextEditingController get expirationEC => _expirationEC.value;
  TextEditingController get cvvEC => _cvvEC.value;

  set isSameAddress(bool? value) => _isSameAddress.value = value ?? false;
  var dateFormat = DateFormat('dd/MM/yyyy');
  incrementStep() => _currentStep.value++;
  decrementStep() => _currentStep.value--;

  Future<void> _getUserInfo() async {
    showLoading();
    final errorOrUser = await _userRepository.me();
    errorOrUser.fold(
        (error) => print('deu erro $error'), (user) => _user.value = user);
    if (_user.value != null) {
      String fullName = '${_user.value!.firstName} ${_user.value!.lastName}';
      _nameEC.value.text = fullName;
      _emailEC.value.text = _user.value!.email;
      _birthEC.value.text = dateFormat.format(_user.value!.bornDate);
      _phoneNumberEC.value.text = _user.value!.cellPhone;
    }

    hideLoading();
  }

  bool get isValidSubscriptionData {
    _brand.value = _getBrandOfCardNumber(cardNumberEC.text);
    if (_brand.isEmpty) {
      showRedSnackBar('Erro', 'Número do cartão inválido');
    }

    final month = int.tryParse(expirationEC.text.split('/').first);
    final year = int.tryParse(expirationEC.text.split('/').last);
    print(month);
    print(year);
    if (month == null || month < 1 || month > 12 || year == null) {
      showRedSnackBar('Erro', 'Data de validade inválida');
      return false;
    }
    if (cvvEC.text.isEmpty) {
      showRedSnackBar('Erro', 'CVV inválido');
      return false;
    }
    if (!cpfEC.text.isCpf) {
      showRedSnackBar('Erro', 'CPF é inválido');
      return false;
    }
    if (!emailEC.text.isEmail) {
      showRedSnackBar('Erro', 'E-mail é inválido');
      return false;
    }

    return true;
  }

  String _getBrandOfCardNumber(String cardNumber) {
    final regxCardNumber = RegExp(r'[^0-9]+');

    final clearCardNumber = cardNumber.replaceAll(regxCardNumber, '');

    final regxCards = [
      {'visa': RegExp(r'^4[0-9]{12}(?:[0-9]{3})')},
      {'mastercard': RegExp(r'^5[1-5][0-9]{14}')},
      {'amex': RegExp(r'^3[47][0-9]{13}')},
      {
        'elo': RegExp(
            r'^((((636368)|(438935)|(504175)|(451416)|(636297))\d{0,10})|((5067)|(4576)|(4011))\d{0,12})')
      },
      {'hipercard': RegExp(r'^(606282\d{10}(\d{3})?)|(3841\d{15})')},
    ];
    String brand = '';
    for (var flag in regxCards) {
      if (flag.values.first.hasMatch(clearCardNumber)) {
        brand = flag.keys.first;
      }
    }
    return brand;
  }

  void paySubscription(Plan plan) async {
    showLoading();
    String paymentToken = '';
    final monthAndYear = expirationEC.text.split('/');
    final errorOrPaymentToken = await _gerencianetRepository.getPaymentToken(
        cardNumberEC.text,
        int.parse(cvvEC.text),
        monthAndYear.first,
        monthAndYear.last,
        _brand.value);
    errorOrPaymentToken.fold((error) => null, (token) => paymentToken = token);

    if (paymentToken.isEmpty) {
      showRedSnackBar('Erro', 'Não foi possível processar sua assinatura');
    }
    final address = Address(
        number: int.parse(numberAddressEC.text),
        neighborhood: neighborhoodEC.text,
        zipcode: zipCodeEC.text,
        city: cityEC.text,
        complement: complementEC.text,
        state: stateEC.text,
        street: streetEC.text);
    final billingAddress = Address(
        number: int.parse(numberAddressEC.text),
        neighborhood: neighborhoodEC.text,
        zipcode: zipCodeEC.text,
        city: cityEC.text,
        complement: complementEC.text,
        state: stateEC.text,
        street: streetEC.text);

    final customer = Customer(
        name: nameEC.text,
        cpf: cpfEC.text,
        email: emailEC.text,
        birth: dateFormat.parse(birthEC.text),
        phoneNumber: phoneNumberEC.text,
        address: address);

    final payment = Payment(
        paymentToken: paymentToken,
        customer: customer,
        billingAddress: isSameAddress ? address : billingAddress);
    final subscription = Subscription(plan: plan, payment: payment);
    final errorOrSubscription =
        await _subscriptionRepository.paySubscription(subscription);

    errorOrSubscription.fold((error) {
      showRedSnackBar('Erro', 'Não foi possível realizar assinatura');
    }, (subscription) {
      print(subscription);
      showGreenSnackBar('Parabéns 🚀',
          'Sua assinatura foi solicitada, logo receberá um e-mail com mais informações');
      Get.toNamed(Routes.premium);
    });
    hideLoading();
  }

  @override
  void onInit() async {
    await _getUserInfo();
    super.onInit();
  }
}
