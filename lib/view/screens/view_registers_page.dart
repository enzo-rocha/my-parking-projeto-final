import 'package:final_project/control/gains_provider.dart';
import 'package:final_project/view/screens/add_register_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../control/add_register_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

    String visualizeStays = AppLocalizations.of(context)!.visualizeStays;
    String noLotsFilled = AppLocalizations.of(context)!.noLotsFilled;
    String driver = AppLocalizations.of(context)!.driver;
    String plate = AppLocalizations.of(context)!.plate;
    String entry = AppLocalizations.of(context)!.entry;
    String endStay = AppLocalizations.of(context)!.endStay;
    String areYouSure = AppLocalizations.of(context)!.areYouSure;
    String yes = AppLocalizations.of(context)!.yes;
    String no = AppLocalizations.of(context)!.no;

    return Consumer3<AddRegisterProvider, GainsProvider, PhotosProvider>(
      builder: (__, stateRegister, stateGains, statePhoto, ___) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              visualizeStays,
              style:
              const TextStyle(color: Colors.indigoAccent, fontFamily: 'Poppins'),
            ),
            iconTheme: const IconThemeData(color: Colors.indigoAccent),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          body: (stateRegister.registerDatabase.isEmpty) ? Center(
            child: SizedBox(
              width: 300,
              height: 200,
              child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  const Center(child: Icon(Icons.car_crash, size: 80,)),
                  Text(noLotsFilled, style: const TextStyle(fontFamily: 'Poppins'),)
                ],),
            ),
          ) : ListView.builder (
              key: _key,
              itemCount: stateRegister.registerDatabase.length,
              itemBuilder: (context, index) {
                final register = stateRegister.registerDatabase[index];
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
                                (statePhoto.photos[index] == null)
                                    ? Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Colors.white,
                                        ),
                                        width: 90,
                                        height: 90,
                                        child: const Icon(
                                          Icons.no_photography,
                                          color: Colors.indigoAccent,
                                          size: 70,
                                        ),
                                      )
                                    :
                                SizedBox(
                                          width: 90,
                                          height: 90,
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(10)),
                                            child: Image.file(
                                              statePhoto.photos[index]!,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "$driver: ${register.driverName}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: "PoppinsLight"),
                                        ),
                                        Text(
                                          "$plate: ${register.licensePlate}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: "PoppinsLight"),
                                        ),
                                        Text(
                                          "$entry: ${DateFormat("dd/MM/yyyy - HH:mm").format(register.entryDate ?? DateTime.now())}",
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
                                    title: Text(
                                      endStay,
                                    ),
                                    content: Text(
                                        areYouSure),
                                    actions: [
                                      TextButton(
                                          onPressed: () async {
                                            Navigator.pop(context, true);

                                              await stateRegister.removeRow(
                                              register.id,
                                              register.driverName ?? '',
                                              register.licensePlate ?? '',
                                              register.exitDate ?? DateTime.now(),
                                            );
                                              await stateGains.getRegistersNotNull();
                                             await stateRegister.registerDatabase.remove(index);
                                            statePhoto.addDelete(statePhoto.photos[index]);
                                            statePhoto.remove(index);
                                            stateGains.calcGain(int.parse(DateFormat("HH").format(register.exitDate ?? DateTime.now())) - int.parse(DateFormat("HH").format(register.entryDate ?? DateTime.now())));
                                          },
                                          child: Text(yes)),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(no)),
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
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(34),
                                  ),
                                ),
                              ),

                              child: Text(
                                endStay,
                                style: const TextStyle(
                                    fontFamily: "Poppins",
                                    color: Colors.indigoAccent),
                              ),
                            ),
                          )
                        ],
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