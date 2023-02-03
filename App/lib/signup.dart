import 'package:app/customWidgets.dart';
import 'package:app/db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    name.clear();
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
        myTextField(controllerTxt:name , hintTxt: 'enter name'),
        myTextField(controllerTxt:email , hintTxt: 'enter email'),
        myTextField(controllerTxt:password , hintTxt: 'enter password'),
        _myButton(txt: 'SignUp'),
        TextButton(onPressed: ()=>Get.to(()=>const Login()), child: const Text("Have  an account? Login")),
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
    Db().signUp(name: name.text,email: email.text, password: password.text);
    name.clear();
    email.clear();
    password.clear();
  }
}
