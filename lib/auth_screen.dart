
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth_form.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoading=false;
  var auth=FirebaseAuth.instance;

  void _submitAuthenticationForm(String username,String email,String password,bool isLogin)async{
   UserCredential _authResult;
  try{
    setState(() {
      _isLoading=true;
    });
    if(isLogin)
    {
        _authResult=await auth.signInWithEmailAndPassword(
        email: email, password: password
      );
    }
    else{
     _authResult=await auth.createUserWithEmailAndPassword(
      email: email, password:password,
     );
      await FirebaseFirestore.instance.collection('users').doc(
        _authResult.user!.uid).set(
          {
            'email':email,
            'username':username,
            'password':password
          }
        );
     
    }

   } on FirebaseAuthException catch(error){
     String message='Warning';
     if(error.code=='weak-password')
     {



       
         message='The password is Too Weak';
     }
   else if(error.code=='invalid-email')
   {
          message='the Email That you enter Not Valid ';
   }
     else if(error.code=='email-already-in-use')
     {
        message='The acount is Aleardy Exist With Email ';
     }
     else if(error.code=='Wrong Password')
     {
        'password that you Entered Wrong';
     }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        dismissDirection: DismissDirection.startToEnd,
        backgroundColor: const Color.fromARGB(255, 53, 10, 128),
        ),
      );
     setState(() {
       _isLoading=false;
     });
  }catch(error){
   setState(() {
     _isLoading=false;
   });
   rethrow;
  }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: AuthFrom(submitFunc:_submitAuthenticationForm,isLoading:_isLoading),
    );
  }
}