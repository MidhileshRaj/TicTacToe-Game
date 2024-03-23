import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class InitGamePage extends StatelessWidget {
  const InitGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: const ColorFilter.mode(
        Colors.blue, // Background color
        BlendMode.overlay, // Blend mode
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.tealAccent[700],
            image: const DecorationImage(
                image: AssetImage("assets/images/tictactoe.jpg"))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("‘Enter Player Name’"),
                          content: Consumer<GamePageController>(
                            builder: (BuildContext context,
                                GamePageController value, Widget? child) {
                              return SizedBox(
                                height: MediaQuery.sizeOf(context).height * .2,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Consumer<GamePageController>(
                                        builder: (BuildContext context,
                                            GamePageController value,
                                            Widget? child) {
                                          return TextField(
                                            controller: value.playerX,
                                            decoration: InputDecoration(
                                              hintText: "Player 'X' name",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(20),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: Consumer<GamePageController>(
                                        builder: (BuildContext context,
                                            GamePageController value,
                                            Widget? child) {
                                          return TextField(
                                            controller: value.playerO,
                                            decoration: InputDecoration(
                                              hintText: "Player 'X' name",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(20),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Provider.of<GamePageController>(context,
                                    listen: false)
                                    .startGame();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const GamePage(),
                                    ));
                              },
                              child: const Text("‘Play ’"),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const CustomStartButton(
                      text: 'Play Tic Tac Toe',
                    )),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
