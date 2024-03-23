import 'dart:math';

import 'package:flutter/material.dart';

class TicTacToeGame extends ChangeNotifier {
  List<List<String>> gameGrid = List.generate(3, (_) => List.filled(3, ''));
  bool isGameEnd = false;
  String currentPlayer = 'X'; // Assume human player starts

  void onCellTapped(int row, int col, BuildContext context) {
    if (!isGameEnd && gameGrid[row][col].isEmpty) {
      gameGrid[row][col] = currentPlayer;

      String winner = checkForWinner();
      if (winner.isNotEmpty) {
        isGameEnd = true;
        showWinnerDialog(winner, context);
      } else {
        // Switch player only if the game is not ended
        switchPlayer();
        // Bot's turn
        if (currentPlayer == 'O') {
          botPlay();
        }
      }
      notifyListeners();
    }
  }

  void switchPlayer() {
    currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
  }

  void botPlay() {
    // Bot's turn - select a random empty cell
    List<int> emptyCells = [];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (gameGrid[i][j].isEmpty) {
          emptyCells.add(i * 3 + j);
        }
      }
    }
    if (emptyCells.isNotEmpty) {
      int randomIndex = Random().nextInt(emptyCells.length);
      int selectedCell = emptyCells[randomIndex];
      int row = selectedCell ~/ 3;
      int col = selectedCell % 3;
      gameGrid[row][col] = currentPlayer;
      switchPlayer();
    }
  }

  // Function to check if there's a winner
  String checkForWinner() {
    // Implementation remains the same
    return "";
  }

  // Function to show the winner dialog
  void showWinnerDialog(String winner, BuildContext context) {
    // Implementation remains the same
  }
}
