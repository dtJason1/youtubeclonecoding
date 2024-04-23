
import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';


class videoScreen extends StatelessWidget{
  const videoScreen({Key? key,required this.title, required this.view, required this.videoID }) : super(key: key);
  final String title;
  final String view;
  final String videoID;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 300,
        backgroundColor: Colors.white,
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            IconButton(icon: Icon(Icons.menu), onPressed: (){print("drawer");},),
            //Image.asset('assets/images/YouTube-Logo.wine.png',width: 100,),

          ],
        ),
        actions: [
          Row(
            children: [
              IconButton(onPressed: (){print("Search");}, icon:Icon(Icons.search)),
              IconButton(onPressed: (){print("Search");}, icon:Icon(Icons.mic)),
              IconButton(onPressed: (){print("Search");}, icon:Icon(Icons.more_vert)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: OutlinedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.0,horizontal:8.0),
                minimumSize: Size.zero, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                child: Row(children: [
                  Icon(Icons.person, color: Colors.blue,),
                  Text("로그인", style: TextStyle(color: Colors.blue),),
                ],
                )),
          ),

        ],),
      body: Column(

        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            child: Container(
              child: AspectRatio(aspectRatio: 16/9,child: Image.network("http://10.0.1.85:8000/thumbnail/${videoID}",fit: BoxFit.cover,),),

            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(title),
          ),
          Flexible(
            child:  Text(view, style: TextStyle(fontSize: 12),),

          ), //Text
        ],
      )

    );


  }

}