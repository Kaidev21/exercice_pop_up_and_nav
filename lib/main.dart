import 'package:exercice_pop_up_and_nav/questionnaire.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Quizz Flutter'),
      routes: <String, WidgetBuilder> {
        '/questionnaire': (BuildContext context) => Questionaire()
      },
      debugShowCheckedModeBanner: false,
    );

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Card(
          elevation: 10.2,
          color: Colors.red.shade200,
          child: Container(
            width: MediaQuery.of(context).size.width/1.2,
            height: MediaQuery.of(context).size.height/2.5,
            margin: EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "images/cover.jpg",
                  fit: BoxFit.fill,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    shadowColor: MaterialStateProperty.all<Color>(Colors.black),
                    elevation: MaterialStateProperty.all<double>(10),
                  ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext ctx) {
                          return Questionaire();
                        })
                      );
                    },
                    child: Text("Commencer le quizz")
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
