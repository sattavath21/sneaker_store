import 'package:flutter/material.dart';
void main(){
  runApp(new MaterialApp(
    home: new myApp(),
  ));
}
class myApp extends StatefulWidget{
  @override
  _State createState()=>new _State();
}
class _State extends State<myApp>{

double valur=0.0;
void onChanged(double value){
setState(() {
  valur=value;
});
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello"),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
           Slider(value: valur, onChanged: onChanged),
            Container
              (
              padding: EdgeInsets.all(32.0),
              child: LinearProgressIndicator(
                value: valur,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),

              ),
            ),
            Container(
              padding: EdgeInsets.all(32.0),
              child: CircularProgressIndicator(
                value: valur,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}