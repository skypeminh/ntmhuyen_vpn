import 'dart:async';

import 'package:flutter/material.dart';
import 'package:VPN_MHuyen/constants.dart';
import 'package:VPN_MHuyen/screen/country/country_screen.dart';
import 'package:VPN_MHuyen/screen/language/language_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);



  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isactive = false;

  Duration _duration = const Duration();
  Timer? _timer;

  startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      const addSeconds = 1;
      setState(() {
        final seconds = _duration.inSeconds + addSeconds;
        _duration = Duration(seconds: seconds);
      });
    });
  }

  stopTimer() {
    setState(() {
      _timer?.cancel();
      _duration = const Duration();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: White,

      appBar: AppBar(
        backgroundColor: White,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Primary_700),
        actionsIconTheme: const IconThemeData(color: Primary_700),

        title: const Text(
          "PAPA VPN",
          style: TextStyle(color: Background),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.help_outline)),
        ],
      ),


      //menuu
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
                child: Center(
                  child: Text(
                    " PAPA VPN",
                    style: TextStyle(
                        color: Primary_700,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.account_circle_outlined,
                size: 24,
                color: Background,
              ),
              title: const Text(
                "Account",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Background),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Neutral_900,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LanguageScreen()));
              },
              leading: const Icon(
                Icons.language,
                size: 24,
                color: Background,
              ),
              title: const Text(
                "Change Language",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Background),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Neutral_900,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.rate_review_outlined,
                size: 24,
                color: Background,
              ),
              title: const Text(
                "Rate US",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Background,),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Neutral_900,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.share_outlined,
                size: 24,
                color: Background,
              ),
              title: const Text(
                "Share App",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Background),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Neutral_900,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.info_outline_rounded,
                size: 24,
                color: Background,
              ),
              title: const Text(
                "About Us",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Background),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Neutral_900,
              ),
            ),
            const Spacer(),
            const Text(
              "V 1.0.0",
              style: TextStyle(color: Colors.grey),

            )
          ],
        ),
      ),




      //button connect VPN
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: _size.height * 0.08,
            ),

            Center(
              child: InkWell(
                onTap: () {
                    isactive ? stopTimer() : startTimer();
                    setState(() => isactive = !isactive);
                },

                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(150),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Primary_700,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      height: 130,
                      width: 130,
                      decoration: const BoxDecoration(
                        color: Neutral_100,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.power_settings_new,
                            size: 30,
                            color: isactive == true ? Primary_700 : Colors.grey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            isactive == true ? "STOP" : "START",
                            style: TextStyle(
                              color:
                              isactive == true ? Primary_700 : Colors.grey,
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: _size.height * 0.02,),
            _countDownWidget(_size),
            SizedBox(
              height: _size.height * 0.1,
            ),



            //ummm connect
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: isactive == true
                      ? Primary_700
                      : Primary_700.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(

                  isactive == true ? "Connected" : "Not Connected",
                  style: TextStyle(
                    color:
                    isactive == true ? White : Primary_700,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                ),
              ),


            //select country
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryScreen()));
                },
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Neutral_100,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Select Location",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Primary_700),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Primary_700,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Neutral_100,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_downward,
                      color: Primary_700,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Download",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Primary_700),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        isactive == true ? "256kb" : "0,0kb",
                        style:
                        const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Neutral_100,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_upward,
                      color: Primary_700,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Upload",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Primary_700),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        isactive == true ? "128kb" : "0,0kb",
                        style:
                        const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _countDownWidget(Size size) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(_duration.inMinutes.remainder(60));
    final seconds = twoDigits(_duration.inSeconds.remainder(60));
    final hours = twoDigits(_duration.inHours.remainder(60));

    return Text(
      '$hours : $minutes : $seconds',
      style: TextStyle(
          color: isactive == true ? Primary_700 : Colors.grey,
          fontSize: 24
      ),
    );
  }

}

