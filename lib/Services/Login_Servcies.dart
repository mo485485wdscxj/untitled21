import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/Reg_Model.dart';

class Login_Servcies
{
  static Dio dio = Dio();
  static addDatq(String email,int password) async
  {
    Response response = await dio.post("https://todo-app-backend-dusky.vercel.app/api/auth/login",
      data: {
      "email":email,
      "password":password,
      }
    );
    if(response.statusCode! >=200&& response.statusCode! <=300)
      {
        print(response.data);
        return Re_Model.fromjson(response.data);
      }
    else
      {
        throw Exception("Server Error");
      }
  }

}