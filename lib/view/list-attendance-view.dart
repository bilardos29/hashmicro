import 'package:flutter/material.dart';
import 'package:hashmicro/controller/attendace-controller.dart';
import 'package:hashmicro/model/attendance-model.dart';
import 'package:provider/provider.dart';

class ListAttendanceView extends StatefulWidget {
  const ListAttendanceView({Key? key}) : super(key: key);

  @override
  State<ListAttendanceView> createState() => _ListAttendanceViewState();
}

class _ListAttendanceViewState extends State<ListAttendanceView> {

  late AttendanceController controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<AttendanceController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance History"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: controller.listDataAttendance.map((item) => detailRow(item)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget detailRow(AttendanceModel item) {
    return Column(
      children: [
        Row(
          children: [
            Text(item.datetime),
            Text("Attendace ${item.rejected ? 'rejected' : 'accepted'}"),
          ],
        ),
        Text("Location tag : ${item.longitude}, ${item.latitude}"),
      ],
    );
  }
}
