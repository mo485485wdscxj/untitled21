import 'package:dio/dio.dart';
import 'package:untitled21/models/Reg_Model.dart';

class Signup_Ser
{
  static Dio dio = Dio();
  static adddata(String name , String email , String password)async
  {
    Response response = await dio.post('https://todo-app-backend-dusky.vercel.app/api/auth/register',
    data: {
      "username":name,
      "email":email,
      "password":password,
    }
    );
    if(response.statusCode!>=200&&response.data!<=300)
      {
        print(response.data);
        return Re_Model.fromjson(response.data);
      }
    else
      {
        throw Exception('Server Error');
      }
  }


}