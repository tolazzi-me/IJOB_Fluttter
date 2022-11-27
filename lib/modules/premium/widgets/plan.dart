import 'package:flutter/material.dart';
import 'package:ijob_app/core/model/plan_model.dart';
import 'package:ijob_app/core/values/app_colors.dart';
import 'package:ijob_app/core/values/app_values.dart';
import 'package:intl/intl.dart';

class PlanBoxWdiget extends StatelessWidget {
  const PlanBoxWdiget({Key? key, required this.plan, required this.onPressed, this.color = AppColors.colorWhite}) : super(key: key);
  final Plan plan;
  final Color color;
  final VoidCallback onPressed;
  // final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            // gradient: const LinearGradient(
            //   colors: [
            //     Color(0xff607d8b),
            //     Color(0xff673ab7),
            //   ],
            //   begin: Alignment.bottomCenter,
            //   end: Alignment.topCenter,
            // ),
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
          width: 250,
          height: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                plan.description,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '${NumberFormat.currency(locale: 'pt_BR', decimalDigits: 2, symbol: 'R\$').format(plan.priceInCents / 100)}/mês',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 6),
              Flexible(
                child: ListView.builder(
                  // shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: plan.planAttributes.length,
                  itemBuilder: ((context, index) {
                    final planAttr = plan.planAttributes[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ListTile(
                        dense: true,
                        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                        contentPadding: EdgeInsets.zero,
                        minLeadingWidth: 0,
                        leading: const Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 16,
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('${planAttr.description}:'),
                            Text(planAttr.value.toString()),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
