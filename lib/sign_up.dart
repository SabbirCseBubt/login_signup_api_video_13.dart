import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  void signup(String email, String password) async{
    try
    {
      Response response =await post(Uri.parse('https://reqres.in/api/register'),
        body: {
        'email':email,
         'password' :password

        }
        ) ;
      if(response.statusCode==200)
      {
        print("Account Created Sucessflully");

      }
      else
      {
        print("Failed");
      }




    }
    catch(e)
    {
      print(e.toString());

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up"),),
   body:  Padding(
     padding: const EdgeInsets.all(20.0),
     child: Column(
       children: [
         TextFormField(
           controller: emailController,
           decoration: InputDecoration(
             hintText: "Enter Your Email",
           ),
         ),
         SizedBox(height: 20,),
         TextFormField(
           controller: passwordController,
           decoration: InputDecoration(
             hintText: "Enter Your Password",
           ),
         ),
         SizedBox(height: 20,),
         ElevatedButton(onPressed: (
            
             ){

           signup(emailController.text.toString(),passwordController.text.toString());
           
         }, child: Text("Sign Up"))

       ],
     ),
   ),
    );
  }
}

