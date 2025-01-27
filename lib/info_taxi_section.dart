import 'package:flutter/material.dart';

class InfoTaxiSection extends StatelessWidget {
  final String placa;

  const InfoTaxiSection({super.key, required this.placa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
      ),
      body: Center(
        child: Text(
          'La placa ingresada es: $placa',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}