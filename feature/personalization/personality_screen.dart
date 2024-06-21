import 'package:ai_travel_planner/features/travel/screen/home/homescreen.dart';
import 'package:ai_travel_planner/navigationmenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TravelPreferencesScreen extends StatefulWidget {
  @override
  _TravelPreferencesScreenState createState() => _TravelPreferencesScreenState();
}

class _TravelPreferencesScreenState extends State<TravelPreferencesScreen> {
  String travelStyle = 'Adventurous';
  List<String> interests = [];
  String purposeOfTravel = "Leisure";
  bool travelingAlone = true;
  String companionDetails = '';
  double budget = 0.0;
  String accommodationType = 'Budget';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Preferences'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            buildDropdownField(
              title: 'Preferred Travel Style',
              value: travelStyle,
              items: ['Adventurous', 'Relaxed', 'Sociable', 'Solitary'],
              onChanged: (newValue) {
                setState(() {
                  travelStyle = newValue!;
                });
              },
            ),
            SizedBox(height: 20.0),
            buildInterestsSection(),
            SizedBox(height: 20.0),
            buildDropdownField(
              title: 'Purpose of Travel',
              value: purposeOfTravel,
              items: ['Leisure', 'Adventure', 'Cultural Immersion', 'Business'],
              onChanged: (newValue) {
                setState(() {
                  purposeOfTravel = newValue!;
                });
              },
            ),
            SizedBox(height: 20.0),
            // buildTravelingAloneSwitch(),
            // if (!travelingAlone) buildCompanionDetailsField(),
            SizedBox(height: 20.0),
            buildBudgetField(),
            SizedBox(height: 20.0),
            buildDropdownField(
              title: 'Accommodation Type',
              value: accommodationType,
              items: ['Budget', 'Mid-range', 'Luxury'],
              onChanged: (newValue) {
                setState(() {
                  accommodationType = newValue!;
                });
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: ()=> Get.to(NavigationMenu()),
              child: Text('Save Preferences'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdownField({
    required String title,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10.0),
        DropdownButtonFormField<String>(
          value: value,
          onChanged: onChanged,
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildInterestsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Your Interests:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10.0),
        buildCheckboxListTile('Historical Sites'),
        buildCheckboxListTile('Outdoor Adventures'),
        buildCheckboxListTile('Culinary Experiences'),
        buildCheckboxListTile('Cultural Events'),
      ],
    );
  }

  Widget buildCheckboxListTile(String title) {
    return CheckboxListTile(
      title: Text(title),
      value: interests.contains(title),
      onChanged: (value) {
        setState(() {
          if (value!)
            interests.add(title);
          else
            interests.remove(title);
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.teal,
    );
  }

  // Widget buildTravelingAloneSwitch() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Text(
  //         'Traveling Alone?',
  //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
  //       ),
  //       Switch(
  //         value: travelingAlone,
  //         onChanged: (value) {
  //           setState(() {
  //             travelingAlone = value;
  //           });
  //         },
  //         activeColor: Colors.teal,
  //       ),
  //     ],
  //   );
  // }
  //
  // Widget buildCompanionDetailsField() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       SizedBox(height: 10.0),
  //       TextFormField(
  //         onChanged: (value) {
  //           companionDetails = value;
  //         },
  //         decoration: InputDecoration(
  //           labelText: 'Details about Travel Companions',
  //           filled: true,
  //           fillColor: Colors.grey[200],
  //           contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
  //           border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(10.0),
  //             borderSide: BorderSide.none,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget buildBudgetField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Budget for the Trip:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10.0),
        TextFormField(
          onChanged: (value) {
            budget = double.tryParse(value) ?? 0.0;
          },
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            hintText: 'Enter your budget in USD',
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
