import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Party extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Party();
}

class _Party extends State<Party> {

  bool gstn_number = true;
  bool party_grouping = false;
  bool party_additional_field = true;
  bool party_shipping_address = false;
  bool invite_parties = true;
  bool Loyalty_points = false;


  bool is_search = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade300,
          statusBarIconBrightness: Brightness.light,
        ),
        title: is_search?
        TextField(
          decoration: InputDecoration(
            hintText: "search",
            border: InputBorder.none,
          ),
        ):
        Text("Party", style: TextStyle(color: Colors.black,fontSize: 20),),
        surfaceTintColor: Colors.blue.shade50,
        backgroundColor: Colors.blue.shade50,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          if(is_search==false)
            IconButton(
                onPressed: (){
                  setState(() {
                    is_search=true;
                  });
                },
                icon: Icon(Icons.search)
            ),

          if(is_search==true)
            IconButton(
                onPressed: (){
                  setState(() {
                    is_search=false;
                  });
                },
                icon: Icon(Icons.close)
            )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            buildSwitchTile("GSTIN Number", gstn_number, (val) {
              setState(() => gstn_number = val);
            }),
            buildSwitchTile("Party Grouping", party_grouping, (val) {
              setState(() => party_grouping = val);
            }),
            buildSwitchTile("Party Additional Fields", party_additional_field, (val) {
              setState(() => party_additional_field = val);
            }),
            buildSwitchTile("Party Shipping Address", party_shipping_address, (val) {
              setState(() => party_shipping_address = val);
            }),
            buildSwitchTile("Invite Parties to add themeselves", invite_parties, (val) {
              setState(() => invite_parties = val);
            }),
            buildSwitchTile("Loyalty Points", Loyalty_points, (val) {
              setState(() => Loyalty_points = val);
            }),
          ],
        ),
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      color: Colors.blue.shade50,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title)),

          if(value==true)
            GestureDetector(
              onTap: () => onChanged(false),
              child: Container(
                width: 50, // Increased width
                height: 30, // Increased height to fit the full circle
                child: Stack(
                  alignment: Alignment.centerLeft, // Ensures correct positioning
                  children: [
                    Container(
                      height: 15,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade200,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    Positioned(
                      top: 2, // Adjusted positioning to avoid cutting
                      left: 20, // Adjust this dynamically based on toggle state
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle, // More accurate way to create a circle
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          if(value==false)
            GestureDetector(
              onTap: () => onChanged(true),
              child: Container(
                width: 50, // Sufficient width
                height: 30, // Increased height to fully fit the circle
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    // Background Track
                    Container(
                      height: 15,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    // Toggle Circle
                    Positioned(
                      left: 0,
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )


          // Switch(
          //   value: value,
          //   onChanged: onChanged,
          //   activeColor: Colors.white,
          //   activeTrackColor: Colors.blue.shade300,
          //   inactiveThumbColor: Colors.white,
          //   inactiveTrackColor: Colors.grey.shade400,
          //   trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
          // ),

        ],
      ),
    );
  }

  Widget buildDropdownTile(String title, String selectedValue, List<String> options, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title)),
          DropdownButton<String>(
            value: selectedValue,
            onChanged: onChanged,
            underline: Container(),
            items: options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildListTile(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

}
