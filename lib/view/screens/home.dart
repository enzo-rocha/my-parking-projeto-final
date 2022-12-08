import 'package:final_project/view/components/options_grid.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, condition) {
          return <Widget>[
            SliverAppBar(
              shadowColor: Colors.transparent,
              backgroundColor: Colors.indigoAccent,
              shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/settingsPage');
                  },
                  icon: const Icon(
                    Icons.settings,
                  ),
                ),
              ],
              expandedHeight: 200,
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/my_parking.png',
                  fit: BoxFit.cover,
                ),
                centerTitle: true,
                title: const Text(
                  'MyParking',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
                stretchModes: const [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle
                ],
              ),
            )
          ];
        },
        body: Center(
          child: ListView(children: const [OptionsGrid()]),
        ),
      ),
    );
  }
}