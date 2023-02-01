import 'package:dio/dio.dart';

class Db{
  final _dio = Dio();
  final _ip = '192.168.100.198';

  Db(){
      _dio.options.baseUrl = 'http://$_ip:8080/';
 }

 Future getUsers() async {
    try{
      var response = await _dio.get('/');
      print('${response as List}');
    }catch(ex){
      throw ex.toString();
    }
 }

}