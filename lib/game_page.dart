import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class game_page extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: priceForm(),
    );
  }
}

class priceForm extends StatefulWidget {
  const priceForm({Key? key}) : super(key: key);

  @override
  _priceFormState createState() => _priceFormState();
}

class _priceFormState extends State<priceForm> {
  final formKey = GlobalKey<FormState>();
  final priceController = TextEditingController();
  var _proposedPrice = 10;
  var check = "";
  var price_to_check = new Random().nextInt(9000)+1000; // to add a minimal random integer

  @override
  void dispose() {
    priceController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    return Form(
      key: formKey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Center(
                child: Text(check),
              ),
              color: Colors.amber,
              height: 200,
              width: 350,
            ),
            SizedBox(
              width: 350,
              child: TextFormField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: "Entrer un prix entre 1000 et 10000€",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'Veuillez entrer une valeur.';
                  }
                  final n = num.parse(value);
                  if (n < 1000 || n > 10000) {
                    return 'Veuillez entrer un chiffre entre 1000 et 10000.';
                  }
                },
                keyboardType: TextInputType.number,
                maxLength: 5,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // isGood = priceController.value.text;
                  // Navigator.pop(context);
                  changePrice();
                  if(_proposedPrice < price_to_check) {
                    check = "C'est plus !";
                  }
                  if(_proposedPrice > price_to_check) {
                    check = "C'est moins !";
                  }
                  if(_proposedPrice == price_to_check) {
                    check = "C'est le juste prix !";
                    // navigator
                    Navigator.pushNamed(context, '/end');
                  }
                }
              } ,
              child: Text('Tester!',
                  style: GoogleFonts.lato(fontSize: 28)),
              style: ElevatedButton.styleFrom(fixedSize: Size(350, 100)),
            ),
          ],
        ),
      ),
    );
  }

  void changePrice() {
    setState(() {
      _proposedPrice = int.parse(priceController.text);
    });
  }

}
