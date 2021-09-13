import 'package:flutter/material.dart';

class end_page extends StatelessWidget {
  const end_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Bien joué!', style: TextStyle(fontSize: 50),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/game');
                    },
                    child: Text('Rejouer'),
                    style: ElevatedButton.styleFrom(primary: Colors.lime),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text('Revenir à la page d\'accueil'),
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }
}
