import 'package:flutter/cupertino.dart';
import '../Services/Sign_Servs.dart';
import '../models/Reg_Model.dart';

class Sign_up_Provider with ChangeNotifier
{
  Re_Model?registrationModel;
  Future<bool>signup(name,email,password)async
  {
    try {
      await Signup_Ser.adddata(name, email, password);
      notifyListeners();
      return true;
    }
    catch(E)
    {
      print(E);
    }
   return false;
  }
}