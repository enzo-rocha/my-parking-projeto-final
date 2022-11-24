import 'package:final_project/view/screens/number_of_lots_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class OptionsGrid extends StatelessWidget {
  const OptionsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      addAutomaticKeepAlives: false,
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          colors: [
                            Colors.indigo,
                            Colors.indigoAccent,
                            Colors.blue
                          ]),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 150,
                    height: 150,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/addPage',
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            "Adicionar",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'PoppinsLight',
                                fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          colors: [
                            Colors.indigo,
                            Colors.indigoAccent,
                            Colors.blue
                          ]),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 150,
                    height: 150,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/viewRegisterPage',
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.remove_red_eye,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            "Visuzalizar",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'PoppinsLight',
                                fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          colors: [
                            Colors.indigo,
                            Colors.indigoAccent,
                            Colors.blue
                          ]),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 150,
                    height: 150,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/addPage',
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.monetization_on,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            "Rendimentos",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'PoppinsLight',
                                fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          colors: [
                            Colors.indigo,
                            Colors.indigoAccent,
                            Colors.blue
                          ]),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 150,
                    height: 150,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const NumberOfLotsPage(),
                                type: PageTransitionType.rightToLeft));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.car_repair,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            "N° de vagas",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'PoppinsLight',
                                fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
