import 'package:final_project/control/add_register_provider.dart';
import 'package:final_project/control/number_of_lots_sp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NumberOfLotsPage extends StatefulWidget {
  const NumberOfLotsPage({Key? key}) : super(key: key);

  @override
  State<NumberOfLotsPage> createState() => _NumberOfLotsPageState();
}

class _NumberOfLotsPageState extends State<NumberOfLotsPage> {
  final _numberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String requiredField = AppLocalizations.of(context)!.requiredField;
    String numberLots = AppLocalizations.of(context)!.numberOfLots;
    String changeLots = AppLocalizations.of(context)!.changeNumber;
    String wantToChange = AppLocalizations.of(context)!.wantToChange;
    String yes = AppLocalizations.of(context)!.yes;
    String no = AppLocalizations.of(context)!.no;
    String unauthorized = AppLocalizations.of(context)!.unauthorized;
    String moreCars = AppLocalizations.of(context)!.moreCars;
    String confirm = AppLocalizations.of(context)!.confirm;

    return Consumer2<AddRegisterProvider, NumberOfLotsState>(
        builder: (__, stateRegister, stateNumberOfLots, _) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            numberLots,
            style: const TextStyle(
                color: Colors.indigoAccent, fontFamily: 'Poppins'),
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
          child: Center(
            child: Container(
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
                  Colors.deepPurple,
                  Colors.blueAccent,
                  Colors.lightBlue
                ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        helperStyle: const TextStyle(
                            color: Colors.white, fontFamily: 'Poppins'),
                        prefixIcon:
                            const Icon(Icons.person, color: Colors.white),
                        enabledBorder: _buildBorder(Colors.white),
                        errorBorder: _buildBorder(Colors.red),
                        focusedErrorBorder: _buildBorder(Colors.red),
                        border: _buildBorder(Colors.white),
                        focusedBorder: _buildBorder(Colors.blueAccent),
                        disabledBorder: _buildBorder(Colors.white),
                        labelText: numberLots,
                        labelStyle: const TextStyle(
                            color: Colors.white, fontFamily: 'Poppins'),
                      ),
                      keyboardType: TextInputType.number,
                      controller: _numberController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return requiredField;
                        }
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        (!(int.parse(_numberController.text) <
                                stateRegister.registerDatabase.length))
                            ? showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text(
                                        changeLots,
                                      ),
                                      content: Text(
                                          "$wantToChange (${stateNumberOfLots.numberOfLots})?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Provider.of<NumberOfLotsState>(
                                                      context,
                                                      listen: false)
                                                  .changeNumberOfLots(
                                                      _numberController.text);
                                              Navigator.pop(context);
                                            },
                                            child: Text(yes)),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(no)),
                                      ],
                                    ))
                            : showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text(
                                        unauthorized,
                                      ),
                                      content: Text(moreCars),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Ok")),
                                      ],
                                    ));
                      }
                    },
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all<Color?>(
                          const Color.fromARGB(0, 0, 0, 0)),
                      backgroundColor: MaterialStateProperty.all<Color?>(
                          const Color.fromARGB(255, 255, 255, 255)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(34),
                        ),
                      ),
                      fixedSize: MaterialStateProperty.all(const Size(200, 40)),
                    ),
                    child: Text(confirm, style: const TextStyle(color: Colors.indigoAccent),),
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
