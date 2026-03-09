
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mechine_text/Authentication/user_model.dart';


class UserProvider extends ChangeNotifier {
final  firebase =  FirebaseFirestore.instance.collection("User_inform");
Future <void> emailSignUP(UserModel user_model) async {
  
  try{
  await FirebaseAuth.instance.
  createUserWithEmailAndPassword(email: user_model.email,password: user_model.password);
  final id = firebase.doc().id;
      final noteRef = firebase.doc(id);
      user_model.userID=id;
      await noteRef.set(user_model.toMap());
  log("SignUP successfully");
  
  }catch (e){
    log('Error while $e');
    
  }
}
Future<void>emailSignin(String email,String password) async {
  try{
    await FirebaseAuth.instance.
    signInWithEmailAndPassword(email:email, password:password);
    log("Login succussfully ");
  }catch (e){
    log("Error While $e");
  }
}

Future<void>logout() async {
  
    await FirebaseAuth.instance.signOut();
    log("Logout succuss fully");
}
}