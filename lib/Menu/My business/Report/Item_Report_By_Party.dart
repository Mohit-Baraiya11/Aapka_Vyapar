import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';

class Item_Report_By_Party extends StatefulWidget {
  Item_Report_By_Party({super.key});

  @override
  State<Item_Report_By_Party> createState() => _Item_Report_By_Party();
}

class _Item_Report_By_Party extends State<Item_Report_By_Party> {
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

  String _selectedSortBy = "Party name";


  TextEditingController party_name_controller = TextEditingController();


  @override
  void initState() {
    super.initState();
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
        title: Text("Item Report By Party",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
        iconTheme: IconThemeData(color: Colors.white,),
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
                  child:Container(
                    color: Colors.white,
                    child: TextField(
                      controller: party_name_controller,
                      decoration: InputDecoration(
                        labelText: "Party Name",
                        floatingLabelStyle: TextStyle(color: Color(0xFF0078AA)),
                        border: UnderlineInputBorder(), // Adds only bottom border
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey), // Customize border color
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF0078AA), width: 2.0), // Active border color
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Sort by",
                          labelStyle: TextStyle(color: Color(0xFF0078AA)),
                          border: InputBorder.none,
                        ),
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
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black), // Custom Icon
                        isExpanded: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Search Box


          // Table Header
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Party Name", style: TextStyle(fontSize: 13)),
                Text("Sale Qty", style: TextStyle(fontSize: 13)),
                Text("Purchase Qty", style: TextStyle(fontSize: 13)),
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
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Maggie"),
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
