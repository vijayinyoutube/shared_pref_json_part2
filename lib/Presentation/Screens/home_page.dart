import 'package:flutter/material.dart';

import '../../../../Data/Raw/raw_data.dart';
import '../../Data/SharedPreferences/home_page_shared_pref.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomePageData homePageData = HomePageData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await homePageData.saveJsonData(rawData);
            homePageData.getJsonData();
          },
          child: const Text('Save Data'),
        ),
      ),
    );
  }
}
