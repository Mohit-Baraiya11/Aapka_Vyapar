import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';

class Item_Detail_Report extends StatefulWidget {
  Item_Detail_Report({super.key});

  @override
  State<Item_Detail_Report> createState() => _Item_Detail_Report();
}

class _Item_Detail_Report extends State<Item_Detail_Report> {
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



  TextEditingController party_name_controller = TextEditingController();

  bool is_hide_inactive_dates = false;

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
        title: Text("Item Details Report",style: TextStyle(color: Colors.white),),
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
          Row(
            children: [
              Checkbox(
                  activeColor: Color(0xFF0078AA),
                  value: is_hide_inactive_dates,
                  onChanged: (value){
                    setState(() {
                      is_hide_inactive_dates = value!;
                    });
                  }
              ),
              Text("Hide Inactive dates",style: TextStyle(fontSize: 15),)
            ],
          ),


         Container(
           padding: EdgeInsets.symmetric(horizontal: 8),
           child: Row(
             children: [
               Text("Item Name",style: TextStyle(color:Color(0xFF0078AA))),
               SizedBox(width: 10,),
               Expanded(
                 child: TextField(
                   decoration: InputDecoration(
                     hintText: "Enter Name",
                     border: UnderlineInputBorder(),
                     focusedBorder: UnderlineInputBorder(
                       borderSide: BorderSide(color: Color(0xFF0078AA), width: 2.0),
                     ),
                   ),
                 ),
               ),
             ],
           ),
         ),


          // Table Header
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Text("Date", style: TextStyle(fontSize: 10))
                ),
                Expanded(child: Text("Sale qty", style: TextStyle(fontSize: 10))),
                Expanded(child: Text("Purchase qty", style: TextStyle(fontSize: 10))),
                Expanded(child: Text("Adjust qty", style: TextStyle(fontSize: 10))),
                Expanded(child: Text("Closing qty", style: TextStyle(fontSize: 10))),
              ],
            ),
          ),

          // Table Rows
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 2,
                              child: Text("${index}/03/2025", style: TextStyle(fontSize: 10))
                          ),
                          Expanded(child: Text("0.0", style: TextStyle(fontSize: 10))),
                          Expanded(child: Text("0.0", style: TextStyle(fontSize: 10))),
                          Expanded(child: Text("0.0", style: TextStyle(fontSize: 10))),
                          Expanded(child: Text("0.0", style: TextStyle(fontSize: 10))),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
