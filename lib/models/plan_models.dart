class PlanModels {
  final String id;
  final String name;
  final DateTime date;
  bool isDone = false;

  PlanModels({required this.id, required this.name, required this.date});

  void toggleDone() {
    isDone = !isDone;
  }
}

class Plans {
  List<PlanModels> _list = [
    PlanModels(id: "r1", name: "Bozorga borish", date: DateTime.now()),
    PlanModels(id: "r2", name: "Kitob o'qish", date: DateTime.now()),
    PlanModels(id: "r3", name: "Shadowing", date: DateTime.now()),
  ];
  List<PlanModels> get list {
    return _list;
  }

  List<PlanModels> todoByDay(DateTime data) {
    return _list
        .where((todo) =>
            todo.date.day == data.day &&
            todo.date.month == data.month &&
            todo.date.year == data.year)
        .toList();
  }

  void addToDo(String planName, DateTime planDate) {
    _list.add(
        PlanModels(id: "r${_list.length + 1}", name: planName, date: planDate));
  }

  void removeTodo(String id) {
    _list.removeWhere((plan) => plan.id == id);
  }
}
