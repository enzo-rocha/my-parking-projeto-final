import 'package:final_project/controller/gains_provider.dart';
import 'package:final_project/controller/number_of_lots_sp.dart';
import 'package:final_project/view/screens/add_register_page.dart';
import 'package:final_project/view/screens/gains_page.dart';
import 'package:final_project/view/screens/home.dart';
import 'package:final_project/view/screens/number_of_lots_page.dart';
import 'package:final_project/view/screens/settings_page.dart';
import 'package:final_project/view/screens/view_registers_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/add_register_provider.dart';
import 'controller/darkmode_sp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AddRegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NumberOfLotsState(),
        ),
        ChangeNotifierProvider(
          create: (_) => DarkModeSP(),
        ),
        ChangeNotifierProvider(
          create: (_) => GainsProvider(),
        ),
      ],
      child: const MyParking(),
    ),
  );
}

class MyParking extends StatelessWidget {
  const MyParking({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeSP>(
      builder: (___, stateDarkMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: stateDarkMode.darkMode == true ? ThemeData(brightness: Brightness.dark,) : ThemeData(brightness: Brightness.light,),
          title: 'MyParking',
          initialRoute: '/',
          routes: {
            '/': (context) => const Home(),
            '/addPage': (context) => const AddRegisterPage(),
            '/viewRegisterPage': (context) => const ViewRegisterPage(),
            '/settingsPage': (context) => const SettingsPage(),
            '/numberOfLotsPage': (context) => const NumberOfLotsPage(),
            '/gainsPage': (context) => GainsPage()
          },
        );
      }
    );
  }
}


////