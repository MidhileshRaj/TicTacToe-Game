import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/controller/bot_player_page.dart';
import 'package:tic_tac_toe/controller/gamepage_controller.dart';
import 'package:tic_tac_toe/view/botpaly%20test.dart';

import 'gamepage.dart';
import 'widget/custom_start_button.dart';
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
                          content: SizedBox(
                                height: MediaQuery.sizeOf(context).height * .2,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Consumer<GamePageController>(
                                        builder: (BuildContext context,
                                            GamePageController value,
                                            Widget? child) {
                                          if(value.isBotplay){
                                            return TextField(
                                              controller: Provider.of<TicTacToeGame>(context).playerX,
                                              decoration: InputDecoration(
                                                hintText: "Player 'X' name",
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(20),
                                                ),
                                              ),
                                            );
                                          }else{
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
                                          }
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
                                          if(value.isBotplay){
                                            return const SizedBox();
                                          }else{
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
                                          }
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),

                          ),
                          actions: [

                            Consumer<GamePageController>(builder: (context, value, child){
                              if(value.isBotplay){
                                return TextButton(
                                  onPressed: () {
                                    Provider.of<GamePageController>(context,
                                        listen: false)
                                        .selectPlayMode();

                                  },
                                  child: const Text("‘2 players’"),
                                );
                              }else{
                                return TextButton(
                                  onPressed: () {
                                    Provider.of<GamePageController>(context,
                                        listen: false)
                                        .selectPlayMode();

                                  },
                                  child: const Text("‘Play against Bot’"),
                                );
                              }
                            },),
                            const SizedBox(width: 5,),Consumer<GamePageController>(builder: (context, value, child) {
                              if(value.isBotplay){
                                return TextButton(
                                  onPressed: () {
                                    Provider.of<TicTacToeGame>(context,
                                        listen: false)
                                        .startGame();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const BotPlay(),
                                        ));
                                  },
                                  child: const Text("‘Play ’"),
                                );
                              }else{
                               return TextButton(
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
                                );
                              }
                            },),
                            const SizedBox(width: 5,),
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
