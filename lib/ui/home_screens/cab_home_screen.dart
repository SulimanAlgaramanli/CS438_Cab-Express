import 'package:cab_express/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: Column(children: [
        Text(LocalStorageService.instance.customer.firstName ?? '',style: context.textTheme.titleMedium ),
      ]),
    );
  }
}
