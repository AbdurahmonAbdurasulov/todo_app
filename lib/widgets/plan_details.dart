import 'package:flutter/material.dart';
import 'package:to_do_list/models/plan_models.dart';

class PlanDetails extends StatelessWidget {
  final List<PlanModels> plans;
  PlanDetails(this.plans);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plans.length.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "Barcha rejalaringiz",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                plans.where((plan) => plan.isDone).length.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "Bajarilgan rejalaringiz",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              )
            ],
          ),
        ],
      ),
    );
  }
}
