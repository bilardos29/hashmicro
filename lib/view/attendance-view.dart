import 'package:flutter/material.dart';
import 'package:hashmicro/view/widget/button_widget.dart';
import 'package:hashmicro/view/widget/dialog_message.dart';
import 'package:provider/provider.dart';

import '../controller/attendace-controller.dart';

class AttendanceView extends StatefulWidget {
  const AttendanceView({Key? key}) : super(key: key);

  @override
  State<AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  late AttendanceController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<AttendanceController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Attendance"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Longitude : ${controller.dataAttendance.longitude}"),
            padding(12),
            Text("Latitude : ${controller.dataAttendance.latitude}"),
            padding(12),
            ButtonWidget(
                text: "Get Location",
                onClick: () {
                  controller.GetLocation(onSuccess: () {
                    setState(() {});
                  }, onError: () {
                    _showMessage("Location Permission Denied");
                  });
                }),
            padding(12),
            ButtonWidget(
                text: "Submit",
                onClick: () {
                  controller.Attendance(onSuccess: () {
                    Navigator.of(context).pop();
                  }, onError: () {
                    _showMessage(controller.dataAttendance.note);
                  });
                }),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Padding padding(double size) {
    return Padding(padding: EdgeInsets.only(bottom: size));
  }

  _showMessage(String msg) {
    showDialog(
        context: context,
        builder: (_) {
          return DialogMessage(
              message: msg,
              onDone: () {
                Navigator.of(context).pop();
              });
        });
  }
}
