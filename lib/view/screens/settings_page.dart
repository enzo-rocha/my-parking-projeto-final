import 'package:final_project/controller/darkmode_sp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeSP>(builder: (__, stateDarkMode, ___) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all<Color?>(
                      const Color.fromARGB(0, 0, 0, 0),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color?>(
                      Colors.indigoAccent
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          34,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    stateDarkMode.changeDarkMode();
                  },
                  child: Column(
                    children: [
                      stateDarkMode.darkMode
                          ? const Icon(Icons.light_mode)
                          : const Icon(Icons.dark_mode),
                      stateDarkMode.darkMode
                          ? const Text("Trocar para tema claro")
                          : const Text("Trocar para tema escuro"),
                    ],
                  )),
            ],
          ),
        ),
      );
    });
  }
}
