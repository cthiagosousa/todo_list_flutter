
class Task {
  final String id;
  final String title;
  bool isCheck = false;

  Task({required this.id, required this.title, required this.isCheck});

  void changeIsCheck(bool value) {
    this.isCheck = value;
  }

}