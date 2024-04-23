
import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'videoScreen.dart';
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
  List<Map<String,dynamic>> _wholeVideoList= [];
  int _showingVideosamount = 9;
  List<String> _upperSelection = ['전체','뉴스','음악','게임','라이브','축구','자연','최근에 업로드된 동영상','라이브','축구','자연','최근에 업로드된 동영상',];
  late final ScrollController _controller;
  bool overSeventyScrolled = false;
  var currentlist;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_handleControllerNotification);
  }

  void _handleControllerNotification() async{
    if(_controller.position.pixels >= (_controller.position.maxScrollExtent)) {
      overSeventyScrolled = true;
    }
    if(overSeventyScrolled){
      setState(() {
        addlist();
        _showingVideosamount += 3;
      });
      overSeventyScrolled = false;
    }
  }



  Future<List<Map<String,dynamic>>> geturi() async{
    List<Map<String, dynamic>> mapList = await [];
    var url = Uri.http('10.0.1.85:8000');
    var response = await http.get(url);
    var getresponsetojson = jsonDecode(response.body);
    print(getresponsetojson);
    getresponsetojson['videos'].forEach((element) {
      mapList.add(element);
    });
    //if (!endOfVideo&& _showingVideosamount<mapList.length) {endOfVideo = true;}
    for(int i = 0; i < mapList.length; i++){
      mapList[i]['vid_id'] = mapList[i]['vid_id'].toString();
      mapList[i]['views'] = mapList[i]['views'].toString();
    }
    print(mapList);
    return mapList;
  }

  Future<List<Map<String,dynamic>>> addlist() async{

    _wholeVideoList += await geturi();
    print(_wholeVideoList);
    return _wholeVideoList;
  }

  @override
  Widget build(BuildContext context) {
    AppBarSelection appBarSelection = AppBarSelection();
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
            child: Align(
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  direction: Axis.horizontal,
                  spacing: 10,
                  children: List.generate(_upperSelection.length, (index) => appBarBottomElevatedButton(text: _upperSelection[index], appBarSelection: appBarSelection)),
                ),
              ),
            ),
          ),
          Expanded(
            child:
              Builder(
                builder: (context){
                  if(pageWidth < 600 ){
                    return FutureBuilder(
                      future: addlist(),
                      builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                        if(snapshot.hasData) return videoGrid(grid: 1, length: _showingVideosamount, list: snapshot.data!, controller: _controller);
                        else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }

                        else{
                          return Text("기다려 주세요");
                        }
                      }
                    );
                  }

                  else if (pageWidth >=600 && pageWidth <1300){
                    return FutureBuilder(
                        future: addlist(),
                        builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                          if(snapshot.hasData) return videoGrid(grid: 2, length: _showingVideosamount, list: snapshot.data!, controller: _controller);
                          else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }

                          else{
                            return Text("fsd");
                          }
                        }
                    );
                  }
                  else if (pageWidth >=1100 && pageWidth <1500){
                    return FutureBuilder(
                        future: addlist(),
                        builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                          if(snapshot.hasData) return videoGrid(grid:3, length: _showingVideosamount, list: snapshot.data!, controller: _controller);
                          else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }

                          else{
                            return Text("fsd");
                          }
                        }
                    );

                  }
                  else if (pageWidth >=1500 && pageWidth <2400){
                    return FutureBuilder(
                        future: addlist(),
                        builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                          if(snapshot.hasData) return videoGrid(grid: 4, length: _showingVideosamount, list: snapshot.data!, controller: _controller);
                          else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }

                          else{
                            return Text("fsd");
                          }
                        }
                    );

                  }
                  else if (pageWidth >=2400 && pageWidth <2800){
                    return FutureBuilder(
                        future: addlist(),
                        builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                          if(snapshot.hasData) return videoGrid(grid: 5, length: _showingVideosamount, list: snapshot.data!, controller: _controller);
                          else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }

                          else{
                            return Text("fsd");
                          }
                        }
                    );

                  }
                  else {
                    return FutureBuilder(
                        future: addlist(),
                        builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                          if(snapshot.hasData) return videoGrid(grid: 6, length: _showingVideosamount, list: snapshot.data!, controller: _controller);
                          else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }

                          else{
                            return Text("fsd");
                          }
                        }
                    );

                  }
                },
              )
          ),

        ],
      ),

    );
  }
}


