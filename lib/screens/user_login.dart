import 'package:flutter/material.dart';
import 'package:mechine_text/Authentication/user_provider.dart';
import 'package:mechine_text/screens/User_register.dart';
import 'package:provider/provider.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
   TextEditingController _emailIDcontroller =TextEditingController();
  TextEditingController _paswordcontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, state, child) => 
       Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title:
         Center(
           child: Text("Sign In",style: 
           TextStyle(color: Colors.white,
           fontSize: 40,
           fontWeight: FontWeight.w500),),
         ),),
         body: Padding(
           padding: const EdgeInsets.all(20),
           child: SingleChildScrollView(
             child: Column(
              children: [
                SizedBox(height: 100,),
                
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2),
                    ),
                  ),
                  controller: _emailIDcontroller,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2),
                    ),
                  ),
                  controller: _paswordcontroller,
                  keyboardType: TextInputType.name,
                ),
                  SizedBox(height: 10,),
                
                 
                 SizedBox(height: 100,),
             
                InkWell(
                  onTap: () {
                    state.emailSignin(_emailIDcontroller.text, _paswordcontroller.text);
                    _emailIDcontroller.clear();
                    _paswordcontroller.clear();
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                    color: Colors.orange,
                    ),
                    child:Center(child: Text('Sign In',style: TextStyle(color: Colors.white,fontSize: 30),)) ,
                  ),
                ),
                SizedBox(height: 15,),
      
                Center(child: Text('or',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w500),)),
                     
                     SizedBox(height: 15,),
                Center(
                  child: Row(mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w500),),
                      InkWell( 
                         onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => UserRegister(),));
                         },
                         child: Text('"Register"',style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.w700),)),
                    ],
                  ),
                )
              ]
              )
              )
              )
      ),
    );
  }
}