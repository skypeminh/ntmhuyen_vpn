import 'package:flutter/material.dart';
import 'package:VPN_MHuyen/constants.dart';
import 'package:VPN_MHuyen/country/country.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: White),
        actionsIconTheme: const IconThemeData(color: White),

        title: const Text(
          "Country List",
          style: TextStyle(color: White),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [

            //search
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                  color: Neutral_100,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: TextFormField(
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    hintText: "Search",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(
              height: 16,
            ),
            Expanded(child: ListView.builder(

              itemCount: flaglist.length,
              itemBuilder: (context,index)=>Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: Neutral_100,
                    borderRadius: BorderRadius.circular(10)
                ),
                child:ListTile(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  leading: Image.asset(
                    flaglist[index].image,
                    height: 35,
                    width: 35,
                  ),
                  title: Text(
                    flaglist[index].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ) ,
            ),
              ),))

          ],
        ),
      ),

    );
  }
}
