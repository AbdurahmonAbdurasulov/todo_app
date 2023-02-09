import 'package:flutter/material.dart';
import 'package:to_do_list/models/plan_models.dart';
import 'plan.dart';

class PlansList extends StatelessWidget {
  final List<PlanModels> plans;
  final Function chosedButton;
  final Function deletePlan;
  PlansList(this.plans, this.chosedButton, this.deletePlan);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: plans.length > 0
          ? ListView.builder(
              itemBuilder: (ctx, index) {
                return Plan(plans[index], chosedButton, deletePlan);
              },
              itemCount: plans.length,
            )
          : Column(
              children: [
                Text("No plans, Create ones",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(height:20),
                Image.asset(
                  "assets/images/sleep.png"
                ,fit: BoxFit.cover,
                width: 150,
                ),
              ],
            ),
    );
  }
}
