import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hashmicro/controller/attendace-controller.dart';
import 'package:hashmicro/view/list-attendance-view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AttendanceController(),
          ),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
            ),
            home: const ListAttendanceView()));
  }
}
