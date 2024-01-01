import 'package:chapasdk/chapasdk.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay now'),
        centerTitle: true,
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: (){
            Chapa.paymentParameters(context: context, publicKey: publicKey, currency: currency, amount: amount, email: email, phone: phone, firstName: firstName, lastName: lastName, txRef: txRef, title: title, desc: desc, namedRouteFallBack: namedRouteFallBack)
          }, 
          child: const Text('Pay now'),),
      ),
    );
  }
}
