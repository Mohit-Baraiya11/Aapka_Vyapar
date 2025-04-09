import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import '../../../Home/Transaction Details/Add Txn/Sale Transaction/add_new_sales.dart';

class Sale_List extends StatefulWidget {
  const Sale_List({super.key});

  @override
  State<Sale_List> createState() => _Sale_ListState();
}

class _Sale_ListState extends State<Sale_List> {

  bool is_searchbar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade300,
          statusBarIconBrightness: Brightness.light,
        ),
        title: is_searchbar?
                   TextField(
                     decoration: InputDecoration(
                         hintText: "Search",
                         border:OutlineInputBorder(
                           borderSide: BorderSide.none,
                         )
                     ),
                   ):
                   Text("Sale List",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        bottom: Prefered_underline_appbar(),
        actions: [
          if(is_searchbar==false)
          Row(
            children: [
              IconButton(
                  onPressed: (){
                    setState(() {
                      is_searchbar = true;
                    });
                  },
                  icon: Icon(Remix.search_2_line)
              ),
              Container(
                height: 25,
                width: 25,
                child: Image.asset("Assets/Images/pdf.png"),
              ),
              SizedBox(width: 10,),
            ],
          ),
          if(is_searchbar==true)
            IconButton(
              onPressed: () {
                setState(() {
                  is_searchbar = false;
                });
              },
              icon: Icon(Icons.close),
            ),
        ],
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.center,
                            colors: [Colors.blue.shade200,Colors.blue.shade50]
                        )
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Total Sale",style: TextStyle(fontSize: 12,color: Colors.grey),),
                                      Text("₹ 500.00",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Mohit",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(width: 5,),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.orange.shade50,
                                                    borderRadius:
                                                    BorderRadius.circular(30),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 4),
                                                    child: Text(
                                                      "UNPAID",
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        color:Colors.orange,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "Sale #1",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Text(
                                                  "21 Jan, 25",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8),

                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Total : ",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                SizedBox(width: 10,),
                                                Text(
                                                  "₹ 500.00",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  right: 10.0),
                                              child: GestureDetector(
                                                onTap: (){},
                                                child: Icon(
                                                  Remix.printer_line,
                                                    color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Padding(
                                              padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.02),
                                              child: GestureDetector(
                                                  onTap: () {
                                                  double screenWidth = MediaQuery.of(context).size.width;
                                                  double screenHeight = MediaQuery.of(context).size.height;

                                                  showModalBottomSheet(
                                                    backgroundColor: Colors.white,
                                                    context: context,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                                    ),
                                                    builder: (context) {
                                                      return Container(
                                                        height: screenHeight * 0.25, // Responsive height
                                                        padding: EdgeInsets.symmetric(
                                                          horizontal: screenWidth * 0.04, // Responsive horizontal padding
                                                          vertical: screenHeight * 0.015, // Responsive vertical padding
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            // Share Transaction Header
                                                            Padding(
                                                              padding: EdgeInsets.only(bottom: screenHeight * 0.01),
                                                              child: Text(
                                                                "Share transaction",
                                                                style: TextStyle(
                                                                  fontSize: screenWidth * 0.045, // Responsive font size
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                            ),

                                                            // Row for Share as Image & Share as PDF
                                                            Row(
                                                              children: [
                                                                // Share as Image
                                                                Expanded(
                                                                  child: Padding(
                                                                    padding: EdgeInsets.all(screenWidth * 0.02),
                                                                    child: Container(
                                                                      decoration: BoxDecoration(
                                                                        color: Colors.red,
                                                                        borderRadius: BorderRadius.circular(4),
                                                                      ),
                                                                      padding: EdgeInsets.symmetric(
                                                                        horizontal: screenWidth * 0.04,
                                                                        vertical: screenHeight * 0.015,
                                                                      ),
                                                                      child: Row(
                                                                        children: [
                                                                          Container(
                                                                            height: screenHeight * 0.04,
                                                                            width: screenHeight * 0.04,
                                                                            decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.circular(90),
                                                                            ),
                                                                            child: Icon(
                                                                              Remix.image_line,
                                                                              color: Colors.red,
                                                                              size: screenWidth * 0.06, // Responsive icon size
                                                                            ),
                                                                          ),
                                                                          SizedBox(width: screenWidth * 0.02),
                                                                          Flexible(
                                                                            child: Text(
                                                                              "Share as Image",
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: screenWidth * 0.035,
                                                                              ),
                                                                              overflow: TextOverflow.ellipsis,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),

                                                                // Share as PDF
                                                                Expanded(
                                                                  child: Padding(
                                                                    padding: EdgeInsets.all(screenWidth * 0.02),
                                                                    child: Container(
                                                                      decoration: BoxDecoration(
                                                                        color: Colors.blue[50],
                                                                        borderRadius: BorderRadius.circular(4),
                                                                      ),
                                                                      padding: EdgeInsets.symmetric(
                                                                        horizontal: screenWidth * 0.04,
                                                                        vertical: screenHeight * 0.015,
                                                                      ),
                                                                      child: Row(
                                                                        children: [
                                                                          Container(
                                                                            height: screenHeight * 0.04,
                                                                            width: screenHeight * 0.04,
                                                                            decoration: BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.circular(90),
                                                                            ),
                                                                            child: Icon(
                                                                              Remix.file_pdf_2_line,
                                                                              color: Colors.grey,
                                                                              size: screenWidth * 0.06,
                                                                            ),
                                                                          ),
                                                                          SizedBox(width: screenWidth * 0.02),
                                                                          Flexible(
                                                                            child: Text(
                                                                              "Share as PDF",
                                                                              style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontSize: screenWidth * 0.035,
                                                                              ),
                                                                              overflow: TextOverflow.ellipsis,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),

                                                            // Checkbox Row for Default Selection
                                                            Padding(
                                                              padding: EdgeInsets.only(top: screenHeight * 0.015),
                                                              child: Row(
                                                                children: [
                                                                  Checkbox(
                                                                    value: false,
                                                                    onChanged: (bool? value) {},
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text(
                                                                        "Make this as default",
                                                                        style: TextStyle(fontSize: screenWidth * 0.04),
                                                                      ),
                                                                      Text(
                                                                        "To change later go to transaction settings*",
                                                                        style: TextStyle(
                                                                          fontSize: screenWidth * 0.03,
                                                                          color: Colors.grey,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                  child: Icon(
                                                    Remix.share_forward_line,
                                                  color: Colors.grey,
                                                  size: MediaQuery.of(context).size.width * 0.06, // Responsive icon size
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            GestureDetector(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                    backgroundColor: Colors.white,
                                                    context: context,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                                    ),
                                                    builder: (context) {
                                                      return Container(
                                                        height: MediaQuery.of(context).size.height * 0.25,
                                                        child: Column(
                                                          children: [
                                                            // Header with "More Options" and Close Button
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "More Options",
                                                                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                                                  ),
                                                                  IconButton(
                                                                    onPressed: () {
                                                                      Navigator.pop(context); // Close the bottom sheet
                                                                    },
                                                                    icon: Icon(Icons.close),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Divider(height: 1, thickness: 0.5),
                                                            ListTile(
                                                              title: Text("Duplicate"),
                                                              onTap: () {
                                                                Navigator.pop(context);
                                                              },
                                                            ),
                                                            Divider(height: 1, thickness: 0.5),
                                                            ListTile(
                                                              title: Text("Delete"),
                                                              onTap: () {
                                                                Navigator.pop(context);
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child:Icon(Remix.more_2_line)
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(14),
                    backgroundColor: Color(0xFFE03537),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_new_Sales()));
                  },
                  child:Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Remix.add_line,color: Colors.white,size: 20,),
                      const SizedBox(width: 8),
                      Text(
                        "Add Sale",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
