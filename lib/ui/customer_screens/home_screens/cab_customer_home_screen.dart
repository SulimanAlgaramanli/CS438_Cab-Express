import 'package:cab_express/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CabCustomerHomeScreen extends StatefulWidget {
  const CabCustomerHomeScreen({super.key});

  @override
  State<CabCustomerHomeScreen> createState() => _CabCustomerHomeScreenState();
}

class _CabCustomerHomeScreenState extends State<CabCustomerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cab Express')),
      body: Padding(
        padding: EdgeInsets.all(context.width / 36),
        child: Column(
          children: [
            Text(
              LocalStorageService.instance.customer.fullName ?? '',
              style: context.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
