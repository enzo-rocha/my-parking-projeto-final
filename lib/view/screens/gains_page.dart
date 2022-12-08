import 'package:final_project/controller/gains_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class GainsPage extends StatelessWidget {
  GainsPage({Key? key}) : super(key: key);
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<GainsProvider>(builder: (___, stateGains, __) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Rendimentos',
            style: TextStyle(color: Colors.indigoAccent, fontFamily: 'Poppins'),
          ),
          iconTheme: const IconThemeData(color: Colors.indigoAccent),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: ListView.builder(
            key: _key,
            itemCount: stateGains.registerDatabaseFinished.length,
            itemBuilder: (context, index) {
              final register = stateGains.registerDatabaseFinished[index];
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.indigoAccent,
                    ),
                    width: 340,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          height: 100,
                          child: Row(
                            children: [
                              // (stateRegister.registers[index].photo == null)
                              //     ? Container(
                              //         decoration: const BoxDecoration(
                              //           borderRadius: BorderRadius.all(
                              //               Radius.circular(10)),
                              //           color: Colors.white,
                              //         ),
                              //         width: 90,
                              //         height: 90,
                              //         child: const Icon(
                              //           Icons.no_photography,
                              //           color: Colors.indigoAccent,
                              //           size: 70,
                              //         ),
                              //       )
                              //     :
                              // SizedBox(
                              //           width: 90,
                              //           height: 90,
                              //           child: ClipRRect(
                              //             borderRadius: const BorderRadius.all(
                              //                 Radius.circular(10)),
                              //             child: Image.file(
                              //               stateRegister.registerDatabase[index]
                              //                   .photo!,
                              //               fit: BoxFit.cover,
                              //             ),
                              //           ),
                              //         ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Motorista: ${register.driverName}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "PoppinsLight"),
                                      ),
                                      Text(
                                        "Placa: ${register.licensePlate}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "PoppinsLight"),
                                      ),
                                      Text(
                                        "Entrada: ${DateFormat("dd/MM/yyyy - HH:mm").format(register.entryDate ?? DateTime.now())}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: "PoppinsLight"),
                                      ),
                                      Text(
                                        "Saída: ${DateFormat("dd/MM/yyyy - HH:mm").format(register.exitDate ?? DateTime.now())}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'PoppinsLight'),
                                      )
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
    });
  }
}
