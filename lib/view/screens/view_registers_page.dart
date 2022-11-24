import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/add_register_provider.dart';

class ViewRegisterPage extends StatelessWidget {
  const ViewRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<AddRegisterProvider>(context, listen: false).registers;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Visualizar estadias'),
        backgroundColor: Colors.indigoAccent,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
      ),
        body: ListView(
          children: list
        )

    );
  }
}

