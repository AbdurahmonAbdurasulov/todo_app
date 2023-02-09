import 'package:flutter/material.dart';
import 'package:to_do_list/models/plan_models.dart';

class Plan extends StatelessWidget {
  final PlanModels plan;
  final Function chosedButton;
  final Function deletePlan;
  Plan(this.plan, this.chosedButton, this.deletePlan);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(4),
      leading: IconButton(
          onPressed: () {
            chosedButton(plan.id);
          },
          icon: Icon(
            plan.isDone ? Icons.check_circle_outline : Icons.circle_outlined,
            size: 20,
            color: plan.isDone ? Colors.green : Colors.grey,
          )),
      title: Text(
        plan.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: plan.isDone ? Colors.grey : Colors.black,
          decoration:
              plan.isDone ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: IconButton(
          onPressed: () {
            deletePlan(plan.id);
          },
          icon: Icon(
            Icons.delete_forever_rounded,
            size: 20,
            color: Colors.red,
          )),
    );
  }
}
