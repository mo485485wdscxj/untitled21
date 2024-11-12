import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled21/Screens/Login_Screen.dart';

import '../provider/Login_provider.dart';
import '../provider/SignUp_Provider.dart';
class SignUp_Screen extends StatelessWidget {
  const SignUp_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email =TextEditingController();
    TextEditingController password =TextEditingController();
    TextEditingController name =TextEditingController();

    final fromkey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Consumer<Sign_up_Provider>(builder: (context, value, child)
      {
        return Container(
          child: Padding(
            padding:const EdgeInsets.all(10),
            child:Form
              (
              key: fromkey,
            child: Column(
              children: [

                TextFormField(
                  decoration: InputDecoration(
                      hintText: "UseName",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  controller: name,
                  validator: (value)
                  {
                    if(value==null||value.length<2)
                      {
                        return ' no no no';
                      }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  controller: password,
                  validator: (value)
                  {
                    if(value==null||value.length<10)
                      {
                        return 'please Put Greter than number';
                      }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "email",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),
                  controller: email,
                ),
                SizedBox(height: 20),

                OutlinedButton(onPressed: ()async {
                  if (fromkey.currentState!.validate()) {
                    bool signup = await Provider.of<Login_Provider>(
                        context, listen: false).login(email, password);
                    if (signup) {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => LogingScreen()));
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error")));
                  }
                },
                    child: Text('Sign Up')),
                SizedBox(height: 20),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LogingScreen()));
                }, child: Text('Login'))
              ],
            ),
          ),)
        );

      },),
    );
  }
}
