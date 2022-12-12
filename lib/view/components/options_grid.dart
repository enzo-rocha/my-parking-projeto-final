import 'package:final_project/control/add_register_provider.dart';
import 'package:final_project/control/number_of_lots_sp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OptionsGrid extends StatelessWidget {
  const OptionsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String add = AppLocalizations.of(context)!.add;
    String visualize = AppLocalizations.of(context)!.visualize;
    String gains = AppLocalizations.of(context)!.gains;
    String numberLots = AppLocalizations.of(context)!.numberLots;
    String checkParking = AppLocalizations.of(context)!.checkParking;
    String prices = AppLocalizations.of(context)!.prices;
    String totalLots = AppLocalizations.of(context)!.totalLots;
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
                           Text(
                            totalLots,
                            style: const TextStyle(
                                fontFamily: 'PoppinsLight',
                                fontSize: 22,
                                color: Colors.black),
                          ),
                          Text(
                            '$registerLength / ${stateNumberOfLots.numberOfLots}',
                            style: const TextStyle(
                                fontFamily: 'PoppinsLight',
                                fontSize: 50,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 9),
            child: Center(
              child: SizedBox(
                height: 34,
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.keyboard_arrow_down_outlined),
                    Text(checkParking, style: TextStyle(fontFamily: 'PoppinsLight', fontSize: 18),),
                    const Icon(Icons.keyboard_arrow_down_outlined)
                  ],
                ),
              ),
            ),
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
                      children: [
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 50,
                        ),
                        Text(
                          add,
                          style: const TextStyle(
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
                      children: [
                        const Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                          size: 50,
                        ),
                        Text(
                          visualize,
                          style: const TextStyle(
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
                      children: [
                        const Icon(
                          Icons.add_chart_outlined,
                          color: Colors.white,
                          size: 50,
                        ),
                        Text(
                          gains,
                          style: const TextStyle(
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
                      children: [
                        const Icon(
                          Icons.car_repair,
                          color: Colors.white,
                          size: 50,
                        ),
                        Text(
                          numberLots,
                          style: const TextStyle(
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
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  colors: [Colors.indigo, Colors.indigoAccent, Colors.blue],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              width: 310,
              height: 120,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pricesPage');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.monetization_on, color: Colors.white, size: 35,),
                    Text(prices, style: TextStyle(fontFamily: 'PoppinsLight', color: Colors.white, fontSize: 28),),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
