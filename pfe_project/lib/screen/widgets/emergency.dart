import 'package:flutter/material.dart';
import 'package:pfe_project/screen/widgets/emergencies.pages.dart/ambulance.emergency.dart';
import 'package:pfe_project/screen/widgets/emergencies.pages.dart/army.emergency.dart';
import 'package:pfe_project/screen/widgets/emergencies.pages.dart/fire.bridge.dart';
import 'package:pfe_project/screen/widgets/emergencies.pages.dart/police.emergency.dart';

class Emergency extends StatelessWidget {
  const Emergency({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        //width: MediaQuery.of(context).size.width,
        height: 180,
        child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            PoliceEmergency(),
            AmbulanceEmergency(),
            ArmyEmergency(),
            FireBridge()
          ],
        ));
  }
}
