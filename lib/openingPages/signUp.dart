import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool allowLocation = false;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          
          automaticallyImplyLeading: true,

        ),
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
                  const Padding(
                    padding: EdgeInsets.only(left: 179, top: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'مرحباً بك..',
                          style: TextStyle(color: Colors.indigo, fontSize: 40),
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(height: 10),

                        Text(
                          'تسجيل جديد',
                          style: TextStyle(color: Colors.indigo, fontSize: 40),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'الاسم',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 35,
                ),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 10),

              //name input
              TextField(
                controller:username,
                keyboardType: TextInputType.name,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: "الاسم",
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


              const SizedBox(height: 20),

              //email input
              const Text(
                'البريد الإلكتروني',
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



              const SizedBox(height: 20),
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
                controller:password,
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
                textDirection:TextDirection.rtl,
              ),

              const SizedBox(height: 20),

              //allow loc 
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Checkbox(
                    value: allowLocation,
                    onChanged: (bool? value) {
                      setState(() {
                        allowLocation = value ?? false;
                      });
                    },
                    activeColor: Colors.grey,
                  ),
                  const Text(
                    'هل تريد السماح بالموقع؟',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 22,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
              const SizedBox(height: 10),

              //button

              Align(
                alignment: Alignment.center,
                child: MaterialButton(
                  onPressed: () async{
                    
                      try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email.text ,
    password: password.text,
  );
  Navigator.of(context).pushReplacementNamed("home");

} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('كلمة السر ضعيفة');
    AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'خطأ',
            desc: 'كلمة السر ضعيفة',
            
            ).show();


  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
    AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'خطأ',
            desc: 'البريد الالكتروني مستعمل',
            
            ).show();

    
  }
} 
                    // Add your login logic here
                  },
                  color: Colors.indigo,
                  textColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 11,
                    horizontal: 140,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: const Text(
                    'تسجيل',
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