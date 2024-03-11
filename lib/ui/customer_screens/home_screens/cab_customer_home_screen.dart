import 'package:cab_express/controller/customer_home_screen_controller/logic.dart';
import 'package:cab_express/global/cab_colors.dart';
import 'package:cab_express/global/cab_theme.dart';
import 'package:cab_express/routes/cab_app_routes.dart';
import 'package:cab_express/services/firebase_auth_service/logic.dart';
import 'package:cab_express/ui/flutter_map_widget/map_widget.dart';
import 'package:cab_express/widgets/custom_button.dart';
import 'package:cab_express/widgets/labeld_Input_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CabCustomerHomeScreen extends StatefulWidget {
  const CabCustomerHomeScreen({super.key});

  @override
  State<CabCustomerHomeScreen> createState() => _CabCustomerHomeScreenState();
}

class _CabCustomerHomeScreenState extends State<CabCustomerHomeScreen> {
  final logic = CustomerHomeScreenControllerLogic.instance;

  final state = CustomerHomeScreenControllerLogic.instance.state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            FirebaseAuthServiceLogic.instance.logout().then((_) {
              final states = FirebaseAuthServiceLogic.instance.authStates;
              if (states.isSuccess) {
                Get.offAllNamed(CabAppRoutes.cabLoginScreen);
              } else {
                Get.dialog(
                  AlertDialog(
                    title: const Text('you failed to log out'),
                    actions: [
                      SizedBox(
                        width: context.width,
                        child: CustomButton(
                          onPressed: () {},
                          child: const Text('OK'),
                        ),
                      )
                    ],
                  ),
                );
              }
            });
          },
          icon: const Icon(Icons.logout),
        ),
        centerTitle: true,
        actions: [
          Obx(
            () => Visibility(
              visible: state.showBottomControlBar,
              child: IconButton(
                onPressed: logic.cancelDirection,
                icon: const Icon(Icons.cancel_outlined),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              _showMyPlacesDialog(context);
            },
            icon: const Icon(Icons.place_rounded),
          )
        ],
        title: Text(
          'Cab Express',
          style: context.textTheme.titleLarge?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: CabTheme.appBarGradientColors,
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          MapView(
            controller: state.mapViewController,
            onLongMapPressed: logic.onLongPressed,
          ),
          Obx(
            () => Visibility(
              visible: state.showBottomControlBar,
              child: BottomControlBar(
                mapViewController: state.mapViewController,
                tecNamePlace: state.tecNamePlace,
                onPlaceSavedTap: () {
                  state.yourLocation = state.yourLocation.copyWith(
                    name: state.tecNamePlace.text.trim(),
                  );

                  logic.savedMyPlace(state.yourLocation).then((_) {
                    if (Get.isOverlaysOpen) Get.back();
                  });
                },
                controller: state.mapViewController,
                distanceBetween: state.distanceBetween.value,
                onDirectionTap: () {
                  logic.onDirectionPressed();
                },
                onStartTap: () {},
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(context.width / 36),
            child: Column(
              children: [
                Gap(context.height / 8),
                Obx(() {
                  final hide = state.hideYourLocationCorrectIcon;
                  return LabeledInput(
                    readOnly: state.readOnlyTecYourLocation,
                    controller: state.tecYourLocation,
                    elevation: 3,
                    borderColor: Colors.transparent,
                    filledColor: Colors.white,
                    hintText: 'Your Location',
                    suffixIcon: hide
                        ? InkWell(
                            onTap: logic.onGetLocationPressed,
                            child: const Icon(
                              Icons.gps_fixed,
                              color: Colors.blueAccent,
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              state.readOnlyTecYourLocation =
                                  !state.readOnlyTecYourLocation;
                            },
                            child: Obx(
                              () => state.readOnlyTecYourLocation
                                  ? const Icon(
                                      Icons.cancel,
                                    )
                                  : const Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.blueAccent,
                                    ),
                            ),
                          ),
                  );
                }),
                Obx(() {
                  final hide = state.hideYourDestinationCorrectIcon;

                  return LabeledInput(
                    controller: state.tecDestinationLocation,
                    readOnly: state.readOnlyTecYourDestination,
                    elevation: 3,
                    borderColor: Colors.transparent,
                    filledColor: Colors.white,
                    hintText: 'Your Destination',
                    suffixIcon: InkWell(
                      onTap: () {
                        state.readOnlyTecYourDestination =
                            !state.readOnlyTecYourDestination;
                      },
                      child: hide
                          ? InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.place_rounded,
                              ),
                            )
                          : Obx(
                              () => state.readOnlyTecYourDestination
                                  ? const Icon(
                                      Icons.cancel,
                                    )
                                  : const Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.blueAccent,
                                    ),
                            ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _showMyPlacesDialog(BuildContext ctx) {
    Get.dialog(Dialog(
      child: SizedBox(
        height: ctx.height / 2,
        child: Padding(
          padding: EdgeInsets.all(ctx.width / 36),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'My Places',
                style: ctx.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Gap(ctx.height / 64),
              Obx(() {
                final places = state.myPlacesLocations;
                return Expanded(
                  child: ListView.builder(
                    itemCount: places.length,
                    itemBuilder: (context, index) {
                      final item = places[index];
                      return ListTile(
                        onTap: () {
                          logic.onMyPlaceSelected(item);
                          Get.back();
                        },
                        shape: const UnderlineInputBorder(
                          borderSide: BorderSide(width: 0.7),
                        ),
                        title: Text(item.name ?? ''),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    ));
  }
}

class BottomControlBar extends StatelessWidget {
  const BottomControlBar({
    super.key,
    this.onDirectionTap,
    required this.controller,
    this.onStartTap,
    this.distanceBetween,
    this.onPlaceSavedTap,
    this.tecNamePlace,
    required this.mapViewController,
  });

  final MapViewController controller;
  final void Function()? onDirectionTap;
  final void Function()? onStartTap;
  final void Function()? onPlaceSavedTap;
  final TextEditingController? tecNamePlace;
  final double? distanceBetween;
  final MapViewController mapViewController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomEnd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListenableBuilder(
              listenable: mapViewController,
              builder: (context, child) {
                return Visibility(
                  visible: mapViewController.direction,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.dialog(Dialog(
                        child: Padding(
                          padding: EdgeInsets.all(context.width / 36),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Saved Your Place'),
                              Gap(context.height / 64),
                              LabeledInput(
                                controller: tecNamePlace,
                                hintText: 'Enter Place name',
                              ),
                              Gap(context.height / 64),
                              SizedBox(
                                width: context.width,
                                child: CustomButton(
                                  onPressed: onPlaceSavedTap,
                                  child: Text(
                                    'SAVE',
                                    style:
                                        context.textTheme.labelLarge?.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                    },
                    child: const Text('Saved Placed'),
                  ),
                );
              }),
          Gap(context.height / 128),
          Card(
            margin: EdgeInsets.all(context.width / 36),
            color: Colors.white,
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                ListenableBuilder(
                    listenable: controller,
                    builder: (context, widget) {
                      return ElevatedButton(
                        onPressed:
                            controller.direction ? onStartTap : onDirectionTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CabColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          controller.direction ? 'Start' : 'Direction',
                          style: context.textTheme.titleMedium
                              ?.copyWith(color: Colors.white),
                        ),
                      );
                    }),
                Expanded(
                  child: Text(
                    'Distance: ${distanceBetween?.toStringAsFixed(5) ?? 0.0} / Km',
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleMedium,
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
