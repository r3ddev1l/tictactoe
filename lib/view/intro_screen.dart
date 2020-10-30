import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/view/home_page.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'आलु क्रस',
            style: TextStyle(
                fontSize: 96,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic),
          ),
          AvatarGlow(
            shape: BoxShape.rectangle,
            endRadius: 140,
            duration: Duration(seconds: 2),
            glowColor: Colors.white10,
            repeat: true,
            repeatPauseDuration: Duration(seconds: 1),
            child: Container(
              child: Image.asset('assets/images/ttt.png'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(64.0),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext contex) => HomePage(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(
                        "खेल सुरु गरम",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
