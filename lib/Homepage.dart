


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

const double mobileWidth = 700;
//const double breakPointWidth =1200;
bool isWeb = true;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int stack = 1;
  int _listlen = 10;
  List<String> _upperSelection = ['전체','뉴스','음악','게임','라이브','축구','자연','최근에 업로드된 동영상','라이브','축구','자연','최근에 업로드된 동영상',];
  late final ScrollController _controller;
  bool updated = true;

  @override
  void initState(){
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_handleControllerNotification);
  }

  void _handleControllerNotification() async{
    if(_controller.position.userScrollDirection ==
        ScrollDirection.reverse && _controller.position.atEdge) {
      await Future.delayed(Duration(seconds: 1));

      setState(() {
        _listlen += 10;
      });
      print(_listlen);
    }

  }

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    //isWeb = pageWidth > mobileWidth ? true : false;

    return Scaffold(

      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth: 300,
        backgroundColor: Colors.white,
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            IconButton(icon: Icon(Icons.menu), onPressed: (){print("drawer");},),
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
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  direction: Axis.horizontal,
                  spacing: 10,
                  children: List.generate(_upperSelection.length, (index) => appBarBottomElevatedButton(_upperSelection[index])),
                ),
              ),
            ),
          ),
          Expanded(
            child:
              Builder(
                builder: (context){
                  if(pageWidth < 600 ){
                    return videoGrid(grid: 1,length:  _listlen,wrapVideo:  WrapVideo("현재는 $pageWidth '송영관-오승희 사육사'의 푸바오를 쏙~ 빼닮은 쌍둥바오 육아일기🐼 #highlight#유퀴즈온더블럭 | YOU QUIZ ON THE BLOCK EP.240", "유 퀴즈 온 더 튜브",  "조회수 2만회 2시간 전"),controller: _controller);
                  }
                  else if (pageWidth >=600 && pageWidth <1300){
                    return videoGrid(grid: 2,length:  _listlen,wrapVideo:  WrapVideo("현재는 $pageWidth '송영관-오승희 사육사'의 푸바오를 쏙~ 빼닮은 쌍둥바오 육아일기🐼 #highlight#유퀴즈온더블럭 | YOU QUIZ ON THE BLOCK EP.240", "유 퀴즈 온 더 튜브",  "조회수 2만회 2시간 전"),controller: _controller);
                  }
                  else if (pageWidth >=1100 && pageWidth <1500){
                    return videoGrid(grid: 3,length:  _listlen,wrapVideo:  WrapVideo("현재는 $pageWidth '송영관-오승희 사육사'의 푸바오를 쏙~ 빼닮은 쌍둥바오 육아일기🐼 #highlight#유퀴즈온더블럭 | YOU QUIZ ON THE BLOCK EP.240", "유 퀴즈 온 더 튜브",  "조회수 2만회 2시간 전"),controller: _controller);

                  }
                  else if (pageWidth >=1500 && pageWidth <2400){
                    return videoGrid(grid: 4,length:  _listlen,wrapVideo:  WrapVideo("현재는 $pageWidth '송영관-오승희 사육사'의 푸바오를 쏙~ 빼닮은 쌍둥바오 육아일기🐼 #highlight#유퀴즈온더블럭 | YOU QUIZ ON THE BLOCK EP.240", "유 퀴즈 온 더 튜브",  "조회수 2만회 2시간 전"),controller: _controller);

                  }
                  else if (pageWidth >=2400 && pageWidth <2800){
                    return videoGrid(grid: 5,length:  _listlen,wrapVideo:  WrapVideo("현재는 $pageWidth '송영관-오승희 사육사'의 푸바오를 쏙~ 빼닮은 쌍둥바오 육아일기🐼 #highlight#유퀴즈온더블럭 | YOU QUIZ ON THE BLOCK EP.240", "유 퀴즈 온 더 튜브",  "조회수 2만회 2시간 전"),controller: _controller);

                  }
                  else {
                    return videoGrid(grid: 6,length:  _listlen,wrapVideo:  WrapVideo("현재는 $pageWidth '송영관-오승희 사육사'의 푸바오를 쏙~ 빼닮은 쌍둥바오 육아일기🐼 #highlight#유퀴즈온더블럭 | YOU QUIZ ON THE BLOCK EP.240", "유 퀴즈 온 더 튜브",  "조회수 2만회 2시간 전"),controller: _controller);

                  }
                },
              )
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

class videoGrid extends StatelessWidget {
  const videoGrid({Key? key, required this.grid, required this.length, required this.wrapVideo, required this.controller}) : super(key: key);
  final int grid;
  final int length;
  final Container wrapVideo;
  final ScrollController controller;
  @override
  Widget build(BuildContext context){
    return GridView(
        controller: controller,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: grid),
        children:
        List.generate(length, (i) => wrapVideo)
    );
  }
}
