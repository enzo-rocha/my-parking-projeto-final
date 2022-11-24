import 'package:final_project/model/add_register_provider.dart';
import 'package:final_project/view/screens/number_of_lots_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRegisterPage extends StatefulWidget {
  const AddRegisterPage({Key? key}) : super(key: key);

  @override
  State<AddRegisterPage> createState() => _AddRegisterPageState();
}

class _AddRegisterPageState extends State<AddRegisterPage> {
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
      body: Form(
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
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (!(Provider.of<AddRegisterProvider>(context,
                                      listen: false)
                                  .registers
                                  .length ==
                              Provider.of<NumberOfLotsState>(context,
                                      listen: false)
                                  .numberOfLots)) {
                            Provider.of<AddRegisterProvider>(context,
                                    listen: false)
                                .addRegister(
                                    _driverNameController.text,
                                    _licensePlateController.text,
                                    DateTime.now());
                            Navigator.popAndPushNamed(context, '/');
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
    );
  }
}

OutlineInputBorder _buildBorder(Color color) {
  return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(34)),
      borderSide: BorderSide(
        color: color,
        width: 2.0,
      ));
}
