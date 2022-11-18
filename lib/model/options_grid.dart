import 'package:flutter/material.dart';

class OptionsGrid extends StatelessWidget {
  const OptionsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.horizontal, children: [
      Row(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)),
                width: 100,
                height: 100,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/addPage');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.add, color: Colors.white,),
                      Text(
                        "Adicionar registro",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)),
                width: 100,
                height: 100,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/viewRegisterPage');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(Icons.remove_red_eye, color: Colors.white,),
                      Text(
                        "Visuzalizar registros",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
                width: 100,
                height: 100,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/addPage');
                  },
                  child: const Text(
                    "Opa",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
                width: 100,
                height: 100,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/addPage');
                  },
                  child: const Text(
                    "Opa",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ))
        ],
      ),
    ]);
  }
}
