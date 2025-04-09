import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';

class Item_Wise_Discount extends StatefulWidget {
  Item_Wise_Discount({super.key});

  @override
  State<Item_Wise_Discount> createState() => _Item_Wise_Discount();
}

class _Item_Wise_Discount extends State<Item_Wise_Discount> {
  var firstDate = DateTime.now();
  var lastDate = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);

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
  void _select_lastDate(BuildContext context) async{
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
        lastDate = DateFormat("dd/MM/yyyy").format(pickedDate) as DateTime;
      });
    }
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


  TextEditingController item_name_controller = TextEditingController();
  TextEditingController party_name_controller = TextEditingController();


  String _selectedSortBy = "Party name";


  @override
  void initState() {
    super.initState();
    item_name_controller.text = "All Items";
    party_name_controller.text = "All Categories";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFF00557D),
          statusBarIconBrightness: Brightness.light,
        ),
        surfaceTintColor: Color(0xFF0078AA),
        backgroundColor: Color(0xFF0078AA),
        title: Text("Item wise Discount",style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
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
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          // Date Range & Filters
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
                        Icon(Icons.arrow_drop_down,color: Colors.blueAccent,),
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
                SizedBox(width: 20,),
                Icon(Remix.calendar_2_line,color: Colors.blueAccent,size: 15,),
              ],
            ),
          ),

          // Category & Sort Options
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child:Row(
                    children: [
                      Text("Items Name",style: TextStyle(fontSize: 12,color:Color(0xFF0078AA)),),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: TextField(
                            style: TextStyle(fontSize: 12),
                            controller: item_name_controller,
                            decoration: InputDecoration(
                              border: InputBorder.none, // Adds only bottom border
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Row(
                    children: [
                      Text("Party Name",style: TextStyle(fontSize: 12,color:Color(0xFF0078AA)),),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DropdownButtonFormField<String>(
                              value: _selectedSortBy,
                              items: [
                                DropdownMenuItem(value: "Party name", child: Text("Party name", style: TextStyle(fontSize: 12))),
                                DropdownMenuItem(value: "Sale quantity", child: Text("Sale quantity", style: TextStyle(fontSize: 12))),
                                DropdownMenuItem(value: "Purchase quantity", child: Text("Purchase quantity", style: TextStyle(fontSize: 12))),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _selectedSortBy = value!;
                                });
                              },
                              icon: Icon(Icons.arrow_drop_down, color: Colors.black), // Custom Icon
                              isExpanded: true,
                              decoration: InputDecoration(
                                border: InputBorder.none, // Removes all borders
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                contentPadding: EdgeInsets.zero, // Adjusts padding if needed
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
          ),

          // Search Box
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0), // Adjust vertical padding
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center, // Ensure proper alignment
              children: [
                Text(
                  "Party Name",
                  style: TextStyle(fontSize: 12, color: Color(0xFF0078AA)),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Container(
                    height: 38, // Set fixed height to align properly
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent), // Remove border issue
                    ),
                    child: TextField(
                      style: TextStyle(fontSize: 12),
                      controller: party_name_controller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 8), // Adjust padding
                        suffixIcon: Icon(Remix.arrow_down_s_fill, size: 18), // Adjust icon size
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),


          // Table Rows
          Expanded(
            child: ListView.builder(
              itemCount: 1, // Sample data
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Item Name",style: TextStyle(fontSize: 13,color: Colors.grey),),
                              Text("Maggie",style: TextStyle(fontSize: 13),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total Sale Amt",style: TextStyle(fontSize: 13,color: Colors.grey),),
                              Text("₹ 90.00",style: TextStyle(fontSize: 13),),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Motal Disc.Amy",style: TextStyle(fontSize: 13,color: Colors.grey),),
                              Text("₹ 90.00",style: TextStyle(fontSize: 13,color: Color(0xFF38C782)),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Total Of Sold",style: TextStyle(fontSize: 13,color: Colors.grey),),
                                Text("1",style: TextStyle(fontSize: 13),),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Avg Disc(%)",style: TextStyle(fontSize: 13,color: Colors.grey),),
                                Text("5.0%",style: TextStyle(fontSize: 13),),
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
          ),

          // Footer
          Container(
            padding: EdgeInsets.all(15),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Summary",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ],
                ),
                Divider(),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Sale Amount",style: TextStyle(fontSize: 15),),
                    Text("₹ 9.50",style: TextStyle(fontSize: 15),)
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Discount Amount",style: TextStyle(fontSize: 15),),
                    Text("+₹ 9.50",style: TextStyle(fontSize: 15,color: Color(0xFF38C782)),)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

