import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';


class Expense_Transaction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Expense_Transaction();
}

class _Expense_Transaction extends State<Expense_Transaction> {
  var firstDate = DateTime.now();
  var lastDate = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);

  void _select_firstDate(BuildContext context) {
    showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.monthsPerYear),
      lastDate: DateTime(2030),
    ).then((picked) {
      if (picked != null) {
        setState(() {
          firstDate = picked;
        });
      }
    });
  }
  void _select_lastDate(BuildContext context) {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((picked) {
      if (picked != null) {
        setState(() {
          lastDate = picked;
        });
      }
    });
  }

  String? selected_timeDuration = "This week";
  final List<String> time_duration_option = [
    'Today',
    'This week',
    'This month',
    'This quarter',
    'This Financial Year',
    'Custom'
  ];

  void _showTimeSelectionModal(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height*0.48,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.grey.shade200,thickness: 1,),
              ListView.separated(
                shrinkWrap: true,
                itemCount: time_duration_option.length,
                separatorBuilder: (BuildContext context,int index){
                  return Divider(color: Colors.grey.shade200,thickness: 1,);
                },
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    title: Text(time_duration_option[index]),
                    trailing: selected_timeDuration == time_duration_option[index]
                        ? Icon(Icons.circle, color: Colors.blue, size: 12)
                        : null,
                    onTap: () {
                      setState(() {
                        selected_timeDuration = time_duration_option[index];
                      });
                      Navigator.pop(context);
                    },
                  );
                },
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
        surfaceTintColor: Color(0xFF0078AA),
        backgroundColor: Colors.white,
        bottom: Prefered_underline_appbar(),
        foregroundColor: Colors.black,
        title: Text('Expense Transaction', style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
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
              padding: EdgeInsets.all(8),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  GestureDetector(
                    onTap: (){
                      _showTimeSelectionModal(context);
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Text("${selected_timeDuration}"),
                          SizedBox(width: 5,),
                          Icon(Remix.arrow_down_s_line,color: Colors.blueAccent,),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                    child: VerticalDivider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Icon(Remix.calendar_2_line,color: Colors.blueAccent,size: 15,),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => _select_firstDate(context),
                    child: Text(
                      '${firstDate.day}/${firstDate.month}/${firstDate.year}',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'to',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(width: 4),
                  GestureDetector(
                    onTap: () => _select_lastDate(context),
                    child: Text(
                      '${lastDate.day}/${lastDate.month}/${lastDate.year}',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey,thickness: 0.8,),
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
                              child: Center(child: Text("Expense category - All Categories",style: TextStyle(fontSize: 11,color: Colors.black),))
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
                              child: Center(child: Text("Expense Type - All",style: TextStyle(fontSize: 11,color: Colors.black),))
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),

            SizedBox(height: 20,),
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
                                  Text("No of Txns"),
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
                                borderRadius: BorderRadius.circular(4),
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Total Sale"),
                                  Text("₹500.00"),
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
                                  Text("Balance Due"),
                                  Text(
                                    "₹ 47.50",
                                    style: TextStyle(color: Color(0xFFE03537)),
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
                                      "Petrol",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
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
                                SizedBox(height: 8),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Amount",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            "₹ 100.00",
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Balance",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            "₹ 50.00",
                                            style: TextStyle(
                                              fontSize: 14,
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

    List<String> txnTypes = ["Sale & Cr. Note", "Sale", "Credit Note", "Sale [Cancelled]"];
    List<String> parties = ["Party A", "Party B", "Party C", "Party D"];

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
                                buildFilterButton("By Txns Type", 0, selectedFilter, (index) {
                                  setState(() {
                                    selectedFilter = index;
                                    selectedTxnType = 0; // Reset selection when switching
                                  });
                                }),
                                buildFilterButton("By Party", 1, selectedFilter, (index) {
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
                            itemCount: selectedFilter == 0 ? txnTypes.length : parties.length,
                            itemBuilder: (context, index) {
                              bool isSelected = selectedTxnType == index;

                              return ListTile(
                                title: Text(
                                  selectedFilter == 0 ? txnTypes[index] : parties[index],
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

