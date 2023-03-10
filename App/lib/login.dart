import 'package:app/customWidgets.dart';
import 'package:app/db.dart';
import 'package:app/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  var email = TextEditingController();
  var password = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    email.clear();
    password.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _form(),
    );
  }

  Widget _form(){
     return Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       mainAxisSize: MainAxisSize.min,
       children: [
         const SizedBox(height: 100,),

         myTextField(controllerTxt:email , hintTxt: 'enter email'),
         myTextField(controllerTxt:password , hintTxt: 'enter password'),
         _myButton(txt: 'Login'),
         TextButton(onPressed: ()=> Get.to(()=>const SignUp()), child: const Text("Don't have an account? Signup")),
       ],
     );
  }

  Widget _myButton( {required String txt}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: ElevatedButton(
        onPressed: ()=>_submit(),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.blueAccent,
          minimumSize: const Size(330, 55),
          maximumSize: const Size(330, 55),
        ),
        child: Text(
          txt,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  void _submit(){
    Db().loginUser(email: email.text, password: password.text);
   email.clear();
   password.clear();
  }
}
