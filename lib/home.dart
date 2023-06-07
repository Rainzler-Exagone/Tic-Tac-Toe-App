import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> DisplayExOh = ['', '', '', '', '', '', '', '', ''];
  int ohScore = 0;
  int exScore = 0;

  bool isTurn = true;
  int FilledBox = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("ECDB44"),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Player X ",
                            style: GoogleFonts.pangolin(
                                fontSize: 25, color: Colors.white)),
                        Text(exScore.toString(),
                            style: GoogleFonts.pangolin(
                                fontSize: 25, color: Colors.white)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Player O ",
                            style: GoogleFonts.pangolin(
                                fontSize: 25, color: Colors.white)),
                        Text(ohScore.toString(),
                            style: GoogleFonts.pangolin(
                                fontSize: 25, color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                padding: EdgeInsets.only(right: 10, left: 10, top: 30),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      padding: EdgeInsets.only(bottom: 20),
                      width: 200.0,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade600,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15,
                              spreadRadius: 1.0,
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(13)),
                          border: Border.all(color: Colors.white)),
                      child: Center(
                        child: Text(
                          DisplayExOh[index],
                          style: GoogleFonts.freckleFace(
                            color: Colors.black,
                            fontSize: 45,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: IconButton(
                          iconSize: 45,
                          icon: const Icon(
                            Icons.replay_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                          tooltip: 'Air it',
                          onPressed: () {
                            _ShowResetDialogue();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 94),
                        child: IconButton(
                          iconSize: 45,
                          icon: const Icon(
                            Icons.restart_alt_rounded,
                            color: Colors.white,
                          ),
                          // tooltip: 'Air it',
                          onPressed: () {
                            _ShowResetDialogue();
                            ohScore = 0;
                            exScore = 0;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 45),
                        child: Column(
                          children: [
                            Text(
                              "Restart",
                              style: GoogleFonts.pangolin(
                                  fontSize: 19, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 100),
                          child: Column(
                            children: [
                              Text('Reset',
                                  style: GoogleFonts.pangolin(
                                      fontSize: 19, color: Colors.white)),
                            ],
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (isTurn && DisplayExOh[index] == '') {
        DisplayExOh[index] = 'X';

        FilledBox += 1;
      } else if (!isTurn && DisplayExOh[index] == '') {
        DisplayExOh[index] = 'O';
        FilledBox += 1;
      }
      isTurn = !isTurn;

      _checkWinner();
    });
  }

  void _checkWinner() {
    //3ree consecutive in first row
    if (DisplayExOh[0] == DisplayExOh[1] &&
        DisplayExOh[0] == DisplayExOh[2] &&
        DisplayExOh[0] != '') {
      _ShowDialogue(DisplayExOh[0]);
    }
    //3ree consecutive in second row
    if (DisplayExOh[3] == DisplayExOh[4] &&
        DisplayExOh[3] == DisplayExOh[5] &&
        DisplayExOh[3] != '') {
      _ShowDialogue(DisplayExOh[3]);
    }
    //3ree consecutive in last row
    if (DisplayExOh[6] == DisplayExOh[7] &&
        DisplayExOh[6] == DisplayExOh[8] &&
        DisplayExOh[6] != '') {
      _ShowDialogue(DisplayExOh[6]);
    }
    //3ree consecutive in first column
    if (DisplayExOh[0] == DisplayExOh[3] &&
        DisplayExOh[0] == DisplayExOh[6] &&
        DisplayExOh[0] != '') {
      _ShowDialogue(DisplayExOh[0]);
    }
    //3ree consecutive in second column
    if (DisplayExOh[1] == DisplayExOh[4] &&
        DisplayExOh[1] == DisplayExOh[7] &&
        DisplayExOh[1] != '') {
      _ShowDialogue(DisplayExOh[1]);
    }
    //3ree consecutive in the last column
    if (DisplayExOh[1] == DisplayExOh[4] &&
        DisplayExOh[1] == DisplayExOh[7] &&
        DisplayExOh[1] != '') {
      _ShowDialogue(DisplayExOh[1]);
    }
    //3ree consecutive in first diagonal
    if (DisplayExOh[0] == DisplayExOh[4] &&
        DisplayExOh[0] == DisplayExOh[8] &&
        DisplayExOh[0] != '') {
      _ShowDialogue(DisplayExOh[0]);
    }
    //3ree consecutive in second diagonal
    if (DisplayExOh[2] == DisplayExOh[4] &&
        DisplayExOh[2] == DisplayExOh[6] &&
        DisplayExOh[2] != '') {
      _ShowDialogue(DisplayExOh[2]);
    } else if (FilledBox == 9) {
      _ShowRowDialogue();
    }
  }

  void _ShowRowDialogue() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text(
              "Draw !!",
              style: GoogleFonts.pangolin(),
            )),
            actions: [
              ElevatedButton(
                  child: Text('Play Again!', style: GoogleFonts.pangolin()),
                  onPressed: () {
                    ClearBoard();
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  void _ShowDialogue(String Winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("the Player " + Winner + " is Winner !!",
                style: GoogleFonts.pangolin()),
            actions: [
              ElevatedButton(
                  child: Text('Play Again!', style: GoogleFonts.pangolin()),
                  onPressed: () {
                    ClearBoard();
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
    if (Winner == 'O') {
      ohScore++;
    }
    if (Winner == 'X') {
      exScore++;
    }
  }

  void _ShowResetDialogue() {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text("Are you sure", style: GoogleFonts.pangolin())),
            actions: [
              ElevatedButton(
                  child: Text('yes', style: GoogleFonts.pangolin()),
                  onPressed: () {
                    ClearBoard();
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  void ClearBoard() {
    setState(() {
      for (var i = 0; i < 9; i++) {
        DisplayExOh[i] = '';
      }
    });
    FilledBox = 0;
  }

  void _ClearScore() {
    setState(() {
      for (var i = 0; i < 9; i++) {
        DisplayExOh[i] = '';
      }
    });
    FilledBox = 0;
    ohScore = 0;
    exScore = 0;
  }
}
