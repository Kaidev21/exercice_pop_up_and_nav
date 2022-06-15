import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Questionaire extends StatefulWidget {

  var score = 0;

  Questionaire({Key? key}) : super(key: key);

  @override
  State<Questionaire> createState() => _QuestionaireState();
}

class _QuestionaireState extends State<Questionaire> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Score: ${widget.score}"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Column(

        ),
      ),
    );
  }
}
