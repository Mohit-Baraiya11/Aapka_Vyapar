import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';

class Payment_Reminder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Payment_Reminder();
}

class _Payment_Reminder extends State<Payment_Reminder> {

  bool send_to_party = true;
  bool show_partys_current_balance = true;
  bool show_web_invoice_link = true;
  bool Sale = false;
  bool Purchase = false;
  bool Sale_Return = true;
  bool Purchase_Return = true;
  bool estimate = false;
  bool payment_in = true;
  bool payment_out = true;
  bool Sale_Order = true;
  bool Purchase_Order = false;
  bool Delivery_Challan = false;
  bool cencelled_invoice = true;

  bool is_search = false;

  int dueDaysThreshold = 1;
  String selectedReminderFrequency = "Once a Day";

  final List<String> reminderOptions = [
    "2 Times a day",
    "Every time on App open",
    "Once a Day",
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
        Text("Payment Reminder", style: TextStyle(color: Colors.black,fontSize: 20),),
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
            buildSwitchTile("Self Payment Reminder", send_to_party, (val) {
              setState(() => send_to_party = val);
            }),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text("Remind me for payment due more than"),
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Reminder Frequency",
                      style: TextStyle(fontWeight: FontWeight.w600),
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

            buildSectionHeader("Payment Reminder For party"),
            GestureDetector(
              onTap: () => showMessageDialog(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text("Remind me for payment due more than"),
                    ),
                    SizedBox(width: 30),
                    Icon(Remix.arrow_right_s_line),
                  ],
                ),
              ),
            ),


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
