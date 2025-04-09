import 'package:demo/Home/Transaction%20Details/Transaction%20Settings/txn_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import '../../../Prefered_underline_appbar.dart';

class P2P_Transfer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => P2PTransfer();
}

class P2PTransfer extends State<P2P_Transfer> {
  var time = DateTime.now();

  final FocusNode _partyFieldFocusNode = FocusNode();
  final TextEditingController _partyController = TextEditingController();
  String searchQuery = "";
  List<Map<String, dynamic>> parties = [
    {"name": "Jayraj R. K.", "phone": "+919773222157", "balance": 200},
    {"name": "Mayur", "phone": "8536907412", "balance": -500},
    {"name": "Mohit", "phone": "7096395426", "balance": 1400},
  ];

  final FocusNode _partyFieldFocusNode_2 = FocusNode();
  final TextEditingController _partyController_2 = TextEditingController();
  String searchQuery_2 = "";
  List<Map<String, dynamic>> parties_2 = [
    {"name": "Jayraj R. K.", "phone": "+919773222157", "balance": 200},
    {"name": "Mayur", "phone": "8536907412", "balance": -500},
    {"name": "Mohit", "phone": "7096395426", "balance": 1400},
  ];

  int selectedIndex_payment = 0;
  late int selectedIndex_payment_2 = 1;

  TextEditingController description_controller = TextEditingController();
  FocusNode description_focusnode = FocusNode();
  bool is_description_focused = false;


  @override
  void initState() {
    super.initState();
    description_focusnode.addListener((){
      setState(() {
        is_description_focused = description_focusnode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _partyFieldFocusNode.dispose();
    _partyController.dispose();
    _partyFieldFocusNode_2.dispose();
    _partyController_2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade300,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
        title: Text('Party To Party Transfer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        bottom: Prefered_underline_appbar(),
        actions: [
          IconButton(
            icon: Icon(Remix.settings_2_line),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Transaction_Settings()));
            },
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  )
              ),
              child: Text("Save & New",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
            ),
          ),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  )
              ),
              child: Text("Save",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),),
            ),

          ),

          Expanded(
            child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    )
                ),
                child:Icon(Remix.share_forward_line,color: Colors.blueAccent,)
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        color: Color(0xFFE8E8E8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Picker Section
              Container(
                padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                child: GestureDetector(
                  onTap: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (selectedDate != null) {
                      setState(() {
                        time = selectedDate;
                      });
                    }
                  },
                  child: Row(
                    children: [
                      Text("Date: ", style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Text("${DateTime.now().toLocal()}".split(' ')[0], style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
          
              Container(
                padding: EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: TextField(
                        focusNode: _partyFieldFocusNode,
                        controller: _partyController,
                        decoration: InputDecoration(
                          hintText: "party",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          suffixIcon: Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[200],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Received Button
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex_payment = 0;
                                      selectedIndex_payment_2 = 1;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                                    constraints: BoxConstraints(minWidth: 60),
                                    decoration: BoxDecoration(
                                      color: selectedIndex_payment == 0 ? Colors.green : Colors.transparent,
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(30),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Received",
                                        style: TextStyle(
                                          color: selectedIndex_payment == 0 ? Colors.white : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Paid Button
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex_payment = 1;
                                      selectedIndex_payment_2 = 0;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                                    constraints: BoxConstraints(minWidth: 40),
                                    decoration: BoxDecoration(
                                      color: selectedIndex_payment == 1 ? Colors.deepOrange : Colors.transparent,
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(30),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Paid",
                                        style: TextStyle(
                                          color: selectedIndex_payment == 1 ? Colors.white : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: "Amount",
                                  hintText: "Amount",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          
              SizedBox(height: 20),
          
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: TextField(
                        focusNode: _partyFieldFocusNode_2,
                        controller: _partyController_2,
                        decoration: InputDecoration(
                          hintText: "Party*",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          suffixIcon: Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[200],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Received Button
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex_payment_2 = 0;
                                      selectedIndex_payment = 1;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                                    constraints: BoxConstraints(minWidth: 60),
                                    decoration: BoxDecoration(
                                      color: selectedIndex_payment_2 == 0 ? Colors.green : Colors.transparent,
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(30),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Received",
                                        style: TextStyle(
                                          color: selectedIndex_payment_2 == 0 ? Colors.white : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Paid Button
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex_payment_2 = 1;
                                      selectedIndex_payment = 0;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                                    constraints: BoxConstraints(minWidth: 40),
                                    decoration: BoxDecoration(
                                      color: selectedIndex_payment_2 == 1 ? Colors.deepOrange : Colors.transparent,
                                      borderRadius: BorderRadius.horizontal(
                                        right: Radius.circular(30),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Paid",
                                        style: TextStyle(
                                          color: selectedIndex_payment_2 == 1 ? Colors.white : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: "Amount",
                                  hintText: "Amount",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.white,
                child: SizedBox(
                  height:75,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          focusNode: description_focusnode,
                          controller: description_controller,
                          decoration: InputDecoration(
                            labelText: "Description",
                            hintText: 'Add Note',
                            floatingLabelStyle: TextStyle(color: is_description_focused?Colors.blueAccent:Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              borderSide: BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 16.0,
                            ),
                          ),
                          maxLines: 3, // Allows multi-line input
                        ),
                      ),
                      SizedBox(width: 10.0),
                      GestureDetector(
                        onTap:(){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      dense: true,
                                      visualDensity: VisualDensity.compact,
                                      title: Text("Camera"),
                                      onTap: () {
                                        Navigator.pop(context); // Close the dialog
                                      },
                                    ),
                                    Divider(),
                                    ListTile(
                                      dense: true,
                                      visualDensity: VisualDensity.compact,
                                      title: Text("Gallery"),
                                      onTap: () {
                                        Navigator.pop(context); // Close the dialog
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }, // Show the dialog on tap
                        child: Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 1.5),
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.grey[100],
                          ),
                          child: Icon(Remix.camera_line),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}