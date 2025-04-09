import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';


class Low_Stock_Summary extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Low_Stock_Summary();
}

class _Low_Stock_Summary extends State<Low_Stock_Summary> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade300,
          statusBarIconBrightness: Brightness.light,
        ),
        surfaceTintColor: Color(0xFF0078AA),
        backgroundColor: Colors.white,
        bottom: Prefered_underline_appbar(),
        foregroundColor: Colors.black,
        title: Text('Low Stock Summary',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        actions: [
          Container(
            height: 25,
            width: 25,
            child: Image.asset("Assets/Images/pdf.png"),
          ),
          SizedBox(width: 10,),
          Container(
            height: 25,
            width: 25,
            child: Image.asset("Assets/Images/xls.png"),
          ),
          SizedBox(width: 10,),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text("Filters Applied :")
                      ),
                      SizedBox(
                        height: 30,
                        child: GestureDetector(
                          onTap: (){
                            showFilter(context,0);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: Colors.grey.shade400,width: 1)
                            ),
                            child: Row(
                              children: [
                                Icon(Remix.filter_2_line,color: Colors.blueAccent,size: 15,),
                                Text("Filters",textAlign: TextAlign.center,style: TextStyle(fontSize: 13,color: Colors.black),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.grey.shade100,
                              ),
                              onPressed: (){
                                showFilter(context,0);
                              },
                              child: Center(child: Text("Item Category - All",style: TextStyle(fontSize: 11,color: Colors.black),))
                          ),
                        ),
                        SizedBox(width: 10,),
                        SizedBox(
                          height: 30,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.grey.shade100,
                              ),
                              onPressed: (){
                                showFilter(context,1);
                              },
                              child: Center(child: Text("Stock-All",style: TextStyle(fontSize: 11,color: Colors.black),))
                          ),
                        ),
                        SizedBox(width: 10,),
                        SizedBox(
                          height: 30,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.grey.shade100,
                              ),
                              onPressed: (){
                                showFilter(context,2);
                              },
                              child: Center(child: Text("Status-All",style: TextStyle(fontSize: 11,color: Colors.black),))
                          ),
                        ),

                      ],
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 10,),


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
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Low Stock Items",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                Text("1",style: TextStyle(color: Color(0xFFE03537)),),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Stock Value",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                Text("₹ 300.00",style: TextStyle(fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Maggie",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                            Container(
                                              padding: EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius: BorderRadius.circular(30),
                                              ),
                                              child: Text("GROCERY",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12),),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.55,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text("Stock Value :",style: TextStyle(fontSize: 13)),
                                                  Text("₹ 0.00",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text("Stock Qty :",style: TextStyle(fontSize: 13)),
                                                  Text(" 1.0",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13),),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void showFilter(BuildContext context,int index) {
    int selectedFilter = index;
    int selectedTxnType = 0;

    List<String> by_item_Category = ["All","Uncategorized","Grocery","Electronic"];
    List<String> by_stock = ["All","In-Stock Items","Low Stock Items"];
    List<String> by_status = ["All","Active","In-Active"];


    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Filters", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.close, size: 25),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey.shade300, thickness: 1),

                  // Filter Row
                  Expanded(
                    child: Row(
                      children: [
                        // Sidebar Menu
                        Container(
                          width: 140,
                          color: Colors.grey.shade200,
                          child: Column(
                              children: [
                                buildFilterButton("By Item Category", 0, selectedFilter, (index) {
                                  setState(() {
                                    selectedFilter = index;
                                    selectedTxnType = 0; // Reset selection when switching
                                  });
                                }),
                                buildFilterButton("By Stock", 1, selectedFilter, (index) {
                                  setState(() {
                                    selectedFilter = index;
                                    selectedTxnType = 0; // Reset selection when switching
                                  });
                                }),
                                buildFilterButton("By Status", 2, selectedFilter, (index) {
                                  setState(() {
                                    selectedFilter = index;
                                    selectedTxnType = 0; // Reset selection when switching
                                  });
                                }),
                              ]
                          ),
                        ),
                        // Filtered List
                        Expanded(
                          child: ListView.builder(
                            itemCount: selectedFilter == 0
                                ? by_item_Category.length
                                : selectedFilter == 1
                                ? by_stock.length
                                : by_status.length,
                            itemBuilder: (context, index) {
                              bool isSelected = selectedTxnType == index;
                              String itemText = selectedFilter == 0
                                  ? by_item_Category[index]
                                  : selectedFilter == 1
                                  ? by_stock[index]
                                  : by_status[index];

                              return ListTile(
                                title: Text(
                                  itemText,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                trailing: isSelected
                                    ? Icon(Icons.radio_button_checked, color: Colors.blue)
                                    : Icon(Icons.radio_button_off, color: Colors.grey),
                                onTap: () {
                                  setState(() => selectedTxnType = index);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Footer Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade200,
                            ),
                            onPressed: () {
                              setState(() => selectedTxnType = 0);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              child: Text("Reset", style: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFE03537),
                            ),
                            onPressed: () {
                              Navigator.pop(context); // Apply and close
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              child: Text("Apply", style: TextStyle(color: Colors.white)),
                            ),
                          ),
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
    );
  }

// Helper function to build sidebar filter buttons
  Widget buildFilterButton(String title, int index, int selectedFilter, Function(int) onTap) {
    return InkWell(
      onTap: () => onTap(index),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 18,vertical: 15),
        width: double.infinity,
        color: selectedFilter == index ? Colors.white : Colors.grey.shade200,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: selectedFilter == index ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}