



import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: (){print("drawer");},),
        actions: [
          //Image()
          IconButton(onPressed: (){print("Search");}, icon:Icon(Icons.search)),
          IconButton(onPressed: (){print("Search");}, icon:Icon(Icons.mic)),
          IconButton(onPressed: (){print("Search");}, icon:Icon(Icons.more_vert))
        ],
        bottom: PreferredSize(
          child: Row(
            children: [
              appBarBottomElevatedButton('전체'),
              appBarBottomElevatedButton('뉴스'),
              appBarBottomElevatedButton('음악'),
              appBarBottomElevatedButton('라이브'),
              appBarBottomElevatedButton('게임'),
            ],
          ),
          preferredSize: Size(300,10),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}


Padding appBarBottomElevatedButton(String text){
  return Padding(
    padding: EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),

    child: FittedBox(

      child: ElevatedButton(onPressed: (){}, child: Text(text,style: TextStyle(fontSize: 10,color: Colors.black),
      ),
       style: ElevatedButton.styleFrom(
           backgroundColor: Colors.grey, minimumSize: Size.zero, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
      ),//style: ElevatedButton.styleFrom),
    ),
  );


}