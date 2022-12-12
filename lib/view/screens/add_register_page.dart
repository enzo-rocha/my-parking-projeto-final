import 'dart:io';
import 'package:final_project/control/add_register_provider.dart';
import 'package:final_project/control/gains_provider.dart';
import 'package:final_project/control/number_of_lots_sp.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddRegisterPage extends StatefulWidget {
  const AddRegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddRegisterPage> createState() => _AddRegisterPageState();
}

class _AddRegisterPageState extends State<AddRegisterPage> {
  final TextEditingController _driverNameController = TextEditingController();
  final TextEditingController _licensePlateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

   String addStay = AppLocalizations.of(context)!.addStay;
   String totalLots = AppLocalizations.of(context)!.totalLots;
   String driverName = AppLocalizations.of(context)!.driverName;
   String licensePlate = AppLocalizations.of(context)!.licensePlate;
   String noLots = AppLocalizations.of(context)!.noLotsAv;
   String lotsR = AppLocalizations.of(context)!.lotsReached;
   String add = AppLocalizations.of(context)!.add;
   String requiredField = AppLocalizations.of(context)!.requiredField;
   String nameTooLong = AppLocalizations.of(context)!.nameTooLong;
   String shortPlate = AppLocalizations.of(context)!.veryShortPlate;
   String longPlate = AppLocalizations.of(context)!.veryLongPlate;


    return Consumer4<AddRegisterProvider, NumberOfLotsState, PhotosProvider, GainsProvider>(
        builder: (___, stateRegister, stateNumberOfLots, statePhoto, stateGains, __) {
      final equalNumberOfLost = !(stateRegister.registerDatabase.length ==
          stateNumberOfLots.numberOfLots);
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            addStay,
            style: const TextStyle(color: Colors.indigoAccent, fontFamily: 'Poppins'),
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
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 325,
                      height: 75,
                      child: Center(
                          child: Text(
                        "$totalLots ${stateNumberOfLots.numberOfLots}",
                        style: const TextStyle(
                            fontFamily: 'PoppinsLight',
                            color: Colors.indigoAccent,
                            fontSize: 25),
                      )),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          colors: [
                            Colors.deepPurple,
                            Colors.blueAccent,
                            Colors.lightBlue
                          ]),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    width: 325,
                    height: 550,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 35.0),
                            child: TextFormField(
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'PoppinsLight'),
                              controller: _driverNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return requiredField;
                                } else if (value.length > 30) {
                                  return nameTooLong;
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                helperStyle: const TextStyle(
                                    color: Colors.white, fontFamily: 'Poppins'),
                                prefixIcon: const Icon(Icons.person,
                                    color: Colors.white),
                                enabledBorder: _buildBorder(Colors.white),
                                errorBorder: _buildBorder(Colors.red),
                                focusedErrorBorder: _buildBorder(Colors.red),
                                border: _buildBorder(Colors.white),
                                focusedBorder: _buildBorder(Colors.blueAccent),
                                disabledBorder: _buildBorder(Colors.white),
                                labelText: driverName,
                                labelStyle: const TextStyle(
                                    color: Colors.white, fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'PoppinsLight'),
                            validator: (value) {
                              if (value!.length > 7) {
                                return longPlate;
                              } else if (value.isEmpty) {
                                return requiredField;
                              } else if (value.length < 7) {
                                return shortPlate;
                              }
                              return null;
                            },
                            controller: _licensePlateController,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.car_rental,
                                  color: Colors.white),
                              enabledBorder: _buildBorder(Colors.white),
                              errorBorder: _buildBorder(Colors.red),
                              focusedErrorBorder: _buildBorder(Colors.red),
                              border: _buildBorder(Colors.white),
                              focusedBorder: _buildBorder(Colors.white),
                              disabledBorder: _buildBorder(Colors.white),
                              labelText: licensePlate,
                              labelStyle: const TextStyle(
                                  color: Colors.white, fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                        statePhoto.pickedImage == null
                            ? Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                    color: Colors.indigoAccent,
                                    borderRadius: BorderRadius.circular(18)),
                                child: const Icon(
                                  Icons.add_a_photo_outlined,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              )
                            : SizedBox(
                                width: 150,
                                height: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: Image.file(
                                    statePhoto.pickedImage!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                        IconButton(
                            onPressed: () {
                              statePhoto.getImage();
                            },
                            icon: const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (equalNumberOfLost) {
                                  await stateRegister.addRow(
                                    _driverNameController.text,
                                    _licensePlateController.text,
                                    DateTime.now(),
                                  );
                                  statePhoto.photos.add(statePhoto.pickedImage);
                                  statePhoto.pickedImage = null;
                                  await stateRegister.getRegisters();
                                  // ignore: use_build_context_synchronously
                                  Navigator.pop(context);
                                } else if (!equalNumberOfLost) {
                                  await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(
                                        noLots,
                                      ),
                                      content: Text(
                                          lotsR),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            stateRegister.getRegisters();
                                          },
                                          child: const Text("Ok"),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              }
                            },
                            style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all<Color?>(
                                  const Color.fromARGB(0, 0, 0, 0)),
                              backgroundColor: MaterialStateProperty.all<Color?>(
                                  const Color.fromARGB(255, 255, 255, 255)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(34),
                                ),
                              ),
                              fixedSize: MaterialStateProperty.all(
                                  const Size(200, 40)),
                            ),
                            child: Text(
                              add,
                              style: const TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

OutlineInputBorder _buildBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(34)),
    borderSide: BorderSide(
      color: color,
      width: 2.0,
    ),
  );
}

class PhotosProvider with ChangeNotifier {
  List<File?> photos = [];
  List<File?> deletedPhotos = [];

  ImagePicker imagePicker = ImagePicker();
  File? pickedImage;

  Future getImage() async {
    var temporaryImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (temporaryImage != null) {
      pickedImage = File(temporaryImage.path);
    }
    notifyListeners();
  }

  remove(int index) {
    photos.removeAt(index);
    notifyListeners();
  }

  addDelete(File? photo) {
    deletedPhotos.add(photo);
    notifyListeners();
  }
}
