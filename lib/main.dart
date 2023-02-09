import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/models/plan_models.dart';
import 'package:to_do_list/widgets/new_plan_add.dart';
import './widgets/plan_date.dart';
import './widgets/plan_details.dart';
import './widgets/plans_list.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.montserrat().fontFamily),
      home: ToDoApp(),
    );
  }
}

class ToDoApp extends StatefulWidget {
  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  Plans plans = Plans();
  DateTime defaultDate = DateTime.now();

  void chooseDate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2024))
        .then((chosedDate) {
      if (chosedDate != null) {
        setState(() {
          defaultDate = chosedDate;
        });
      }
    });
  }

  void previousDate() {
    setState(() {
      defaultDate = DateTime(
        defaultDate.year,
        defaultDate.month,
        defaultDate.day - 1,
      );
    });
  }

  void nextDate() {
    setState(() {
      defaultDate = DateTime(
        defaultDate.year,
        defaultDate.month,
        defaultDate.day + 1,
      );
    });
  }

  void chosedButton(String plansID) {
    setState(() {
      plans
          .todoByDay(defaultDate)
          .firstWhere((plan) => plan.id == plansID)
          .toggleDone();
    });
  }

  void deletePlan(String plansId) {
    setState(() {
      plans.removeTodo(plansId);
    });
  }

  void addPlan(String name, DateTime date) {
    setState(() {
      plans.addToDo(name, date);
    });
    Navigator.of(context).pop();
  }

  void planAdd(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (ctx) {
          return NewPlanAdd(addPlan);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("toDo App"),
      ),
      body: Column(
        children: [
          PlanDate(chooseDate, defaultDate, previousDate, nextDate),
          PlanDetails(plans.todoByDay(defaultDate)),
          PlansList(plans.todoByDay(defaultDate), chosedButton, deletePlan),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          planAdd(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
