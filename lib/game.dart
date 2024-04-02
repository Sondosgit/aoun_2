import 'package:flutter/material.dart';

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
          iconTheme: IconThemeData(color: Color.fromARGB(255, 148, 77, 206), size: 33),
          title: Text("التمارين",
              style: TextStyle(
                  fontSize: 36,
                  color: Color.fromARGB(255, 148, 77, 206),
                  fontWeight: FontWeight.bold)
                  )),
                  
      body:Center(
        child: Column(
          children: [
            Container(
            height: 33,
          ),
      Container(
        child: Text("   لعبة المربعات المتغيرة",
            style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
                width: 400,
                height: 120,          
      ),
      SizedBox(
        height: 33,
        width:170,
      ),

      Container(
        child: Text("شرح اللعبة :                        لعبة ذهنية تعتمد على السرعة والتركيز في اختيار لون المربع المختلف"
        ,
            style: TextStyle(
                fontSize: 33,
                color: Colors.black,
                )),
                decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 193, 68, 255) ) ,borderRadius: BorderRadius.all(
                Radius.circular(25.0) )),
                width: 380,
                height: 210,
      ),
      SizedBox(
        height: 230  ),

      SizedBox(
              width: 380,
              height: 60,
              child: MaterialButton(
                  onPressed: () {
                  },          
             child:Text(
                  "ابدأ",
                  style: TextStyle(fontSize: 44,fontWeight: FontWeight.bold,color:Color.fromARGB(255, 245, 244, 240)
                  ),
                ),
                  padding: EdgeInsets.only(left: 110, right: 150),
                  color: Color.fromARGB(255, 129, 67, 206),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),  ),
              ),
            
          ]
      ),
      )

    );
  }
}
