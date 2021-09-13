import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'game_page.dart';
import 'end_page.dart';

void main() => runApp(MaterialApp(
  title: 'Le juste prix',
  home: homePage(),
  routes: {
    "/game": (context) => game_page(),
    "/end": (context) => end_page(),
  },
));

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset("img/juste_prix.png"),
            Text("Bienvenue dans le juste prix!",
              style: GoogleFonts.lato(
                  fontSize: 28,
                  decoration: TextDecoration.underline
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/game");
              }
                // Navigator.push(context, MaterialPageRoute<void>(
                //   builder: (BuildContext context) {
                //     return Scaffold(
                //       body: Center(
                //         child: TextButton(
                //           child: Text('POP'),
                //           onPressed: () {Navigator.pop(context);},
                //         ),
                //       ),
                //     );
                //   }
                // ));
                ,
              child: Text(
                'Appuyer pour jouer !',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black87
                ),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(350, 100),
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    );


  }
}