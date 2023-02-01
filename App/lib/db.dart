import 'package:app/login.dart';
import 'package:app/user.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class Db{
  final _dio = Dio();
  final _ip = '192.168.100.198';

  Db(){
      _dio.options.baseUrl = 'http://$_ip:3000/';
 }

 Future getUsers() async {
    try{
      var response = await _dio.get('getUsers/');
      print('${response.data as List}');
    }catch(ex){
      throw ex.toString();
    }
 }

Future loginUser({required String email,required String password}) async {
    try{

      var response = await _dio.get('login/$email/$password');
      User.id = response.data['id'];
      User.email = response.data['email'];
      User.password = response.data['password'];

    }catch(ex){
      throw ex.toString();
    }
}

 Future signUp({required String name,required String email ,required String password}) async{
    try{
       await _dio.post('createUser/',data: {
        'name':name,
        'email':email,
        'password':password
      });

       Get.offAll(()=>const Login());
    }catch(ex){
      throw ex.toString();
    }
 }

}