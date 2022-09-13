import 'package:flutter/cupertino.dart';
class UseCase {
  void ListAttendance(VoidCallback onSuccess) {}

  void Attendance({required VoidCallback onSuccess, required VoidCallback onError}) {}

  void GetLocation({required VoidCallback onSuccess, required VoidCallback onError}) {}
}
