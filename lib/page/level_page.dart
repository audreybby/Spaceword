import 'dart:async';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:spaceword/constants/levels.dart';
import 'package:spaceword/provider.dart';
import 'package:spaceword/ui/popup_win_lose.dart';

enum LevelType { easy, medium, hard }

switchLevel(LevelType lvl) {
  if (lvl == LevelType.easy) {
    return (
      correctAnswers: easyCorrectAnswers,
      crossword: easyCrossword,
      clues: easyClues
    );
  } else if (lvl == LevelType.medium) {
    return (
      correctAnswers: mediumCorrectAnswers,
      crossword: mediumCrossword,
      clues: mediumClues
    );
  } else {
    return (
      correctAnswers: hardCorrectAnswers,
      crossword: hardCrossword,
      clues: hardClues
    );
  }
}

class LevelPage extends StatefulWidget {
  final LevelType type;
  final String bgImage;

  const LevelPage({super.key, required this.type, required this.bgImage});

  @override
  _LevelState createState() => _LevelState();
}

class _LevelState extends State<LevelPage> with SingleTickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();

  Timer? timer;
  int timerCount = 45;
  int score = 0;
  int remainingTime = 45;

  int activeClueIndex = 0;
  List<bool> isCorrectRow = [false, false, false, false, false];
  List<bool> isRowWrong = [false, false, false, false, false];
  String statusMessage = '';
  Color statusColor = Colors.white;
  double statusMessageYPosition = 200;

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  late final List<List<String>> correctAnswers;
  late final List<List<String>> crossword;
  late final List<String> clues;
  late final String bgImage;

  @override
  void initState() {
    super.initState();

    // Destructure the Record from switchLevel via `widget`
    final data = switchLevel(widget.type);
    if (data == null) {
      throw Exception("Level data is null for type ${widget.type}");
    }

    // Access the Record's fields
    correctAnswers = data.correctAnswers;
    crossword = data.crossword;
    clues = data.clues;

    // Directly assign other properties
    bgImage = widget.bgImage;

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 1.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    startTime();
  }

  @override
  void dispose() {
    timer?.cancel();
    _focusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void addScore1(int points) {
    setState(() {
      score += points;
    });

    //menambahkan coin sesuai dengan skor
    int coinsToAdd = points; // Langsung menyamakan jumlah koin dengan skor
    Provider.of<CoinProvider>(context, listen: false).addCoins(coinsToAdd);

    if (isCorrectRow.every((row) => row)) {
      showFinalPopup(true);
      timer?.cancel();
    }
  }

  void showFinalPopup(bool isWin) {
    Future.delayed(const Duration(seconds: 1), () {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return isWin
              ? PopupWinLose(score: score, type: PopupType.win)
              : PopupWinLose(score: score, type: PopupType.lose);
        },
      );
    });
  }

  void startTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
        if (!allRowsCorrect()) {
          showFinalPopup(false);
        }
      }
    });
  }

  bool allRowsCorrect() {
    return isCorrectRow.every((correct) => correct);
  }

  void updateRow(int rowIndex, String newRowValue) {
    setState(() {
      if (newRowValue.length != correctAnswers[rowIndex].length) {
        isRowWrong[rowIndex] = true;
        for (int i = 0; i < crossword[rowIndex].length; i++) {
          crossword[rowIndex][i] = ''; // kolom akan tetap kosong
        }
        return;
      }

      List<String> newRow = newRowValue.split('');
      bool isCorrect = true;

      for (int i = 0; i < newRow.length; i++) {
        if (newRow[i].toUpperCase() != correctAnswers[rowIndex][i]) {
          isCorrect = false;
          break;
        }
      }

      if (isCorrect) {
        crossword[rowIndex] = List.from(correctAnswers[rowIndex]);
        isCorrectRow[rowIndex] = true;
        isRowWrong[rowIndex] = false;
        statusMessage = 'BENAR!';
        statusColor = Colors.green;
        _animationController.forward(from: 0.0);

        remainingTime += 3;
        addScore1(5);
      } else {
        isRowWrong[rowIndex] = true;
        crossword[rowIndex].fillRange(0, crossword[rowIndex].length, '');
        statusMessage = 'SALAH!';
        statusColor = const Color.fromARGB(255, 207, 17, 4);
        _animationController.forward(from: 0.0);
      }

      if (isCorrectRow.every((row) => row)) {
        showFinalPopup(true);
      }
    });
  }

  void showAnswerInputDialog(BuildContext context, int rowIndex) {
    if (isCorrectRow[rowIndex]) {
      return;
    }

    final TextEditingController controller =
        TextEditingController(text: crossword[rowIndex].join());

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(clues[rowIndex],
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                focusNode: _focusNode,
                controller: controller,
                onSubmitted: (newValue) {
                  if (newValue.trim().isNotEmpty) {
                    updateRow(rowIndex, newValue);
                  }
                  Navigator.pop(context);
                },
                maxLength: crossword[rowIndex].length,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  counterText: '',
                ),
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                String newValue = controller.text.trim();
                if (newValue.isEmpty) {
                  Navigator.pop(context);
                  return;
                }

                updateRow(rowIndex, newValue);
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    ).then((_) {
      _focusNode.unfocus();
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('Waktu: $remainingTime detik',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('Score: $score',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255))),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Column(
                    children: List.generate(crossword.length, (rowIndex) {
                      return Row(
                        children: List.generate(crossword[rowIndex].length,
                            (colIndex) {
                          Color borderColor =
                              const Color.fromARGB(255, 255, 255, 255);

                          if (isCorrectRow[rowIndex]) {
                            borderColor = Colors.green;
                          } else if (isRowWrong[rowIndex]) {
                            borderColor = Colors.red;
                          }

                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                showAnswerInputDialog(context, rowIndex);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: borderColor, width: 2.0),
                                ),
                                child: AspectRatio(
                                  aspectRatio: 1.0,
                                  child: Center(
                                    child: Text(
                                      crossword[rowIndex][colIndex],
                                      style: const TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _opacityAnimation.value,
                        child: ScaleTransition(
                          scale: _scaleAnimation,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              statusMessage,
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: statusColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Flexible(
              flex: 1,
              child: Consumer<CharacterProvider>(
                builder: (context, characterProvider, child) {
                  return Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(characterProvider.selectedBody,
                            height: 180),
                        Image.asset(characterProvider.selectedClothes,
                            height: 180),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}
