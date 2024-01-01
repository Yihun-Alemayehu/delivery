import 'package:chapasdk/chapasdk.dart';
import 'package:delivery_too/checkout_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
    routes: {
      '/checkout': (context) => const CheckOut(),
    },
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
          onPressed: () {
            Chapa.paymentParameters(
              context: context,
              publicKey: 'CHAPUBK_TEST-GzbYVqxNhbsNxR2dMpdzAQQZDw4GLccC',
              currency: 'ETB',
              amount: '100',
              email: 'yankure01@gmail.com',
              phone: '0982394038',
              firstName: 'Yihun',
              lastName: 'Aleamyehu',
              txRef: 'txRef',
              title: 'title',
              desc: 'desc',
              namedRouteFallBack: '/checkout',
            );
          },
          child: const Text('Pay now'),
        ),
      ),
    );
  }
}
