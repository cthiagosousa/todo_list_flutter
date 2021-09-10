
class Task {
  final String id;
  final String title;
  bool isCheck;

  Task({required this.id, required this.title, this.isCheck = false});

  void changeIsCheck(bool value) {
    this.isCheck = value;
  }

}