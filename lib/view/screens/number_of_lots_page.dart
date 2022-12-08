import 'package:final_project/controller/add_register_provider.dart';
import 'package:final_project/controller/number_of_lots_sp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NumberOfLotsPage extends StatefulWidget {
   const NumberOfLotsPage({Key? key}) : super(key: key);

  @override
  State<NumberOfLotsPage> createState() => _NumberOfLotsPageState();
}

class _NumberOfLotsPageState extends State<NumberOfLotsPage> {
  final _numberController = TextEditingController();

  final  _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer2<AddRegisterProvider, NumberOfLotsState>(
      builder: (__, stateRegister, stateNumberOfLots, _) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Número de vagas',
            style: TextStyle(color: Colors.indigoAccent, fontFamily: 'Poppins'),
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
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _numberController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Campo obrigatório.';
                  }
                  return null;
                },

              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    (!(stateNumberOfLots.numberOfLots < stateRegister.registerDatabase.length)) ?
                     showDialog(context: context, builder: (context) => AlertDialog(
                      title: const Text("Alterar número de vagas",),
                      content: Text("Deseja alterar o número atual de vagas (${stateNumberOfLots.numberOfLots})?"),

                      actions: [
                        TextButton(onPressed: () {
                          Provider.of<NumberOfLotsState>(context, listen: false).changeNumberOfLots(_numberController.text);
                          Navigator.pop(context);
                        }, child: const Text("Sim")),
                        TextButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: const Text("Não")),
                      ],
                    )) :
                    showDialog(context: context, builder: (context) => AlertDialog(
                      title: const Text("Número de vagas não autorizado",),
                      content: const Text("Existem mais carros que o número de vagas escolhido. Finalize algumas estadias para alterar para este número de vagas."),

                      actions: [
                        TextButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: const Text("Ok")),
                      ],
                    ));
                  }
                },
                child: const Text('Confirmar'),
              ),
            ],
          ),
        ),
      );
    });
  }
}