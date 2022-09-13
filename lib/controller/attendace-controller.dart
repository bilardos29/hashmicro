import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:hashmicro/controller/usecase.dart';
import 'package:hashmicro/model/attendance-model.dart';

class AttendanceController extends ChangeNotifier implements UseCase {
  List<AttendanceModel> listDataAttendance = [];

  @override
  AttendanceModel GetLocation() {
    // TODO: implement GetLocation
    AttendanceModel data =
        AttendanceModel(longitude: 0, latitude: 0, datetime: "");

    return data;
  }

  @override
  void Attendance(VoidCallback onSuccess, VoidCallback onError) {
    // TODO: implement Attendance
    AttendanceModel model = GetLocation();
    if (model.datetime != "") {

      bool isValid = validateAttendance(model);
      model.rejected = isValid;
      model.note = !isValid ? 'Your attendance does not is tagging radius' : '';

      listDataAttendance.add(model);
      isValid ? onSuccess() : onError();
    } else {
      onError();
    }
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
}
