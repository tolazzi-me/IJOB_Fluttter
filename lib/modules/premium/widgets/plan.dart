import 'package:flutter/material.dart';
import 'package:ijob_app/core/model/plan_model.dart';
import 'package:ijob_app/core/values/app_colors.dart';
import 'package:ijob_app/core/values/app_values.dart';

class PlanBoxWdiget extends StatelessWidget {
  const PlanBoxWdiget({Key? key, required this.plan, required this.onPressed, this.color = AppColors.colorWhite})
      : super(key: key);
  final Plan plan;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              AppValues.radius_12,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.03),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          width: 160,
          height: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                plan.description,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'R\$ ${(plan.priceInCents / 100).toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
