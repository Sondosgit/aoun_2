import 'package:flutter/material.dart';


class pray extends StatefulWidget {
  
 const pray ({super.key });
 @override
 State<pray> createState() => _prayState();

} 
class _prayState extends State<pray> {
  
  @override
  Widget build(BuildContext context) {
    var row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        
        Text("صلاة الفجر"),
        Image.asset(
          'img/moon.png',
          height: 20,
          width: 20,
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Color(0xFF6869D6), size: 33),
          title: Text("الصلاه",
              style: TextStyle(
                  fontSize: 36,
                  color: Color(0xFF6869D6),
                  fontWeight: FontWeight.bold))),
      body: Center(
          child: Column(
        children: [
          Container(
            height: 10,
          ),
          Text("أوقات الصلاة",
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          Container(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 90.0,
            decoration: BoxDecoration(
              color: Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("5:01" ,style: TextStyle(
                  fontSize: 33,fontWeight: FontWeight.w200)),
                Text("صلاة الفجر" ,style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w200)),
                Image.asset(
                  'img/moon.png',
                  height: 50,
                  width: 50,
                )
              ],
            )),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 90.0,
            decoration: BoxDecoration(
              color: Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("12:11" ,style: TextStyle(
                  fontSize: 33,fontWeight: FontWeight.w200)),
                Text(" صلاة الظهر" ,style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w200)),
                Image.asset(
                  'img/sun.png',
                  height: 50,
                  width: 50,
                )
              ],
            )),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 90.0,
            decoration: BoxDecoration(
              color: Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("3:18" ,style: TextStyle(
                  fontSize: 33,fontWeight: FontWeight.w200)),
                Text("صلاة العصر" ,style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w200)),
                Image.asset(
                  'img/asr.png',
                  height: 50,
                  width: 50,
                )
              ],
            )),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 90.0,
            decoration: BoxDecoration(
              color: Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("5:40" ,style: TextStyle(
                  fontSize: 33,fontWeight: FontWeight.w200)),
                Text("صلاة المغرب" ,style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w200)),
                Image.asset(
                  'img/mgreb.png',
                  height: 50,
                  width: 50,
                )
              ],
            )),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 90.0,
            decoration: BoxDecoration(
              color: Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("7:10" ,style: TextStyle(
                  fontSize: 33,fontWeight: FontWeight.w200)),
                Text("صلاة العشاء" ,style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w200)),
                Image.asset(
                  'img/star.png',
                  height: 50,
                  width: 50,
                )
              ],
            )),
          ),
          
             
          
          
        ],
      )),
    );
  }
}
