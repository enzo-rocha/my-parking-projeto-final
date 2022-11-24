import 'package:final_project/model/add_register_provider.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: Text('Adicionar estadias'),
        backgroundColor: Colors.indigoAccent,
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
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
                Colors.deepPurple,
                Colors.blueAccent,
                Colors.lightBlue
              ]),
              borderRadius: BorderRadius.circular(30),
            ),
            width: 350,
            height: 550,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
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
                      prefixIcon: const Icon(Icons.person, color: Colors.white),
                      enabledBorder: _buildBorder(Colors.white),
                      errorBorder: _buildBorder(Colors.red),
                      focusedErrorBorder: _buildBorder(Colors.red),
                      border: _buildBorder(Colors.white),
                      focusedBorder: _buildBorder(Colors.blueAccent),
                      disabledBorder: _buildBorder(Colors.white),
                      labelText: 'Nome do motorista',
                      labelStyle: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
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
                        prefixIcon: const Icon(Icons.car_rental, color: Colors.white),
                        enabledBorder: _buildBorder(Colors.white),
                        errorBorder: _buildBorder(Colors.red),
                        focusedErrorBorder: _buildBorder(Colors.red),
                        border: _buildBorder(Colors.white),
                        focusedBorder: _buildBorder(Colors.white),
                        disabledBorder: _buildBorder(Colors.white),
                        labelText: 'Placa do veículo',
                        labelStyle: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Provider.of<AddRegisterProvider>(context, listen: false)
                          .addRegister(_driverNameController.text,
                              _licensePlateController.text, DateTime.now());
                      Navigator.popAndPushNamed(context, '/');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Adicionar",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                )
              ],
            ),
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
