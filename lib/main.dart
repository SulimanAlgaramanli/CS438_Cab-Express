import 'package:cab_express/global/cab_theme.dart';
import 'package:cab_express/routes/cab_app_routes.dart';
import 'package:cab_express/services/firebase_auth_service/logic.dart';
import 'package:cab_express/services/local_storage_service.dart';
import 'package:cab_express/services/location_services_controller/logic.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(LocalStorageService());
  runApp(const CabExpressApp());
}

class CabExpressApp extends StatelessWidget {
  const CabExpressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: BindingsBuilder(() {
        Get.put(LocationServiceController());
        Get.put(FirebaseAuthServiceLogic());
      }),
      theme: CabTheme.themeApp(context),
      debugShowCheckedModeBanner: false,
      initialRoute: CabAppRoutes.cabRoot,
      getPages: CabAppRoutes.routes,
    );
  }
}
