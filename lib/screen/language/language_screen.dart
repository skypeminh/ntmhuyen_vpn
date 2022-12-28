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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                        color: Primary_700.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Primary_700)
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/country/us.png",
                          height: 64,
                          width: 64,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text("English",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                        color: Neutral_100,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Neutral_300)
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/country/india.png",
                          height: 64,
                          width: 64,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text("Hindi",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                        color: Neutral_100,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Neutral_300)
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/country/russia.png",
                          height: 64,
                          width: 64,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text("Russian",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
