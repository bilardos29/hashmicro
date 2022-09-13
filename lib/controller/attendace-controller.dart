import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:hashmicro/controller/usecase.dart';
import 'package:hashmicro/model/attendance-model.dart';

class AttendanceController extends ChangeNotifier implements UseCase {
  List<AttendanceModel> listDataAttendance = [];
  AttendanceModel dataAttendance = AttendanceModel(longitude: 0, latitude: 0, datetime: "");

  @override
  void GetLocation() {
    // TODO: implement GetLocation
    dataAttendance = AttendanceModel(longitude: 0, latitude: 0, datetime: "");
    notifyListeners();
  }

  @override
  void ListAttendance(VoidCallback onSuccess) {
    // TODO: implement ListAttendance
    onSuccess();
  }

  bool validateAttendance(AttendanceModel model) {
    if (model.longitude > 5 && model.latitude > 5) {
      //attendance location is not in tagging location radius
      return false;
    }
    return false;
  }

  @override
  void Attendance({required VoidCallback onSuccess, required VoidCallback onError}) {
    // TODO: implement Attendance
    if (dataAttendance.datetime != "") {

      bool isValid = validateAttendance(dataAttendance);
      dataAttendance.rejected = isValid;
      dataAttendance.note = !isValid ? 'Your attendance does not in tagging radius' : '';

      listDataAttendance.add(dataAttendance);
      dataAttendance.clear();
      notifyListeners();
      isValid ? onSuccess() : onError();
    } else {
      onError();
    }
  }
}
