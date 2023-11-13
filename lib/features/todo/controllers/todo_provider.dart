import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taskify/common/helpers/db_helper.dart';
import 'package:taskify/common/models/task_model.dart';

part 'todo_provider.g.dart';

@riverpod
class TodoState extends _$TodoState {
  @override
  List<TaskModel> build() {
    return [];
  }

  void refresh() async {
    final data = await DBHelper.getItems();

    state = data.map((e) => TaskModel.fromJson(e)).toList();
  }

  void addTodo(TaskModel taskModel) async {
    await DBHelper.createItem(taskModel);
    refresh();
  }

  void updateTodo(
    id,
    title,
    description,
    isCompleted,
    date,
    startTime,
    endTime,
  ) async {
    await DBHelper.updateItem(
      id,
      title,
      description,
      isCompleted,
      date,
      startTime,
      endTime,
    );
    refresh();
  }

  Future<void> deleteTodo(int id) async {
    await DBHelper.deleteItem(id);
    refresh();
  }

  void markAsCompleted(
    id,
    title,
    description,
    isCompleted,
    date,
    startTime,
    endTime,
  ) async {
    await DBHelper.updateItem(
      id,
      title,
      description,
      1,
      date,
      startTime,
      endTime,
    );
    refresh();
  }

  // today
  String getToday() {
    return DateTime.now().toString().substring(0, 10);
  }

  // tomorrow
  String getTomorrow() {
    return DateTime.now()
        .add(const Duration(days: 1))
        .toString()
        .substring(0, 10);
  }

  List<String> last30Days() {
    DateTime today = DateTime.now();
    DateTime oneMonthAgo = today.subtract(const Duration(days: 30));
    List<String> dates = [];

    for (int i = 0; i < 30; i++) {
      DateTime date = oneMonthAgo.add(Duration(days: i));
      dates.add(date.toString().substring(0, 10));
    }
    return dates;
  }

  bool getStatus(TaskModel taskModel) {
    return taskModel.isCompleted == 0 ? false : true;
  }
}
