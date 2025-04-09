import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';


class Stock_Summary_Report extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Stock_Summary_Report();
}

class _Stock_Summary_Report extends State<Stock_Summary_Report> {
  bool show_stock_as_on_date = false;
  var firstDate = DateTime.now();

  void _select_firstDate(BuildContext context) async{
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            hintColor: Colors.blue,
            colorScheme: ColorScheme.light(primary: Colors.blue),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        firstDate = DateFormat("dd/MM/yyyy").format(pickedDate) as DateTime;
      });
    }
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
        elevation: 0,
        bottom: Prefered_underline_appbar(),
        foregroundColor: Colors.black,
        title: Text('Stock Summary Report', style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
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
            Container(
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                      activeColor: Colors.blueAccent,
                      value: show_stock_as_on_date,
                      onChanged: (val) {
                        setState(() {
                          show_stock_as_on_date=val!;
                        });
                      }
                  ),
                  Row(
                    children: [
                      Text("Show stock as on Date: "),
                      GestureDetector(
                        onTap: () => _select_firstDate(context),  // Open date picker on tap
                        child: Text(
                          "${firstDate.day}/${firstDate.month}/${firstDate.year}",
                          style: TextStyle(color: Colors.grey,),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey.shade200,thickness: 2,),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("No of Txns",style: TextStyle(fontSize: 12),),
                                  Text("4"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Low Stock Items",style: TextStyle(fontSize: 12),),
                                  Text("5",style: TextStyle(color: Color(0xFFE03537)),),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Stock Value",style: TextStyle(fontSize: 12),),
                                  Text(
                                    "₹ 47.50",
                                    style: TextStyle(color: Color(0xFF38C782)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Mohit",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(30),
                                        ),
                                      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                                      child: Text("GROCERY",style: TextStyle(fontSize: 13),),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Stock Value : ",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          "₹ 100.00",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 30,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Stock Qty : ",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          "50.00",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
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

