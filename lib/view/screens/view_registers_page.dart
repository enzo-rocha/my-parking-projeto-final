import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/add_register_provider.dart';

class ViewRegisterPage extends StatefulWidget {
  const ViewRegisterPage({Key? key}) : super(key: key);

  @override
  State<ViewRegisterPage> createState() => _ViewRegisterPageState();
}

class _ViewRegisterPageState extends State<ViewRegisterPage> {
  @override
  Widget build(BuildContext context) {
    final list = context.watch<AddRegisterProvider>().registers;
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.popAndPushNamed(context, '/');
        }),
        body: ListView(
          children: list
        )

    );
  }
}

