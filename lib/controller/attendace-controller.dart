import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hashmicro/controller/usecase.dart';
import 'package:hashmicro/model/attendance-model.dart';
import 'package:hashmicro/util/utility.dart';
import 'package:intl/intl.dart';

class AttendanceController extends ChangeNotifier implements UseCase {
  List<AttendanceModel> listDataAttendance = [];
  AttendanceModel dataAttendance =
      AttendanceModel(longitude: 0, latitude: 0, datetime: "");

  @override
  void GetLocation() async {
    // TODO: implement GetLocation
    String now = DateFormat('dd MMM yyyy').format(DateTime.now());

    var position = await GeolocatorPlatform.instance.getCurrentPosition(
        locationSettings:
            const LocationSettings(accuracy: LocationAccuracy.best));
    dataAttendance = AttendanceModel(
        longitude: position.longitude,
        latitude: position.latitude,
        datetime: now);

    notifyListeners();
  }

  @override
  void ListAttendance(VoidCallback onSuccess) {
    // TODO: implement ListAttendance
    onSuccess();
  }

  bool validateAttendance(AttendanceModel model) {
    double km = Utility.calculateDistance(
        startLatitude: model.latitude,
        endLatitude: listDataAttendance.first.latitude,
        startLongitude: model.longitude,
        endLongitude: listDataAttendance.first.longitude);
    if (km > 0.05) {
      //attendance location is not in tagging location radius
      return false;
    }
    return false;
  }

  @override
  void Attendance(
      {required VoidCallback onSuccess, required VoidCallback onError}) {
    // TODO: implement Attendance
    if (dataAttendance.datetime != "") {
      bool isValid = validateAttendance(dataAttendance);
      dataAttendance.rejected = isValid;
      dataAttendance.note =
          !isValid ? 'Your attendance does not in tagging radius' : '';

      listDataAttendance.add(dataAttendance);
      dataAttendance.clear();
      notifyListeners();
      isValid ? onSuccess() : onError();
    } else {
      onError();
    }
  }
}
