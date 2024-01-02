import 'dart:math';
import 'package:chapasdk/chapasdk.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/checkout':
          return MaterialPageRoute(
            builder: (context) => const Payment(),
          );
        default:
          return MaterialPageRoute(
            builder: (context) => const Payment(),
          );
      }
    },
  ));
}

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  var args;
//test
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        if (ModalRoute.of(context)?.settings.arguments != null) {
          args = ModalRoute.of(context)?.settings.arguments;
          print('message after payment');
          print(args['message']);
        }
      });
    });

    super.initState();
    // context.read<CheckoutPage>().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay now'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () async {
              print("started....");
              Chapa result = await Chapa.paymentParameters(
                context: context,
                publicKey: 'CHAPUBK_TEST-GzbYVqxNhbsNxR2dMpdzAQQZDw4GLccC',
                currency: 'ETB',
                amount: '100',
                email: 'yankure01@gmail.com',
                phone: '0982394038',
                firstName: 'Yihun',
                lastName: 'Aleamyehu',
                txRef: 'x209091' + Random().nextInt(10).toString(),
                title: 'Payment',
                desc: 'desc',
                namedRouteFallBack: '/checkout',
              );
            },
            child: Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)),
                child: const Text(
                  'Pay now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
