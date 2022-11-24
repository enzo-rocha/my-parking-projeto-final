import 'package:final_project/view/screens/add_register_page.dart';
import 'package:final_project/view/screens/home.dart';
import 'package:final_project/view/screens/number_of_lots_page.dart';
import 'package:final_project/view/screens/settings_page.dart';
import 'package:final_project/view/screens/view_registers_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/add_register_provider.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/addPage': (context) => const AddRegisterPage(),
        '/viewRegisterPage': (context) => const ViewRegisterPage(),
        '/settingsPage': (context) => const SettingsPage(),
        '/numberOfLotsPage': (context) => const NumberOfLotsPage()
      },
    );
  }
}
