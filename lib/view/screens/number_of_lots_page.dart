import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Número de vagas'),
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
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                    Provider.of<NumberOfLotsState>(context, listen: false).changeNumberOfLots(_numberController.text);
                }
              },
              child: const Text('Confirmar'),
            ),
            ElevatedButton(onPressed: (){
              print(Provider.of<NumberOfLotsState>(context, listen: false).numberOfLots);
            }, child: Text('opa'))
          ],
        ),
      ),
    );
  }
}

class NumberOfLotsState extends ChangeNotifier {
  NumberOfLotsState() {
    _init();
  }

  int _numberOfLots = 0;
  int get numberOfLots => _numberOfLots;

  Future<void> _init() async {
    final prefs = await SharedPreferences.getInstance();
    _numberOfLots = prefs.getInt('number') ?? 0;
      notifyListeners();
    }

  Future<void> changeNumberOfLots(controller) async {
    final prefs = await SharedPreferences.getInstance();
    final text = controller.toString();
    final number = int.parse(text);
    _numberOfLots = number;
    await prefs.setInt('number', _numberOfLots);
    notifyListeners();
  }


}
