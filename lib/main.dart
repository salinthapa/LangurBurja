import 'dart:math';
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: LangurBurja(),
));
enum Dice { CLUB, KING, HEART, DIAMOND, FLAG, SPADE }
class LangurBurja extends StatefulWidget {
  const LangurBurja({Key? key}) : super(key: key);
  @override
  _LangurBurjaState createState() => _LangurBurjaState();
}
class _LangurBurjaState extends State<LangurBurja> {
  Dice? selectedDice;
  List<Dice> results = [];
  void generateResult() {
    results = [];
    for (int i = 0; i < 6; i++) {
      Random random = Random();
      int getValue = random.nextInt(6) + 1;
      Dice result = getDiceFromNum(getValue);
      results.add(result);
    }
  }
  Dice getDiceFromNum(int value) {
    switch (value) {
      case 1:
        return Dice.CLUB;
        break;
      case 2:
        return Dice.KING;
        break;
      case 3:
        return Dice.HEART;
        break;
      case 4:
        return Dice.DIAMOND;
        break;
      case 5:
        return Dice.FLAG;
        break;
      case 6:
        return Dice.SPADE;
        break;
      default:
        return Dice.CLUB;
        break;
    }
  }
  List<Widget> getResultInWidgets() {
    List<Widget> displayResults = [];
    for (int i = 0; i < results.length; i++) {
      displayResults.add(
        Expanded(
          child: Image(image: AssetImage(AssetFactory(results[i]))),
        ),
      );
    }
    return displayResults;
  }
  String AssetFactory(Dice dice) {
    switch (dice) {
      case Dice.CLUB:
        return "assets/clubs.PNG";
        break;
      case Dice.KING:
        return "assets/king.PNG";
        break;
      case Dice.HEART:
        return "assets/heart.PNG";
        break;
      case Dice.DIAMOND:
        return "assets/diamond.PNG";
        break;
      case Dice.FLAG:
        return "assets/flag.PNG";
        break;
      case Dice.SPADE:
        return "assets/spade.PNG";
        break;
      default:
        return "assets/clubs.PNG";
        break;
    }
  }
  String checkWin() {
    for (int i = 0; i < results.length; i++) {
      if (selectedDice == results[i]) {
        return "WIN!!";
      }
    }
    return "Lose!!";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text('Langur Burja')),
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: selectedDice == Dice.CLUB
                              ? Colors.amber
                              : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedDice = Dice.CLUB;
                          });
                        },
                        child: Image(
                          image: AssetImage('assets/clubs.PNG'),
                        ),
                      )),
                  Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: selectedDice == Dice.KING
                              ? Colors.amber
                              : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedDice = Dice.KING;
                          });
                        },
                        child: Image(
                          image: AssetImage('assets/king.PNG'),
                        ),
                      )),
                  Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: selectedDice == Dice.HEART
                              ? Colors.amber
                              : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedDice = Dice.HEART;
                          });
                        },
                        child: Image(
                          image: AssetImage('assets/heart.PNG'),
                        ),
                      )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: selectedDice == Dice.DIAMOND
                              ? Colors.amber
                              : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedDice = Dice.DIAMOND;
                          });
                        },
                        child: Image(
                          image: AssetImage('assets/diamond.PNG'),
                        ),
                      )),
                  Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: selectedDice == Dice.FLAG
                              ? Colors.amber
                              : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedDice = Dice.FLAG;
                          });
                        },
                        child: Image(
                          image: AssetImage('assets/flag.PNG'),
                        ),
                      )),
                  Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: selectedDice == Dice.SPADE
                              ? Colors.amber
                              : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedDice = Dice.SPADE;
                          });
                        },
                        child: Image(
                          image: AssetImage('assets/spade.PNG'),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
        Visibility(
          visible: selectedDice != null ? true : false,
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  generateResult();
                });
              },
              child: Text(
                'Roll Dice',
                style: TextStyle(fontSize: 20.0),
              )),
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: getResultInWidgets(),
        )
      ]),
      bottomSheet: Visibility(
        visible: results.length > 0 ? true : false,
        child: Container(
          height: 120.0,
          width: MediaQuery.of(context).size.width,
          color: Colors.tealAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                checkWin(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedDice=null;
                      results=[];
                    });
                  },
                  child: Text(
                    'Restart',
                    style: TextStyle(fontSize: 24.0),
                  )),
            ],
          ),
        ),
      ),
    );

  }
}