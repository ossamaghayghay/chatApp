// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class BubbleMessage extends StatelessWidget {
   BubbleMessage({required this.key,required this.message,required this.isMe,required this.username});
   
   final Key key;
   final bool isMe;
   final String username;
   final String message; 
  //  final String createdAt; 


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isMe?Colors.green[300]:Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
            bottomLeft: isMe?const Radius.circular(0):const Radius.circular(15),
            bottomRight: isMe?const Radius.circular(15):const Radius.circular(0),
          ),
          
      ), 
      width: 140,
      margin: const EdgeInsets.symmetric(vertical:4 ,horizontal:9 ),
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
     child: Column(
       mainAxisAlignment: isMe ? MainAxisAlignment.end:MainAxisAlignment.start,
       children: [
         Text(username,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Text(message,style: const TextStyle(color: Colors.black,fontSize: 14),),
             Text("${DateTime.now()}",style:TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 8,fontWeight: FontWeight.bold),)
           ],
         )
       ]
     ),

    );
  }
}