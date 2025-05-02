import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';

class ItemSetting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ItemSetting();
}

class _ItemSetting extends State<ItemSetting> {

  bool enable_item = true;
  bool barcode_scanning_for_items = false;
  bool stock_maintenance = true;
  bool item_units = false;
  bool item_category =true;
  bool item_wise_tax = true;
  bool item_wise_discount = true;
  bool update_sale_price_from_txn = false;
  bool description = true;
  bool hsn_sac_code = true;
  bool additional_cess = true;
  bool is_search = false;

  int dueDaysThreshold = 1;
  String selectedReminderFrequency = "Product and Services";

  final List<String> reminderOptions = [
    "Product",
    "Services",
    "Product and Services",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFF00557D),
          statusBarIconBrightness: Brightness.light,
        ),
        title: is_search?
        TextField(
          decoration: InputDecoration(
            hintText: "search",
            border: InputBorder.none,
          ),
        ):
        Text("Item", style: TextStyle(color: Colors.black,fontSize: 20),),
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
            buildSwitchTile("Enable Item", enable_item, (val) {
              setState(() => enable_item = val);
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Product and Services",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                  DropdownButton<String>(
                    value: selectedReminderFrequency,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedReminderFrequency = newValue!;
                      });
                    },
                    items: reminderOptions.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    underline: SizedBox(), // removes underline
                    icon: Icon(Icons.arrow_drop_down),
                    elevation: 2,
                  ),
                ],
              ),
            ),

            buildSwitchTile("Barcode scanning for items", barcode_scanning_for_items, (val) {
              setState(() => barcode_scanning_for_items = val);
            }),
            buildSwitchTile("Stock maintanance", stock_maintenance, (val) {
              setState(() => stock_maintenance = val);
            }),
            buildSwitchTile("Item Units", item_units, (val) {
              setState(() => item_units = val);
            }),
            buildSwitchTile("Item Category", item_category, (val) {
              setState(() => item_category = val);
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text("Quantity(Upto Decimal places)"),
                  ),
                  SizedBox(width: 30,),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (dueDaysThreshold > 0) dueDaysThreshold--;
                          });
                        },
                      ),
                      Text(
                        "$dueDaysThreshold",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            dueDaysThreshold++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            buildSwitchTile("Item wise Tax", item_wise_tax, (val) {
              setState(() => item_wise_discount = val);
            }),
            buildSwitchTile("Item wise discount", item_wise_discount, (val) {
              setState(() => item_wise_discount = val);
            }),

            buildSwitchTile("Update Sale price from TXN", update_sale_price_from_txn, (val) {
              setState(() => update_sale_price_from_txn = val);
            }),
            buildSwitchTile("Description", description, (val) {
              setState(() => description = val);
            }),
            buildSectionHeader("GST"),
            buildSwitchTile("HSN/SAC Code", hsn_sac_code, (val) {
              setState(() => hsn_sac_code = val);
            }),
            buildSwitchTile("Additional CESS", additional_cess, (val) {
              setState(() => additional_cess = val);
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

  void showMessageDialog(BuildContext context) {
    TextEditingController additionalMessageController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
            color: Color(0xFF00557D),
            padding: EdgeInsets.all(8),
            child: Text(
              "Your message",
              style: TextStyle(color: Colors.white),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Hi,\nIt's a friendly reminder to you for paying <balance amount> to me."),
              ),
              TextField(
                controller: additionalMessageController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Type Additional Message",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Handle default message logic
                Navigator.of(context).pop();
              },
              child: Text("SET DEFAULT",style: TextStyle(color: Colors.black,fontSize: 11),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cancel
              },
              child: Text("CANCEL",style: TextStyle(color: Colors.black,fontSize: 11),),
            ),
            ElevatedButton(
              onPressed: () {
                String finalMessage = additionalMessageController.text;
                // Save or send logic
                Navigator.of(context).pop();
              },
              child: Text("SAVE",style: TextStyle(color: Colors.black,fontSize: 11),),
            ),
          ],
        );
      },
    );
  }
}
