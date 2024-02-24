import 'package:cab_express/controller/customer_home_screen_controller/logic.dart';
import 'package:cab_express/global/cab_colors.dart';
import 'package:cab_express/global/cab_theme.dart';
import 'package:cab_express/ui/flutter_map_widget/map_widget.dart';
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
          Obx(() => Visibility(
                visible: state.showBottomControlBar,
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: BottomControlBar(
                    controller: state.mapViewController,
                    distanceBetween: state.distanceBetween.value,
                    onDirectionTap: () {
                      logic.onDirectionPressed();
                    },
                    onStartTap: () {},
                  ),
                ),
              )),
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
}

class BottomControlBar extends StatelessWidget {
  const BottomControlBar({
    super.key,
    this.onDirectionTap,
    required this.controller,
    this.onStartTap,
    this.distanceBetween,
  });

  final MapViewController controller;
  final void Function()? onDirectionTap;
  final void Function()? onStartTap;
  final double? distanceBetween;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  onPressed: controller.direction ? onStartTap : onDirectionTap,
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
    );
  }
}
