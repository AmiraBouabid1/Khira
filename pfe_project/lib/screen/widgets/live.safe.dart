import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pfe_project/screen/widgets/emergencies.pages.dart/police.emergency.dart';
import 'package:pfe_project/screen/widgets/live.safe/bus.station.dart';
import 'package:pfe_project/screen/widgets/live.safe/hospital.dart';
import 'package:pfe_project/screen/widgets/live.safe/pharmacy.card.dart';
import 'package:pfe_project/screen/widgets/live.safe/police.station.dart';
import 'package:url_launcher/url_launcher.dart';

class LiveSafe extends StatelessWidget {
  const LiveSafe({super.key});
  static Future<void> openMap(String location) async {
    String googleUrl = 'https://www.google.com/maps/search/$location';
    final Uri _url = Uri.parse(googleUrl);
    try {
      await launchUrl(_url);
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'something went wrong! call emergency number');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: const [
          PoliceStation(onMapFunction: openMap),
          Hospital(onMapFunction: openMap),
          BusStation(onMapFunction: openMap),
          PharmacyCard(onMapFunction: openMap),
        ],
      ),
    );
  }
}
