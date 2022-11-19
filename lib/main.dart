import 'package:final_project/view/screens/add_register_page.dart';
import 'package:final_project/view/screens/home.dart';
import 'package:final_project/view/screens/view_registers_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/add_register_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(child: const MyParking(), create: (_) => AddRegisterProvider()));
}

class MyParking extends StatelessWidget {
  const MyParking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        '/addPage': (context) => const AddRegisterPage(),
        '/viewRegisterPage': (context) => const ViewRegisterPage()
      },
    );
  }
}
