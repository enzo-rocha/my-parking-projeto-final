import 'package:flutter/material.dart';

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
                }
              },
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}
