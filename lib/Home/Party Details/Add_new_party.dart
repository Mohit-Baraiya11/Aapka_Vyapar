import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';


class Add_new_Party extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>AddnewParty();
}
class AddnewParty extends State<Add_new_Party>{

  TextEditingController enteredText = TextEditingController();
  String _selectedOption = 'To Receive';
  String selectedOption = "Unregistered/Consumer";
  String selectedState = "state";

  void _showGSTTypeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title Row with Close Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "GST Type",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Divider(),
              ListTile(
                title: Text("Unregistered/Consumer"),
                onTap: () {
                  setState(() {
                    selectedOption = "Unregistered/Consumer";
                  });
                  Navigator.pop(context); // Close the BottomSheet
                },
              ),
              ListTile(
                title: Text("Registered - Regular"),
                onTap: () {
                  setState(() {
                    selectedOption = "Registered - Regular";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Registered - Composite"),
                onTap: () {
                  setState(() {
                    selectedOption = "Registered - Composite";
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
  void _showStateSelectionBottomSheet(BuildContext context) {
    final List<String> statesOfIndia = [
      "Andhra Pradesh",
      "Arunachal Pradesh",
      "Assam",
      "Bihar",
      "Chhattisgarh",
      "Goa",
      "Gujarat",
      "Haryana",
      "Himachal Pradesh",
      "Jharkhand",
      "Karnataka",
      "Kerala",
      "Madhya Pradesh",
      "Maharashtra",
      "Manipur",
      "Meghalaya",
      "Mizoram",
      "Nagaland",
      "Odisha",
      "Punjab",
      "Rajasthan",
      "Sikkim",
      "Tamil Nadu",
      "Telangana",
      "Tripura",
      "Uttar Pradesh",
      "Uttarakhand",
      "West Bengal",
    ];

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title Row with Close Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select State",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: statesOfIndia.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(statesOfIndia[index]),
                      onTap: () {
                        setState(() {
                          selectedState = statesOfIndia[index];
                        });
                        Navigator.pop(context); // Close the BottomSheet
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade300,
          statusBarIconBrightness: Brightness.light,
        ),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        bottom: Prefered_underline_appbar(),
        title: Text('Party To Party Transfer',style: TextStyle(fontSize: 20),),
        actions: [
          IconButton(
            icon: Icon(Remix.settings_2_line),
            onPressed: () {

            },
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child:
              Text(
                "Delete",
                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(width: 10,),

          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                backgroundColor: Color(0xFFE03537),
              ),
              onPressed: () {
              },
              child:
              Text(
                "Save",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child:SingleChildScrollView(
          child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[

                    SizedBox(height: 10,),
                    SizedBox(
                      height: 50,
                      child: TextField(
                        controller:enteredText,
                        decoration: InputDecoration(
                          labelText: "Party Name",
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                      ),
                    ),


                    SizedBox(height: 16),
                    SizedBox(
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "GSTIN",
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                      ),
                    ),


                    SizedBox(height: 16),
                    Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Contact Number",
                              labelStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                              ),
                            ),
                          ),
                        ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: "Opening Bal.",
                                          labelStyle: TextStyle(color: Colors.grey),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(4.0),
                                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(4.0),
                                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(4.0),
                                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: SizedBox(
                                      height: 50,
                                      child: TextField(
                                        keyboardType: TextInputType.datetime,
                                        decoration: InputDecoration(
                                          labelText: "As of Date",
                                          labelStyle: TextStyle(color: Colors.grey),
                                          suffixIcon: Icon(Remix.calendar_2_line, color: Colors.blue,),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(4.0),
                                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(4.0),
                                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(4.0),
                                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Radio<String>(
                                        value: 'To Receive',
                                        activeColor: Colors.blue,
                                        groupValue: _selectedOption,
                                        onChanged: (String? value) {
                                          setState(() {
                                            _selectedOption = value!;
                                          });
                                        },
                                      ),
                                      Text('To Receive'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Radio<String>(
                                        value: 'To Pay',
                                        activeColor: Colors.blue,
                                        groupValue: _selectedOption,
                                        onChanged: (String? value) {
                                          setState(() {
                                            _selectedOption = value!;
                                          });
                                        },
                                      ),
                                      Text('To Pay'),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              DefaultTabController(
                                length: 2,
                                child: Column(
                                  children: [
                                    TabBar(
                                      indicator: UnderlineTabIndicator(
                                        borderSide: BorderSide(color: Colors.red, width: 3.0), // Thickness of the underline
                                        insets: EdgeInsets.symmetric(horizontal: -50.0), // Extend the width of the indicator
                                      ),
                                      indicatorColor: Colors.red,
                                      indicatorWeight: 2.0,
                                      labelColor: Colors.red,
                                      unselectedLabelColor: Colors.grey,
                                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                                      tabs: [
                                        Tab(text: 'Addresses'),
                                        Tab(text: 'GST Details'),
                                      ],
                                    ),
                                    Container(
                                      height: 200, // Specify a height for TabBarView
                                      child: TabBarView(
                                        children: [
                                          Center(
                                            child:Column(
                                              children: [
                                                SizedBox(height: 16),
                                                SizedBox(
                                                  height: 50,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      labelText: "Biiling Address",
                                                      labelStyle: TextStyle(color: Colors.grey),
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(4.0),
                                                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                                      ),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(4.0),
                                                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(4.0),
                                                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 16),
                                                TextField(
                                                  decoration: InputDecoration(
                                                    labelText: "Email Address",
                                                    labelStyle: TextStyle(color: Colors.grey),
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(4.0),
                                                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(4.0),
                                                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(4.0),
                                                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Center(
                                            child:Column(
                                              children: [
                                                SizedBox(height: 16),
                                                TextField(
                                                  readOnly: true, // Prevent keyboard from opening
                                                  controller: TextEditingController(text: selectedOption),
                                                  decoration: InputDecoration(
                                                    suffixIcon: Icon(Icons.arrow_drop_down),
                                                    labelText: "Select an Option",
                                                    border: OutlineInputBorder(),
                                                  ),
                                                  onTap: () {
                                                    _showGSTTypeBottomSheet(context); // Show the BottomSheet on tap
                                                  },
                                                ),
                     
                                                SizedBox(height: 16),
                                                TextField(
                                                  readOnly: true, // Prevent keyboard from opening
                                                  controller: TextEditingController(text: selectedState),
                                                  decoration: InputDecoration(
                                                    suffixIcon: Icon(Icons.arrow_drop_down),
                                                    labelText: "State",
                                                    border: OutlineInputBorder(),
                                                  ),
                                                  onTap: () {
                                                    _showStateSelectionBottomSheet(context);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
        ),
      ),
    );
  }
}