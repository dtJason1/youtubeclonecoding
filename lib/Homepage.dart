


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _listlen = 10;
  List<String> _upperSelection = ['전체','뉴스','음악','게임','라이브','축구','자연','최근에 업로드된 동영상'];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth: 300,
        backgroundColor: Colors.white,
        leading: Row(
          children: [

            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: IconButton(icon: Icon(Icons.menu), onPressed: (){print("drawer");},),
            ),
            Image.asset('assets/images/YouTube-Logo.wine.png',width: 100,),

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
            child: Align(
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 10,
                  children: List.generate(_upperSelection.length, (index) => appBarBottomElevatedButton(_upperSelection[index])),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
                  
              child: Column(
                children: /*[
                  WrapVideo("'송영관-오승희 사육사'의 푸바오를 쏙~ 빼닮은 쌍둥바오 육아일기🐼 #highlight#유퀴즈온더블럭 | YOU QUIZ ON THE BLOCK EP.240", "유 퀴즈 온 더 튜브", "조회수 2만회 2시간 전")
                ],*/
                List.generate(_listlen, (i) =>WrapVideo("'송영관-오승희 사육사'의 푸바오를 쏙~ 빼닮은 쌍둥바오 육아일기🐼 #highlight#유퀴즈온더블럭 | YOU QUIZ ON THE BLOCK EP.240", "유 퀴즈 온 더 튜브",  "조회수 2만회 2시간 전"))
              ),
                  
            ),
          ),
        ],
      ),

    );
  }
}


TextButton appBarBottomElevatedButton(String text){
  return TextButton(onPressed: (){}, child: Text(text,style: TextStyle(fontSize: 15,color: Colors.black),
  ),
   style: ElevatedButton.styleFrom( padding: EdgeInsets.symmetric(vertical: 12.0,horizontal:8.0),
       backgroundColor: Colors.grey, minimumSize: Size.zero, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
  );


}


Container WrapVideo(String title, String writer,String views) {
  return Container(

    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    child: Column(
      children: [
        AspectRatio(aspectRatio: 16/9 ,child: Container(decoration: BoxDecoration(color:Colors.black,borderRadius: BorderRadius.all(Radius.circular(10))),)),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 15, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 3, 15, 0),
                child: Container(width: 40, height: 40,decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.all(Radius.circular(20))),),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontSize: 16), overflow: TextOverflow.ellipsis,maxLines: 2,softWrap: false,),
                    Text(writer, style: TextStyle(fontSize: 14),),
                    Text(views, style: TextStyle(fontSize: 14),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    //child: Image(),
  );
}