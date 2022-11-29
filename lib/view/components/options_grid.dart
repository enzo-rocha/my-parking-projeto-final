import 'package:final_project/model/add_register_provider.dart';
import 'package:final_project/model/number_of_lots_sp.dart';
import 'package:final_project/view/screens/number_of_lots_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class OptionsGrid extends StatelessWidget {
  const OptionsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: SizedBox(
              width: 325,
              height: 225,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      'assets/images/cars_parking.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 55, left: 15),
                    child: SizedBox(
                      width: 160,
                      height: 150,
                      child: Column(
                        children: [
                          const Text("Total de vagas:", style: TextStyle(fontFamily: 'PoppinsLight', fontSize: 15),),
                          Text('${context.watch<AddRegisterProvider>().registers.length} / ${context.watch<NumberOfLotsState>().numberOfLots}', style: const TextStyle(fontFamily: 'PoppinsLight', fontSize: 45),),
                        ],
                      ),
                    ),
                  )
                ],
              )),
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
                    Navigator.pushNamed(context, '/addPage');
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
                          curve: Curves.elasticOut,
                          child: const NumberOfLotsPage(),
                          type: PageTransitionType.rightToLeft),
                    );
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
    );
  }
}
