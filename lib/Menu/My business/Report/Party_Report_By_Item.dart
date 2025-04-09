import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';

class Party_Report_By_Item extends StatefulWidget {
   Party_Report_By_Item({super.key});

  @override
  State<Party_Report_By_Item> createState() => _Party_Report_By_Item();
}

class _Party_Report_By_Item extends State<Party_Report_By_Item> {
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

  String _selectedCategory = "All Categories";
  String _selectedSortBy = "Party name";


  TextEditingController item_name_controller = TextEditingController();
  FocusNode item_name_focusenode = FocusNode();
  bool is_item_name_focused = false;

  @override
  void initState() {
    super.initState();

    item_name_controller.text = "All Items";
    item_name_focusenode.addListener(() {
      setState(() {
        is_item_name_focused = item_name_focusenode.hasFocus;
      });
    });
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
        title: Text("Party Report By Item",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
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
      backgroundColor: Colors.white,
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
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Category", style: TextStyle(color: Color(0xFF0078AA))),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedCategory,
                            items: [
                              DropdownMenuItem(value: "All Categories", child: Text("All Categories")),
                              DropdownMenuItem(value: "Uncategorized", child: Text("Uncategorized")),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _selectedCategory = value!;
                              });
                            },
                            icon: Icon(Remix.arrow_down_s_fill, color: Colors.black), // Change icon
                            isExpanded: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10), // Space between the two dropdowns
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sort by", style: TextStyle(color: Color(0xFF0078AA))),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedSortBy,
                            items: [
                              DropdownMenuItem(value: "Party name", child: Text("Party name")),
                              DropdownMenuItem(value: "Sale quantity", child: Text("Sale quantity")),
                              DropdownMenuItem(value: "Purchase quantity", child: Text("Purchase quantity")),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _selectedSortBy = value!;
                              });
                            },
                            icon:Icon(Remix.arrow_down_s_fill, color: Colors.black), // Custom Icon
                            isExpanded: true,
                          ),
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
            padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
            color: Colors.white,
            child: TextField(
              controller: item_name_controller,
              focusNode: item_name_focusenode,
              decoration: InputDecoration(
                labelText: "Enter Item Name",
                floatingLabelStyle: TextStyle(color: is_item_name_focused?Color(0xFF00897B):Colors.grey),
                border: UnderlineInputBorder(), // Adds only bottom border
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey), // Customize border color
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF00897B), width: 2.0), // Active border color
                ),
              ),
            ),
          ),


          // Table Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            color: Colors.blue[50],
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Party Name", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Sale Qty", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Purchase Qty", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          // Table Rows
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Sample data
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Mohit"),
                          Text("50"),
                          Text("0.0"),
                        ],
                      ),
                    ),
                    Divider(height: 1, color: Colors.grey.shade200),
                  ],
                );
              },
            ),
          ),

          // Footer
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            color: Colors.white,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("50.0", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("0.0", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
