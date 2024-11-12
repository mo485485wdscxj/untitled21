import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled21/Screens/HomePage.dart';

import '../provider/Login_provider.dart';
class LogingScreen extends StatelessWidget {
  const LogingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController password = TextEditingController();
    TextEditingController email = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Consumer<Login_Provider>(builder: (context, value, child) {
        return Container(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                ),
                controller: email,
              ),
              SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "pasword",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                ),
                controller: password,
              ),
              OutlinedButton(onPressed: ()async{
                bool signup = await Provider.of<Login_Provider>(context,listen: false).login(email.text, password.text);
                if(signup)
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                  }
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Error")));
              }, child: Text('Login'))
            ],
          ),
        );
      }),
    );
  }
}

