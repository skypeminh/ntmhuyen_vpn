import 'package:flutter/material.dart';
import 'package:ntmhuyen_datn_vpn/constants.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: White),
        actionsIconTheme: const IconThemeData(color: White),

        title: const Text(
          "Change Language",
          style: TextStyle(color: White),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Primary_700.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Primary_700)
              ),
              width: 100,
              child: Column(
                children: [
                  Image.asset(
                    "assets/country/us.png",
                    height: 80,
                    width: 80,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
