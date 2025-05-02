import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';

class Taxes_and_Gst extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Taxes_and_Gst();
}

class _Taxes_and_Gst extends State<Taxes_and_Gst> {

  bool tax_list = false;
  bool gst = true;
  bool hsn_sac_code = true;
  bool additional_cess = false;
  bool reverse_change = false;
  bool state_of_supply = true;
  bool e_way_bill_no = false;
  bool composite_scheme = false;

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
        Text("General", style: TextStyle(color: Colors.black,fontSize: 20),),
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
            buildSwitchTile("Tax List", tax_list, (val) {
              setState(() => tax_list = val);
            }),

            buildSwitchTile("GST", gst, (val) {
              setState(() => gst = val);
            }),
            buildSwitchTile("HSN/SAC Code", hsn_sac_code, (val) {
              setState(() => hsn_sac_code = val);
            }),
            buildSwitchTile("Additional CESS", additional_cess, (val) {
              setState(() => additional_cess = val);
            }),
            buildSwitchTile("Reverse Change", reverse_change, (val) {
              setState(() => reverse_change = val);
            }),

            buildSwitchTile("State of Supply", state_of_supply, (val) {
              setState(() => state_of_supply = val);
            }),
            buildSwitchTile("E Way Bill No.", e_way_bill_no, (val) {
              setState(() => e_way_bill_no = val);
            }),
            buildSwitchTile("Composite Scheme", composite_scheme, (val) {
              setState(() => composite_scheme = val);
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
