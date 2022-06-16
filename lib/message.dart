import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'bubble_message.dart';

class Message extends StatelessWidget {
   Message({Key? key}) : super(key: key);

    TextEditingController controller=TextEditingController();
    String message='';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("MOVIC_CHAT").orderBy("createdAt",descending: true).snapshots(),
      builder: (BuildContext ctx,AsyncSnapshot snapshot){
        if(snapshot.connectionState==ConnectionState.waiting)
        {
           return  Center(child:  CircularProgressIndicator(color:Colors.green[300]));
        }
      //   else if(snapshot.connectionState==ConnectionState.active)
       else{
            final docs=snapshot.data!.docs ;
            final user=FirebaseAuth.instance.currentUser!.uid;
            return ListView.builder(
              reverse: true,
              itemCount: docs.length,
              itemBuilder: (BuildContext ctx,index){
                 return BubbleMessage(
                   key:ValueKey('ossama'),
                   //:::::::::::::::get Message From firebase :::::::::::
                   message:docs[index]['NewMessage'],
                   //we check if the id isMe or the Other Person
                   isMe:docs[index]['userId']==user,
                   //::::::::::::::get  username From Firebase ::::::::::::::::::
                   username:docs[index]['username'],
                 );
              },
             
              );
        }
        
        // else{
        //   // ignore: null_check_always_fails
        //   return Container();
        // }

      } 
    );
  
  }
}