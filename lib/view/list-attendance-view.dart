import 'package:flutter/material.dart';
import 'package:hashmicro/controller/attendace-controller.dart';
import 'package:hashmicro/model/attendance-model.dart';
import 'package:hashmicro/view/attendance-view.dart';
import 'package:provider/provider.dart';

class ListAttendanceView extends StatefulWidget {
  const ListAttendanceView({Key? key}) : super(key: key);

  @override
  State<ListAttendanceView> createState() => _ListAttendanceViewState();
}

class _ListAttendanceViewState extends State<ListAttendanceView> {
  late AttendanceController controller;

  @override
  Widget build(BuildContext context) {
    controller = context.watch<AttendanceController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance History"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: controller.listDataAttendance.isEmpty ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: controller.listDataAttendance.isEmpty
              ? [const Text("There is no record of attendance")]
              : controller.listDataAttendance
                  .map((item) => detailRow(item))
                  .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          controller.dataAttendance.clear();
          await Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return const AttendanceView();
          }));
        },
        tooltip: 'Add Attendance',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget detailRow(AttendanceModel item) {
    return Container(
      color: Colors.black12,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.datetime),
              Text("Attendance : ${item.rejected ? 'rejected' : 'accepted'}"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text("Location tag : ${item.longitude}, ${item.latitude}"),
          ),
        ],
      ),
    );
  }
}
