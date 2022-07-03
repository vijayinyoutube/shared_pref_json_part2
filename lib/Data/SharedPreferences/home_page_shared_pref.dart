import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/home_page_model.dart';
import '../Raw/raw_data.dart';

class HomePageData {
  Future saveJsonData(jsonData) async {
    final prefs = await SharedPreferences.getInstance();

    debugPrint('Raw data: $rawData');

    rawData.addEntries(jsonData.entries);
    debugPrint('Raw data: $rawData');

    var saveData = jsonEncode(rawData);
    await prefs.setString('jsonData', saveData);
  }

  Future<void> getJsonData() async {
    final prefs = await SharedPreferences.getInstance();
    var temp = prefs.getString('jsonData') ?? jsonEncode(defaultData);
    debugPrint('Data received: $temp');
    var data = HomePageModel.fromMap(jsonDecode(temp.toString()));
    debugPrint('Name: ${(data.name.toString())}');
    debugPrint('Age: ${(data.age.toString())}');
  }
}
