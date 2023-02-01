import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

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
    );
  }

  Widget _form(){
     return Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       mainAxisSize: MainAxisSize.min,
       children: [
          TextField(controller: name,),
       ],
     );
  }
}
