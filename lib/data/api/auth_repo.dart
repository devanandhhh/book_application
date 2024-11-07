import 'dart:convert';
import 'dart:developer';

import 'package:books_app/core/endpoints.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';
class AuthRepoService{
  Future<Response?> userRegister(String username,String password)async{
    final url=Uri.parse("${Endpoints.baseUrl}${Endpoints.register}");
    final header ={
      'accept':"*/*",
      'Content-Type': 'application/json' ,
    };
    final body ={
      'username':username,
      'password':password,
    };

    try{
        final response =await http.post(url,headers: header,body: jsonEncode(body));
        log(response.body);
        return response;
    }catch(e){
      log('Error catch in authservice $e');
      return null;
    }
  }
}