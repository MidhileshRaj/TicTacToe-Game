import 'package:flutter/material.dart';

class CustomStartButton extends StatelessWidget {
  const CustomStartButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      height: 50,
     width: 150,
     decoration:  BoxDecoration(
       border: Border.all(color: Colors.black,width: 5),
       borderRadius: BorderRadius.circular(20),
       gradient: const LinearGradient(
         begin: Alignment.topLeft,
         end: Alignment.bottomRight,
         colors: [
           Colors.redAccent,Colors.white
         ]
       )
     ),
      child: Text(text,style: const TextStyle(fontWeight: FontWeight.bold),),
    );
  }
}
