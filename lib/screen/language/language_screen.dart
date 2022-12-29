import 'package:flutter/material.dart';
import 'package:VPN_MHuyen/constants.dart';
import 'package:VPN_MHuyen/country/country.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  final List _langData = [
    {
        'src': "assets/country/england.png",
        'lang': "England",
    },
    {
      'src': 'assets/country/india.png',
      'lang': 'Hindi'
    },
    {
      'src': 'assets/country/russia.png',
      'lang': 'Russian'
    },
  ];

  bool _isGridView = true;

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
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
                onTap: () => setState(() => _isGridView = !_isGridView),
                child: _isGridView
                    ? const Icon(
                  Icons.view_list_outlined,
                  size: 26,
                )
                    : const Icon(
                  Icons.grid_view,
                  size: 24,
                )
            ),
          ),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 24),
        child: _isGridView ? _loadGridView() : _loadListView(),



    ),
    );
  }

  Widget _loadGridView() {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                      color: Primary_700.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Primary_700)
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/country/england.png",
                        height: 56,
                        width: 56,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text("English",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                      color: Neutral_100,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Neutral_300)
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/country/india.png",
                        height: 56,
                        width: 56,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text("Hindi",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                      color: Neutral_100,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Neutral_300)
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/country/russia.png",
                        height: 56,
                        width: 56,
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
              )
            ],
          ),
        ],
      );
  }

  Widget _loadListView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Expanded(child: ListView.builder(
        itemCount: _langData.length,
        itemBuilder: (context,index)=>Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: Neutral_100,
                borderRadius: BorderRadius.circular(10),
            ),
            child:ListTile(
              onTap: (){
                Navigator.pop(context);
              },
              leading: Image.asset(
                _langData[index]['src'],
                height: 35,
                width: 35,
              ),
              title: Text(
                _langData[index]['lang'],
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ) ,
          ),
        ),
      ),
      ),
    );

  }

}

