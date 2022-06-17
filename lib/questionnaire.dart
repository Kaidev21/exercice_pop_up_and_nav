import 'package:exercice_pop_up_and_nav/datas.dart';
import 'package:exercice_pop_up_and_nav/question.dart';
import 'package:flutter/material.dart';

class Questionaire extends StatefulWidget {

  var score = 0;
  var numQuestion = 1;

  Datas datas = Datas();
  Questionaire({Key? key}) : super(key: key);

  @override
  State<Questionaire> createState() => _QuestionaireState();
}

class _QuestionaireState extends State<Questionaire> {
  bool choix = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Score: ${widget.score}"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 1),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Question numéro ${widget.numQuestion}/10",
                  style: const TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 1.5,
                  getQuestion(widget.numQuestion - 1).question,
                ),
                 Image.asset(getQuestion(widget.numQuestion - 1).getImage(), fit: BoxFit.cover,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        elevation: 10
                      ),
                        onPressed: () {
                        setState((){
                          choix = false;
                          verificationReponse(choixX: choix);
                        });
                        },
                        child: Text("FAUX")
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            elevation: 10
                        ),
                        onPressed: () {
                          setState((){
                            choix = true;
                            verificationReponse(choixX: choix);
                          });
                        },
                        child: Text("VRAI")
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Question getQuestion(int x) {
    Question question = widget.datas.listeQuestions.elementAt(x) ;
    return question;
  }

  SimpleDialog reponseVraie() {
    widget.score +=1;
      return SimpleDialog(
        title: Text("C'est gagné !"),
        elevation: 15,
        children: [
          Image.asset("images/vrai.jpg"),
          Divider(),
          SimpleDialogOption(
            onPressed: () {
              Navigator.of(context).pop();
              setState((){
                widget.numQuestion +=1;
              });
            },
            child: Text("Passer à la question suivante"),
          )
        ],
      );
  }

  SimpleDialog finPartie() {
    return SimpleDialog(
      title: Text("Fin de la partie !"),
      elevation: 15,
      children: [
        Text("Votre score est de ${widget.score}"),
        Divider(),
        SimpleDialogOption(
          onPressed: () {
            Navigator.of(context).pop();
            },
          child: Text("Retour"),
        )
      ],
    );
  }

  AlertDialog reponseFausse() {
    return AlertDialog(
      title: Text("Raté !"),
      content: Column(
        children: [
          Image.asset(
              "images/faux.jpg"),
          Text(getQuestion(widget.numQuestion - 1).explication)
        ],
      ),
      actions: [
        TextButton(
            onPressed: (){
              Navigator.of(context).pop();
              setState((){
                widget.numQuestion +=1;
              });
            },
            child: Text("Passer à la question suivante")
        )
      ],
    );
  }

  Future<void> showMyDialog({required Widget dialog}) async {
    await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return dialog;
        }
    );
  }

  void verificationReponse({required bool choixX}) {
    if(choixX == getQuestion(widget.numQuestion - 1).reponse) {
      showMyDialog(dialog: reponseVraie());
    } else {
      showMyDialog(dialog: reponseFausse());
    }
  }

}
