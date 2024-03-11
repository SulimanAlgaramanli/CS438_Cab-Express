// import 'package:cab_express/data/models/app/location.model.dart';
// import 'package:cab_express/services/location_services_controller/location_services.dart';
// import 'package:cab_express/services/location_services_controller/logic.dart';
// import 'package:cab_express/utils/states.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:get/get.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:mockito/mockito.dart';
// import 'package:test/test.dart';
//
// class MockLocationServiceController extends Mock implements LocationServiceController {}
//
// void main() {
//   group('CustomerHomeScreenControllerLogic', () {
//     test('onGetLocationPressed - successful', () async {
//       // Arrange
//       final mockLocationService = MockLocationServiceController();
//       when(mockLocationService.allowed).thenReturn(true);
//       when(mockLocationService.getLocation())
//           .thenAnswer((_) => Future.value(LocationModel(lat: 10.0, long: 20.0)));
//       final controller = CustomerHomeScreenControllerLogic(locationService: mockLocationService);
//
//       // Act
//       await controller.onGetLocationPressed();
//
//       // Assert
//       expect(controller.state.locationStates.value, States.success());
//       expect(controller.state.yourLocation.lat, 10.0);
//       expect(controller.state.yourLocation.long, 20.0);
//       verify(mockLocationService.checkPermissions()).called(once);
//       verify(mockLocationService.getLocation()).called(once);
//     });
//   });
// }
