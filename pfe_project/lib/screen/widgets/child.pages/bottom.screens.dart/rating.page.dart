import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pfe_project/utils/global.colors.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Were gonna happy if you rating our application"),
              RatingBar.builder(
                itemCount: 5,
                initialRating: 2,
                minRating: 1,
                allowHalfRating: true,
                direction: Axis.horizontal,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Color.fromARGB(86, 84, 11, 210),
                ),
                onRatingUpdate: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
