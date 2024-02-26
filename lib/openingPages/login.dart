import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/openingPages/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';


class logIn extends StatefulWidget {
  const logIn({Key? key}) : super(key: key);

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 1,
        ),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: -20,
                    left: -18,
                    child: Image.asset(
                      'img/squares.png',
                      width: 220,
                      height: 220,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:151,top: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          'أهلاً بك..',
                          style: TextStyle(color: Colors.indigo, fontSize: 40),
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'تسجيل الدخول',
                          style: TextStyle(color: Colors.indigo, fontSize: 40),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
              "البريد الالكتروني",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 35,
                ),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 10),
              TextField(
                controller:email,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: "البريد الالكتروني",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(70),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(70),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(70),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                ),
                textDirection: TextDirection.rtl,
              ),

              const SizedBox(height: 30),

              //password
              const Text(
                'كلمة المرور',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 35,
                ),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 7),


              TextField(
                controller: password,
                obscureText: true,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: "كلمة المرور",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(70),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(70),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(70),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                ),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 60),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SignUp();
                  }));
                },



                child: RichText(
                  textDirection: TextDirection.rtl,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 22,
                    ),
                    children: [
                      TextSpan(
                        text: 'ليس لديك حساب؟ ',
                        style: TextStyle(
                          color: Colors.black54, // Gray color for the first part
                        ),
                      ),
                      TextSpan(
                        text: 'تسجيل جديد',
                        style: TextStyle(
                          color: Colors.indigo, // Purple color for the second part
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 70),



              Align(
                alignment: Alignment.center,
                child:
                
                 MaterialButton(
                  onPressed: () async{
                    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email.text,
    password: password.text
  );
   Navigator.of(context).pushReplacementNamed("home");
} 
on FirebaseAuthException catch (e) {
  if (e.code == e.code) {
    print('No user found for that email.');
    AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'خطأ',
            desc: 'خطأ في البريد الإلكتروني أو كلمة السر',
            
            ).show();

  } 
  /*else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
    AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'خطأ',
            desc: 'كلمة السر خاطئة',
            
            ).show();
  }*/
}
                   
                  },
                  color: Colors.indigo,
                  textColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 100,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}