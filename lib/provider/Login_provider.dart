import 'package:flutter/cupertino.dart';

import '../Services/Login_Servcies.dart';
import '../models/Reg_Model.dart';

class Login_Provider extends ChangeNotifier
{
  Re_Model?registrationModel;
  Future<bool>login(email ,password)async
  {
    try
        {
          await Login_Servcies.addDatq(email, password);
          notifyListeners();
          return true;

        }
        catch(e)
    {
     print(e);
    }
    return false;
  }

}