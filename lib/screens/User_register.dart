import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mechine_text/Authentication/user_model.dart';
import 'package:mechine_text/Authentication/user_provider.dart';
import 'package:mechine_text/screens/user_login.dart';
import 'package:provider/provider.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  TextEditingController _usernamecontroller =TextEditingController();
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
           child: Text("Register",style: 
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
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2),
                    
                    ),
                    
                  ),
                  controller: _usernamecontroller,
                  keyboardType: TextInputType.name,
                ),
                     SizedBox(height: 10,),
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
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2),
                    ),
                  ),
                  controller: _paswordcontroller,
                  keyboardType: TextInputType.name,
                ),
                 
                 SizedBox(height: 100,),
             
                InkWell(
                  onTap: () async {
                state.emailSignUP(UserModel(
                  email: _emailIDcontroller.text, 
                  password: _paswordcontroller.text, 
                  name: _usernamecontroller.text, 
                  createdAt: Timestamp.now()
                  )
                  
                  );
                  _emailIDcontroller.clear();
                  _paswordcontroller.clear();
                  _usernamecontroller.clear();

                    await Navigator.push(context, MaterialPageRoute(builder: (context) => UserLogin(),));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                    color: Colors.orange,
                    ),
                    child:Center(child: Text('Register',style: TextStyle(color: Colors.white,fontSize: 30),)) ,
                  ),
                ),
      
                SizedBox(height: 15,),
      
                Center(child: Text('or',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w500),)),
                     
                     SizedBox(height: 15,),
                Center(
                  child: Row(mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      Text('Already have an account ',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w500),),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => UserLogin(),));
                        },
                        child: Text('"Sign In"',style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.w700),)),
                    ],
                  ),
                )
              ],
             ),
           ),
         ),
      ),
    );
    
  }
}