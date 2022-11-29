import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/add_register_provider.dart';

class ViewRegisterPage extends StatelessWidget {
  const ViewRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<AddRegisterProvider>(context, listen: false).registers;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Visualizar estadias',
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
        body: ListView(
          children: list
        )

    );
  }
}

