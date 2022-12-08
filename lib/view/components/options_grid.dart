import 'package:final_project/controller/add_register_provider.dart';
import 'package:final_project/controller/number_of_lots_sp.dart';
import 'package:final_project/view/screens/number_of_lots_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class OptionsGrid extends StatelessWidget {
  const OptionsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerLength =
        context.watch<AddRegisterProvider>().registerDatabase.length;
    return Consumer2<AddRegisterProvider, NumberOfLotsState>(
      builder: (___, stateRegister, stateNumberOfLots, __) {
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
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/cars_parking.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 65, left: 3),
                      child: SizedBox(
                        width: 200,
                        height: 150,
                        child: Column(
                          children: [
                            const Text(
                              "Total de vagas:",
                              style: TextStyle(
                                  fontFamily: 'PoppinsLight', fontSize: 22, color: Colors.black),
                            ),
                            Text(
                              '$registerLength / ${stateNumberOfLots.numberOfLots}',
                              style: const TextStyle(
                                  fontFamily: 'PoppinsLight', fontSize: 50, color: Colors.black),
                            ),
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
                      stateRegister.getRegisters();
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
                    onPressed: () async {
                      await Navigator.pushNamed(
                        context,
                        '/viewRegisterPage',
                      );
                      stateRegister.getRegisters();
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
                        '/gainsPage',
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
                      Navigator.pushNamed(context, '/numberOfLotsPage');
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
    );
  }
}