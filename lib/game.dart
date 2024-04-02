import 'package:flutter/material.dart';
import 'package:hello_world/logic/pages/game.dart';

class exercise extends StatefulWidget {
  const exercise({super.key});
  @override
  State<exercise> createState() => _exerciseState();
}

class _exerciseState extends State<exercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Color(0xFF6869D6), size: 33),
          title: Text("التمارين",
              style: TextStyle(
                  fontSize: 36,
                  color: Color(0xFF6869D6),
                  fontWeight: FontWeight.bold))),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('لعبة', style: TextStyle(fontSize: 50)),
              const Text('المربعات المتغيرة', style: TextStyle(fontSize: 50)),
              const SizedBox(height: 16),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  padding: EdgeInsets.all(10),
                  //height: 90.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Color.fromARGB(255, 229, 214, 255),
                      width: 6,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text("شرح اللعبة  ",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold)),
                      Text(
                          " لعبة ذهنية تعتمد على السرعة والتركيز في اختيار لون المربع المختلف",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w200)),
                    ],
                  )),
                  Container(height: 33,),
              SizedBox(
                width: 250, // <-- Your width
                height: 60, // <-- Your height
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Game()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6869D6),
                  ),
                  child: Row(mainAxisSize: MainAxisSize.min, children: const [
                    Text('ابدأ التمرين',
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}