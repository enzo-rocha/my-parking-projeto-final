import 'package:final_project/control/gains_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class PricesPage extends StatelessWidget {
  const PricesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String prices = AppLocalizations.of(context)!.prices;
    String table = AppLocalizations.of(context)!.tablePrices;
    String money = AppLocalizations.of(context)!.money;

    return Consumer<GainsProvider>(
      builder: (___, stateGains, __) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              prices,
              style: const TextStyle(
                  color: Colors.indigoAccent, fontFamily: 'Poppins'),
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
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
                  Colors.deepPurple,
                  Colors.blueAccent,
                  Colors.lightBlue
                ],
                ), borderRadius: BorderRadius.circular(35),
              ),
              width: 325,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    width: 275,
                    height: 50,
                    child: Center(child: Text(table, style: const TextStyle(color: Colors.indigoAccent, fontFamily: 'Poppins', fontSize: 30),)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: DataTable(
                      sortColumnIndex: 0,
                      sortAscending: true,
                      columns: [
                        const DataColumn(
                            label: Text(
                              "Intervalo",
                              style: TextStyle(fontFamily: 'Poppins', fontSize: 25, color: Colors.white),
                            )),
                        DataColumn(
                            label: Text(
                              prices,
                              style: const TextStyle(fontFamily: 'Poppins', fontSize: 25, color: Colors.white),
                            ),
                            numeric: true),
                      ],
                      rows: [
                        DataRow(
                          cells: [
                            const DataCell(
                              Text(
                                "> 1h",
                                style: TextStyle(fontFamily: 'PoppinsLight', color: Colors.white, fontSize: 20),
                              ),
                            ),
                            DataCell(
                              Text(
                                "$money 4.00",
                                style: const TextStyle(fontFamily: 'PoppinsLight', color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            const DataCell(
                              Text(
                                "> 2h <= 4h",
                                style: TextStyle(fontFamily: 'PoppinsLight', color: Colors.white, fontSize: 20),
                              ),
                            ),
                            DataCell(
                              Text(
                                "$money 3.75",
                                style: const TextStyle(fontFamily: 'PoppinsLight', color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            const DataCell(
                              Text(
                                "> 4h <= 8h",
                                style: TextStyle(fontFamily: 'PoppinsLight', color: Colors.white, fontSize: 20),
                              ),
                            ),
                            DataCell(
                              Text(
                                "$money 3.50",
                                style: const TextStyle(fontFamily: 'PoppinsLight', color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            const DataCell(
                              Text(
                                "> 8h",
                                style: TextStyle(fontFamily: 'PoppinsLight', color: Colors.white, fontSize: 20),
                              ),
                            ),
                            DataCell(
                              Text(
                                "$money 8.00",
                                style: const TextStyle(fontFamily: 'PoppinsLight', color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
