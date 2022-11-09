import 'package:get/get.dart';
import 'package:ijob_app/core/base/base_controller.dart';
import 'package:ijob_app/core/model/plan_model.dart';
import 'package:ijob_app/core/widget/snackbar.dart';
import 'package:ijob_app/data/repositories/plan_repository.dart';
import 'package:ijob_app/network/exceptions/not_found_exception.dart';

class PremiumnController extends BaseController {
  final PlanRepository _planRepository = Get.find(tag: (PlanRepository).toString());
  final assetsCarousel = <String>['assets/BannerPremium1.png', 'assets/BannerPremium2.png', 'assets/BannerPremium3.png', 'assets/BannerPremium4.png'].obs;

  final _plans = <Plan>[].obs;
  final Rx<Plan?> _selectedPlan = (null as Plan?).obs;

  Plan? get selectedPlan => _selectedPlan.value;
  List<Plan> get plans => _plans;

  Future<void> _getPlans() async {
    showLoading();
    final errorOrPlans = await _planRepository.getPlans();
    errorOrPlans.fold(
      (error) {
        if (error is NotFoundException) {
          showGreenSnackBar('Planos', 'Não existe planos cadastrados');
        } else {
          showRedSnackBar('Erro', 'Não foi possível obter os planos, tente novamente mais tarde');
        }
      },
      (plans) => _plans.addAll(plans),
    );
    hideLoading();
  }

  void selectPlan(Plan plan) {
    _selectedPlan.value = Plan(
        id: plan.id,
        interval: plan.interval,
        integrationId: plan.integrationId,
        description: plan.description,
        planAttributes: plan.planAttributes,
        priceInCents: plan.priceInCents,
        isActive: plan.isActive,
        createdAt: plan.createdAt,
        updatedAt: plan.updatedAt);
  }

  @override
  void onInit() async {
    await _getPlans();
    super.onInit();
  }
}
