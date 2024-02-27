

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/edit.dart';
class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {

 
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            iconTheme: IconThemeData(color: Color(0xFF6869D6), size: 33),
            title: Text("الأعدادات",
                style: TextStyle(
                    fontSize: 36,
                    color: Color(0xFF6869D6),
                    fontWeight: FontWeight.bold))),
        body: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(children: [
              Container(
                  width: 500,
                  height: 450,
                  margin: EdgeInsets.symmetric(vertical: 80, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                          "..تطبيق عون \n يوفر لك وسائل مطورة نحو حياة أفضل",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 26,
                              color: Color(0xFFA6A6A6),
                              fontWeight: FontWeight.w100)),
                      Container(
                        height: 40,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Edit()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'تعديل الملف الشخصي',
                              textAlign: TextAlign.right,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 30),
                            ), // <-- Text
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.person,
                              size: 40.0,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: Row(mainAxisSize: MainAxisSize.min, children: const [
                    Text('تسجيل الخروج',
                        style: TextStyle(color: Colors.black, fontSize: 25)),
                    Icon(
                      Icons.logout_rounded,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ]),
                ),
              ))
            ])));
  }
}