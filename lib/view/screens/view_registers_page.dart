import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../controller/add_register_provider.dart';

class ViewRegisterPage extends StatefulWidget {
  const ViewRegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewRegisterPage> createState() => _ViewRegisterPageState();
}

class _ViewRegisterPageState extends State<ViewRegisterPage> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<AddRegisterProvider>(
      builder: (__, stateRegister, ___) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Visualizar estadias',
              style:
                  TextStyle(color: Colors.indigoAccent, fontFamily: 'Poppins'),
            ),
            iconTheme: const IconThemeData(color: Colors.indigoAccent),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          body: AnimatedList(
              key: _key,
              initialItemCount: stateRegister.registerDatabase.length,
              itemBuilder: (_, index, animation) {
                if (stateRegister.registerDatabase.isEmpty) {
                  return Container();
                }
                final register = stateRegister.registerDatabase[index];
                return SizeTransition(
                  sizeFactor: animation,
                  key: UniqueKey(),
                  child: Center(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: ElevatedButton(
                                onPressed: () async {
                                  final result = await showDialog<bool>(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text(
                                        "Finalizar estadia",
                                      ),
                                      content: Text(
                                          "Tem certeza que deseja finalizar a estadia de ${register.driverName}?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () async {
                                              await stateRegister.removeRow(
                                                register.id,
                                                register.driverName ?? '',
                                                register.licensePlate ?? '',
                                                register.entryDate ??
                                                    DateTime.now(),
                                              );
                                              Navigator.pop(context, true);
                                            },
                                            child: const Text("Sim")),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Não")),
                                      ],
                                    ),
                                  );

                                  if (result ?? false) {
                                    await stateRegister.getRegisters();
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  fixedSize: MaterialStateProperty.all(
                                      const Size(300, 40)),
                                ),
                                child: const Text(
                                  "Finalizar estadia",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: Colors.indigoAccent),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
