import 'dart:io';
import 'package:final_project/control/gains_provider.dart';
import 'package:final_project/view/screens/add_register_page.dart';
import 'package:final_project/view/screens/pdf_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class GainsPage extends StatefulWidget {
  const GainsPage({Key? key}) : super(key: key);

  @override
  State<GainsPage> createState() => _GainsPageState();
}

class _GainsPageState extends State<GainsPage> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    String gains = AppLocalizations.of(context)!.gains;
    String driver = AppLocalizations.of(context)!.driver;
    String plate = AppLocalizations.of(context)!.plate;
    String entry = AppLocalizations.of(context)!.entry;
    String exit = AppLocalizations.of(context)!.exit;
    String noGains = AppLocalizations.of(context)!.noGains;
    String totalGains = AppLocalizations.of(context)!.totalOfGains;
    String gainsUnique = AppLocalizations.of(context)!.gainsUnique;
    String ticket = AppLocalizations.of(context)!.ticket;

    int i = 0;

    final pdf = pw.Document();

    writeOnPdf(int index, int gain) {
      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(32),
          build: (pw.Context con) {
            return <pw.Widget> [
              pw.Header(
                level: 0,
                child: pw.Text(ticket)
              ),
              pw.Paragraph(
                text: "$driver: ${Provider.of<GainsProvider>(context, listen: false).registerDatabaseFinished[index].driverName}"
              ),
              pw.Paragraph(
                  text: "$plate: ${Provider.of<GainsProvider>(context, listen: false).registerDatabaseFinished[index].licensePlate}"
              ),
              pw.Paragraph(
                  text: "$entry: ${Provider.of<GainsProvider>(context, listen: false).registerDatabaseFinished[index].entryDate}"
              ),
              pw.Paragraph(
                  text: "$exit: ${Provider.of<GainsProvider>(context, listen: false).registerDatabaseFinished[index].exitDate}"
              ),
              pw.Paragraph(
                  text: "$gainsUnique${Provider.of<GainsProvider>(context, listen: false).getPrice(gain)}"
              ),
            ];
          }
        )
      );
    }

    Future savePdf() async {
      Directory documentDirectory = await getApplicationDocumentsDirectory();

      String documentsPath = documentDirectory.path;
      File file = File("$documentsPath/ticket$i.pdf");
      file.writeAsBytesSync(await pdf.save());

    }

    return Consumer2<GainsProvider, PhotosProvider>(
      builder: (___, stateGains, statePhoto, __) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              gains,
              style: const TextStyle(
                  color: Colors.indigoAccent, fontFamily: 'Poppins'),
            ),
            iconTheme: const IconThemeData(color: Colors.indigoAccent),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          bottomNavigationBar: BottomAppBar(
            notchMargin: 45,
            color: Colors.indigoAccent,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "$totalGains${stateGains.totalGains}",
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'PoppinsLight',
                    fontSize: 25),
              ),
            ),
          ),
          body: stateGains.registerDatabaseFinished.isEmpty
              ? Center(
                  child: SizedBox(
                    width: 300,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Center(
                            child: Icon(
                          Icons.money_off,
                          size: 80,
                        )),
                        Text(
                          noGains,
                          style: const TextStyle(fontFamily: 'Poppins'),
                        )
                      ],
                    ),
                  ),
                )
              : ListView.builder(
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
                          height: 140,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 300,
                                height: 100,
                                child: Row(
                                  children: [
                                    (statePhoto.deletedPhotos[index] == null)
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
                                        : SizedBox(
                                            width: 70,
                                            height: 70,
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              child: Image.file(
                                                statePhoto
                                                    .deletedPhotos[index]!,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
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
                                            Text(
                                              "$exit: ${DateFormat("dd/MM/yyyy - HH:mm").format(register.exitDate ?? DateTime.now())}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'PoppinsLight'),
                                            ),
                                            Text(
                                              "$gainsUnique${stateGains.getPrice(int.parse(DateFormat("HH").format(register.exitDate ?? DateTime.now())) - int.parse(DateFormat("HH").format(register.entryDate ?? DateTime.now())))}",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'PoppinsLight'),
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4),
                                      child: IconButton(
                                          onPressed: () async {

                                            int gain = int.parse(DateFormat("HH").format(register.exitDate ?? DateTime.now())) - int.parse(DateFormat("HH").format(register.entryDate ?? DateTime.now()));
                                            writeOnPdf(index, gain);
                                            await savePdf();

                                            Directory documentDirectory = await getApplicationDocumentsDirectory();
                                            String documentsPath = documentDirectory.path;

                                            String fullPath = "$documentsPath/ticket$i.pdf";

                                            setState(() {
                                              i++;
                                            });
                                            // ignore: use_build_context_synchronously
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => PdfPreview(path: fullPath)));
                                          },
                                          icon: const Icon(
                                            Icons.file_download,
                                            color: Colors.white,
                                            size: 35,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
