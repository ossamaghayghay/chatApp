import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'message.dart';
import 'new_message.dart';



class ChatScreen extends StatelessWidget {
   ChatScreen({Key? key}) : super(key: key);
  

  static const String _imageUrl2 = 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg';
    
  bool isDark=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: const Text('CHAT MOVIC'),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){

          },
          icon: Icon(Get.isDarkMode?Icons.sunny:Icons.dark_mode)
        ),
        actions: [
          DropdownButton(
            elevation: 4,
            alignment: AlignmentDirectional.centerEnd,
            borderRadius: BorderRadius.circular(16),
          icon: const Icon(Icons.more_vert_sharp,color: Color.fromARGB(255, 253, 252, 252),),
          items: [
            DropdownMenuItem(
              value: 'Logout',
              child: Row(
                children: const [
                Text('Logout'),
                SizedBox(width: 20),
                Icon(Icons.logout,color: Colors.purple,),
                ],
            )
            ),
            DropdownMenuItem(
              value: 'Go Back',
              child: Row(
                children: const [
                Text('Back'),
                SizedBox(width: 20),
                Icon(Icons.backspace_outlined,color: Colors.purple,),
                
                ],
                
            ),
              onTap:(){
                  
              }
            )
          ], 
          onChanged: (itemIdentifier){
              itemIdentifier == 'Logout'?FirebaseAuth.instance.signOut():null;
          }
          ),
        ],
      ),
      body:
      Container(
        child: Column(
          children: [
            Expanded(
              child: Container(child: Message(),decoration: const BoxDecoration(image: DecorationImage(image: NetworkImage(_imageUrl2),scale: 0.1,filterQuality: FilterQuality.high ,fit: BoxFit.fill)),)
              ),
            Container(child: NewMessage(),decoration: const BoxDecoration(image: DecorationImage(image: NetworkImage(_imageUrl2),scale: 0.1,filterQuality: FilterQuality.high ,fit: BoxFit.fill))),
          ],
        ),
        ),
           
      // StreamBuilder(
      //         builder: (ctx, AsyncSnapshot snapShot){
      //           if(!snapShot.hasData)
      //           {
      //             return const Center(child:  CircularProgressIndicator(color: Colors.purple));
      //           }
      //           var docs=snapShot.data.docs;
      //           return ListView.builder(itemBuilder: (
      //             (context, index) {
      //               return SizedBox(child: Text(docs[index]['text']!),);
      //               }
      //           ));
      //         }
      //       ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: showData,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), 
    );
  }
}
