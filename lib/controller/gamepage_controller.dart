import 'package:flutter/material.dart';
import 'package:tic_tac_toe/view/initial_page.dart';


class GamePageController extends ChangeNotifier {
  List<List<String>> gameGrid = [];

  String currentPlayer = '';

  TextEditingController playerX = TextEditingController(text: "player1");
  TextEditingController playerO = TextEditingController(text: "player2");

  void startGame() {

    gameGrid = List.generate(3, (_) => List.filled(3, ''));

    currentPlayer = 'X';

    notifyListeners();
  }

  void onCellTapped(int row, int col, BuildContext context) {
    if (gameGrid[row][col].isEmpty) {
      // setState(() {
      gameGrid[row][col] = currentPlayer;

      currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
      // });
      notifyListeners();

      String winner = checkForWinner();

      if (winner.isNotEmpty) {
        showWinnerDialog(winner, context);
      }
    }
  }

  String checkForWinner() {
    for (int i = 0; i < 3; i++) {
      if (gameGrid[i][0] == gameGrid[i][1] &&
          gameGrid[i][1] == gameGrid[i][2] &&
          gameGrid[i][0].isNotEmpty) {
        return gameGrid[i][0];
      }

      if (gameGrid[0][i] == gameGrid[1][i] &&
          gameGrid[1][i] == gameGrid[2][i] &&
          gameGrid[0][i].isNotEmpty) {
        return gameGrid[0][i];
      }
    }

    if (gameGrid[0][0] == gameGrid[1][1] &&
        gameGrid[1][1] == gameGrid[2][2] &&
        gameGrid[0][0].isNotEmpty) {
      return gameGrid[0][0];
    }

    if (gameGrid[0][2] == gameGrid[1][1] &&
        gameGrid[1][1] == gameGrid[2][0] &&
        gameGrid[0][2].isNotEmpty) {
      return gameGrid[0][2];
    }

    bool isDraw = true;

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (gameGrid[i][j].isEmpty) {
          isDraw = false;

          break;
        }
      }
    }

    if (isDraw) {
      return "‘Draw’";
    }

    return "";
  }

  void showWinnerDialog(String winner, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("‘Game Over’"),
        content: winner == 'X'
            ? Text(winner == "‘Draw’"
                ? "‘It’s a draw!’"
                : "Player ${playerX.text} wins!")
            : Text(winner == "‘Draw’"
                ? "‘It’s a draw!’"
                : "Player ${playerO.text} wins!"),
        actions: [
          TextButton(
            onPressed: () {
              resetGame();

              Navigator.pop(context);
            },
            child: const Text("‘Play Again’"),
          ),
          const SizedBox(
            width: 1,
          ),
          TextButton(
            onPressed: () {
              resetGame();
              playerX.clear();
              playerO.clear();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const InitGamePage(),
                ),
              );
            },
            child: const Text("‘Back to Home’"),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }

  void resetGame() {
    // setState(() {
    startGame();
    notifyListeners();
    // });
  }
}
