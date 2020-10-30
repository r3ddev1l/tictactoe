import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // static const TextStyle kTextStyle =
  //     TextStyle(fontSize: 32, color: Colors.white);
  bool _isOTurn = true; //first player is O
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  int aaluScore = 0;
  int crossScore = 0;
  int _filledBoxes = 0;

  //
  // static var kTextStyle = GoogleFonts.pressStart2p(
  //   textStyle: TextStyle(color: Colors.black, letterSpacing: 3, fontSize: 32),
  // );
  static var kTextStyle = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 32),
  );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          children: [
            Expanded(
                child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'आलु',
                          style: kTextStyle,
                        ),
                        Text(
                          '$aaluScore',
                          style: kTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'क्रस',
                          style: kTextStyle,
                        ),
                        Text(
                          '$crossScore',
                          style: kTextStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[700],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            displayXO[index],
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 96,
                                fontWeight: FontWeight.w100),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                  // color: Colors.red,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (_isOTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        _filledBoxes += 1;
      } else if (!_isOTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
        _filledBoxes += 1;
      }
      _isOTurn = !_isOTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    //1st row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      _showWinnerDialog(displayXO[0]);
    }
    //2nd row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      _showWinnerDialog(displayXO[3]);
    }
    //3rd row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      _showWinnerDialog(displayXO[6]);
    }
    //1st column
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      _showWinnerDialog(displayXO[0]);
    }
    //2nd column
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      _showWinnerDialog(displayXO[1]);
    }
    //3rd column
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      _showWinnerDialog(displayXO[2]);
    }
    //1st diagonal
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      _showWinnerDialog(displayXO[0]);
    }
    //2nd diagonal
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      _showWinnerDialog(displayXO[2]);
    } else if (_filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showWinnerDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(winner == 'O' ? 'आलुले जित्यो !' : 'क्रसले जित्यो !'),
            actions: [
              RaisedButton(
                onPressed: () {},
                child: Text("भयो पुग्यो"),
              ),
              RaisedButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text("फेरी खेल्ने"),
              ),
            ],
          );
        });
    if (winner == 'O') {
      aaluScore++;
    } else if (winner == 'X') {
      crossScore++;
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('बराबरी भयो !'),
            actions: [
              RaisedButton(
                onPressed: () {},
                child: Text("भयो पुग्यो "),
              ),
              RaisedButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text("फेरी खेल्ने"),
              ),
            ],
          );
        });
  }

  void _clearBoard() {
    setState(
      () {
        displayXO = ['', '', '', '', '', '', '', '', ''];
      },
    );
    _filledBoxes = 0;
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }
}
// const linearGradient = LinearGradient(
//   begin: Alignment.topRight,
//   end: Alignment.bottomLeft,
//   colors: [
//     Colors.grey,
//   ],
// );
