import 'package:final_project/control/darkmode_sp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {

    String settings = AppLocalizations.of(context)!.settings;

    return Consumer<DarkModeSP>(builder: (__, stateDarkMode, ___) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            settings,
            style: const TextStyle(color: Colors.indigoAccent, fontFamily: 'Poppins'),
          ),
          iconTheme: const IconThemeData(color: Colors.indigoAccent),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlue.shade200,
                ),
                child: ToggleButtons(
                  color: Colors.black,
                  fillColor: Colors.indigoAccent,
                  isSelected: stateDarkMode.isSelected,
                  selectedColor: Colors.white,
                  renderBorder: false,
                  borderRadius: BorderRadius.circular(20),
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Light",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'PoppinsLight',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Dark",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'PoppinsLight',
                        ),
                      ),
                    ),
                  ],
                  onPressed: (int newIndex) {
                    setState(() {
                      for (int index = 0;
                          index < stateDarkMode.isSelected.length;
                          index++) {
                        if (index == newIndex) {
                          stateDarkMode.isSelected[index] = true;
                        } else {
                          stateDarkMode.isSelected[index] = false;
                        }
                        if (stateDarkMode.isSelected[0] == true) {
                          stateDarkMode.changeDarkMode(0);
                          stateDarkMode.saveIndex(index, true, false);
                        } else {
                          stateDarkMode.changeDarkMode(1);
                          stateDarkMode.saveIndex(index, false, true);
                        }
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