class appBarBottomElevatedButton extends StatefulWidget{
  const appBarBottomElevatedButton({Key? key, required this.text, required this.appBarSelection}) : super(key: key);
  final String text;
  final AppBarSelection appBarSelection;

  @override
  State<appBarBottomElevatedButton> createState() => _appBarBottomElevatedButtonState();
}

class _appBarBottomElevatedButtonState extends State<appBarBottomElevatedButton> {
  @override
  Widget build(BuildContext context){
    return TextButton(onPressed: (){
      SetState(){

        widget.appBarSelection.currentapp = int.parse(widget.text);
        print("");
      }

    }, child: Text(widget.text,style: TextStyle(fontSize: 15,color: Colors.black),
    ),

      style: ElevatedButton.styleFrom( padding: EdgeInsets.symmetric(vertical: 12.0,horizontal:8.0),
          backgroundColor: Colors.grey, minimumSize: Size.zero, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
    );

  }
}

TextButton appBarBottomElevatedButton3(String text, AppBarSelection appBarSelection){
  return TextButton(onPressed: (){
    SetState(){
      appBarSelection.currentapp = int.parse(text);
    }

  }, child: Text(text,style: TextStyle(fontSize: 15,color: Colors.black),
  ),

   style: ElevatedButton.styleFrom( padding: EdgeInsets.symmetric(vertical: 12.0,horizontal:8.0),
       backgroundColor: Colors.grey, minimumSize: Size.zero, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
  );


}

class WrapVideo extends StatelessWidget {
  const WrapVideo({Key? key, required this.i, required this.list}) : super(key: key);
  final int i;
  final List<Map<String,dynamic>> list;
  @override
  Widget build(BuildContext context){
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => videoScreen(title: list[i]['title'], view: list[i]['views'], videoID: list[i]['vid_id'])));
      
    },
    child: Container(

      child: Column(
        children: [
          Container(child: FutureBuilder(
            future: getImageWidget("http://10.0.1.85:8000/thumbnail/${list[i]['vid_id']}"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData) return snapshot.data;
              else {
                return Container(color: Colors.grey,);
              }
            }
          ),clipBehavior: Clip.hardEdge,decoration: BoxDecoration(color:Colors.black,borderRadius: BorderRadius.all(Radius.circular(10))),),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 15, 0),
            child: Row(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 3, 15, 0),
                  child: Container(width: 40, height: 40,decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.all(Radius.circular(20))),),
                ),//원
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(list[i]['title'], style: TextStyle(fontSize: 14), overflow: TextOverflow.ellipsis,maxLines: 2,softWrap: false,),
                      Text(list[i]['vid_id'], style: TextStyle(fontSize: 12),),
                      Text(list[i]['views'], style: TextStyle(fontSize: 12),),
                    ],
                  ),
                ), //Text
              ],
            ),
          ),
        ],
      ),
    ),
  );
  }
}

class videoGrid extends StatelessWidget {
  const videoGrid({Key? key, required this.grid, required this.length,required this.list, required this.controller, }) : super(key: key);
  final int grid;
  final int length;
  final List<Map<String,dynamic>> list;
  final ScrollController controller;
  @override
  Widget build(BuildContext context){
    return GridView.count(
      primary: false,
        shrinkWrap: true,
        childAspectRatio: 1.2,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        //crossAxisSpacing: 40.0,
        //mainAxisSpacing: 40.0,
        crossAxisCount: grid,
        scrollDirection: Axis.vertical,
        controller: controller,
        children:
        List.generate(length, (i) {
          return WrapVideo(i: i, list: list);
        })

    );
  }
}

Future<Widget> getImageWidget(String? pictureUrl) async {
  //await Future.delayed(Duration(seconds: 1));
  return Image.network(pictureUrl!,fit: BoxFit.cover,);
}

class AppBarSelection{
  int currentapp = 0;

  int getCurrentAppBar(){
    return currentapp;
  }



}

  
