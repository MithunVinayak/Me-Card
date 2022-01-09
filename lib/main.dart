import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/sergio.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              VideoPlayer(_controller),
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('images/sr4.jfif'),
                    ),
                    Text(
                      'Sergio Ramos',
                      style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 35.0,
                        color: Color.fromRGBO(255, 215, 0, 0.7019607843137254),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'CENTRAL DEFENDER',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 155.0,
                      child: Divider(
                        thickness: 1.0,
                        color: Colors.black,
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      color: Colors.black,
                      child: ListTile(
                        leading: Icon(
                          Icons.height,
                          color:
                          Color.fromRGBO(255, 215, 0, 0.7019607843137254),
                        ),
                        title: Text(
                          'HEIGHT: 6ft.1"',
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 20.0,
                            color:
                            Color.fromRGBO(255, 215, 0, 0.7019607843137254),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      color: Colors.black,
                      child: ListTile(
                        leading: Icon(
                          Icons.language_outlined,
                          color:
                          Color.fromRGBO(255, 215, 0, 0.7019607843137254),
                        ),
                        title: Text(
                          'NATIONALITY: Spain ',
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 20.0,
                            color:
                            Color.fromRGBO(255, 215, 0, 0.7019607843137254),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),);
  }
}
