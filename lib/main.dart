import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'http.dart'; // make dio as global top-level variable
import 'routes/request.dart';


void main() async{
  dio.interceptors.add(LogInterceptor(request: true,requestBody: true,requestHeader: true,responseBody: true,responseHeader: true));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title = ''}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _text = "";

  @override
  Widget build(BuildContext context) {

    Firebase.initializeApp().then((value) {
      print('Firebase connected');
    }).catchError((error) {
      print('Firebase connection error: $error');
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          ElevatedButton(
            child: Text("Request"),
            onPressed: () async {
              Navigator.push(context,MaterialPageRoute(builder: (context) =>HomeBase()));
             /* try {
                final response = await dio.post('/api/v0/sessions/',
                data: {
                  "user": {
                    "email": "ayushagrawal@yopmail.com",
                    "code": "Allective0077!",
                    "community_id": 462
                  }
                });
                print(response.data);
                  print("first Name:"+LogIn.fromJson(response.data).firstName) ;
                Navigator.push(context,MaterialPageRoute(builder: (context) =>HomeBase()));

              } on DioError catch (e) {
                if (e.response != null) {
                  // The server gave an error response
                  print('Server error ${e.response!.data['error']}: ${e.response!.statusMessage}');
                } else {
                  // Something went wrong in making the request
                  print('Request error: $e');
                }
              } catch (e) {
                // Something else went wrong
                print('Unknown error: $e');
              }
*/            },
          ),
          ElevatedButton(
            child: Text("Open new page5"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RequestRoute();
              }));
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(_text),
            ),
          )
        ]),
      ),
    );
  }
}




