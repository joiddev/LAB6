import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/fromscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'แบบฟอร์มบันทึกข้อมูล',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'แบบฟอร์มบันทึกข้อมูลนักเรียน'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: [FromScreen(), Container()],
        ),
        backgroundColor: Colors.blue,
        bottomNavigationBar: const TabBar(
          // ignore: prefer_const_literals_to_create_immutables
          tabs: [
            Tab(
              text: "บันทึกคะแนน",
            ),
            Tab(
              text: "รายื่อนักเรียน",
            )
          ],
        ),
      ),
    );
  }
}
