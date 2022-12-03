import 'dart:io';
import 'package:final_project/controller/add_register_provider.dart';
import 'package:final_project/controller/number_of_lots_sp.dart';
import 'package:final_project/database.dart';
import 'package:final_project/model/add_register_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddRegisterPage extends StatefulWidget {
  const AddRegisterPage({Key? key,}) : super(key: key);


  @override
  State<AddRegisterPage> createState() => _AddRegisterPageState();
}

class _AddRegisterPageState extends State<AddRegisterPage> {
  ImagePicker imagePicker = ImagePicker();
  File? pickedImage;
  final TextEditingController _driverNameController = TextEditingController();
  final TextEditingController _licensePlateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Adicionar estadias',
          style: TextStyle(color: Colors.indigoAccent, fontFamily: 'Poppins'),
        ),
        iconTheme: const IconThemeData(color: Colors.indigoAccent),
        backgroundColor: Colors.white,
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    width: 325,
                    height: 75,
                    child: Center(
                        child: Text(
                      "Total de vagas: ${Provider.of<NumberOfLotsState>(context, listen: false).numberOfLots}",
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
                            controller: _driverNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Campo obrigatório';
                              } else if (value.length > 40) {
                                return 'Nome muito extenso.';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon:
                                  const Icon(Icons.person, color: Colors.white),
                              enabledBorder: _buildBorder(Colors.white),
                              errorBorder: _buildBorder(Colors.red),
                              focusedErrorBorder: _buildBorder(Colors.red),
                              border: _buildBorder(Colors.white),
                              focusedBorder: _buildBorder(Colors.blueAccent),
                              disabledBorder: _buildBorder(Colors.white),
                              labelText: 'Nome do motorista',
                              labelStyle: const TextStyle(
                                  color: Colors.white, fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.length > 7) {
                              return 'Placa muito extensa.';
                            } else if (value.isEmpty) {
                              return 'Campo obrigatório.';
                            } else if (value.length < 7) {
                              return 'Placa muito curta.';
                            }
                            return null;
                          },
                          controller: _licensePlateController,
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.car_rental, color: Colors.white),
                            enabledBorder: _buildBorder(Colors.white),
                            errorBorder: _buildBorder(Colors.red),
                            focusedErrorBorder: _buildBorder(Colors.red),
                            border: _buildBorder(Colors.white),
                            focusedBorder: _buildBorder(Colors.white),
                            disabledBorder: _buildBorder(Colors.white),
                            labelText: 'Placa do veículo',
                            labelStyle: const TextStyle(
                                color: Colors.white, fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                      pickedImage == null
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
                                  pickedImage!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      IconButton(
                          onPressed: () {
                            getImage();
                          },
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          )),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (!(Provider.of<AddRegisterProvider>(context,
                                        listen: false)
                                    .registers
                                    .length ==
                                Provider.of<NumberOfLotsState>(context,
                                        listen: false)
                                    .numberOfLots)) {
                              var db = DatabaseHelper();
                              db.insert(Register(driverName: _driverNameController.text, licensePlate: _licensePlateController.text, entryDate: DateTime.now()));
                              Provider.of<AddRegisterProvider>(context,
                                      listen: false)
                                  .addRegister(
                                      _driverNameController.text,
                                      _licensePlateController.text,
                                      DateTime.now(),
                                      pickedImage);
                              Navigator.pop(context);
                            }
                          }
                        },
                        style: ButtonStyle(
                          shadowColor: MaterialStateProperty.all<Color?>(
                              const Color.fromARGB(0, 0, 0, 0)),
                          backgroundColor: MaterialStateProperty.all<Color?>(
                              const Color.fromARGB(255, 255, 255, 255)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(34),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Adicionar",
                          style: TextStyle(color: Colors.blueAccent),
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
  }

  Future getImage() async {
    var temporaryImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (temporaryImage != null) {
      setState(() {
        pickedImage = File(temporaryImage.path);
      });
    }
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
