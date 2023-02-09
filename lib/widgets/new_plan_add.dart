import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewPlanAdd extends StatefulWidget {
  final Function addPlan;
  NewPlanAdd(this.addPlan);

  @override
  State<NewPlanAdd> createState() => _NewPlanAddState();
}

class _NewPlanAddState extends State<NewPlanAdd> {
  DateTime? planAddDate;
  final textController = TextEditingController();

  void planAddCalendar(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2024))
        .then((value) {
      if (value != null) {
        setState(() {
          planAddDate = value;
        });
      }
    });
  }

  void submit() {
    if (textController.text.isEmpty || planAddDate == null) {
      return;
    }
    widget.addPlan(textController.text, planAddDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          right: 16,
          left: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom > 0
              ? MediaQuery.of(context).viewInsets.bottom + 15
              : MediaQuery.of(context).viewInsets.bottom + 150,
        ),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Plan name"),
              controller: textController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(planAddDate == null
                    ? "The date isn't choosed..."
                    : DateFormat("EEEE,d MMMM,yyyy").format(planAddDate!)),
                TextButton(
                    onPressed: () => planAddCalendar(context),
                    child: Text("Choose date"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("CANCEL"),
                ),
                ElevatedButton(onPressed: submit, child: Text("ENTER")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
