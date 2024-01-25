import 'package:flutter/material.dart';

class CabHomeScreen extends StatefulWidget {
  const CabHomeScreen({super.key});

  @override
  State<CabHomeScreen> createState() => _CabHomeScreenState();
}

class _CabHomeScreenState extends State<CabHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cab Express')),
    );
  }
}
