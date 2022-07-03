import 'package:flutter/material.dart';
import '../Components/spacer.dart';

import '../../../../Data/Raw/raw_data.dart';
import '../../Data/SharedPreferences/home_page_shared_pref.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController nameController;
  late TextEditingController ageController;
  @override
  void initState() {
    nameController = TextEditingController();
    ageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  HomePageData homePageData = HomePageData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.00),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Storing data in shared pref as JSON'),
              const HeightSpacer(myHeight: 25.00),
              buildTextField(nameController, 'Your name'),
              const HeightSpacer(myHeight: 25.00),
              buildTextField(ageController, 'Your age'),
              const HeightSpacer(myHeight: 25.00),
              buildBtn()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String labelText) =>
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(5.5),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
          prefixIcon: const Icon(
            Icons.person,
            color: Colors.blue,
          ),
          filled: true,
          fillColor: Colors.blue[50],
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.blue),
        ),
      );

  Widget buildBtn() => ElevatedButton(
        onPressed: () async {
          await homePageData.saveJsonData(rawData);
          homePageData.getJsonData();
        },
        child: const Text('Save Data'),
      );
}
