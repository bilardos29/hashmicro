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
  void initState() {
    super.initState();
    controller = context.read<AttendanceController>();
    controller.ListAttendance(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance History"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: controller.listDataAttendance.isEmpty ? [
            const Text("There is no record of attendance")
          ] : controller.listDataAttendance
              .map((item) => detailRow(item))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(item.datetime),
                  Text("Attendance ${item.rejected ? 'rejected' : 'accepted'}"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child:
                    Text("Location tag : ${item.longitude}, ${item.latitude}"),
              ),
            ],
          ),
        ),
        const Divider(height: 1, color: Colors.black12)
      ],
    );
  }
}
