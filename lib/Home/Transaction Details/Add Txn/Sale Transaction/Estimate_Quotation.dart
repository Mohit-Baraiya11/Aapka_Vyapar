import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:demo/Home/Transaction%20Details/Transaction%20Settings/txn_settings.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import 'Add_Items_to_Sale.dart';


class Estimate_Quotation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => EstimateQuotation();
}


class EstimateQuotation extends State<Estimate_Quotation> {
  var time = DateTime.now();

  var invoice_no = 0;
  String? selectedPaymentType = "Cash";
  String? Country = "Gujrat";
  // Selected state

  TextEditingController customer_contorller = TextEditingController();
  FocusNode customer_focusnode = FocusNode();
  bool is_customer_focused = false;

  TextEditingController total_amount_controller = TextEditingController();
  FocusNode total_amount_focus = FocusNode();
  bool is_total_focused = false;

  TextEditingController description_controller = TextEditingController();
  FocusNode description_focusnode = FocusNode();
  bool is_description_focused = false;


  bool isExpanded = true;


  @override
  void initState() {
    super.initState();
    customer_focusnode.addListener((){
      setState(() {
        is_customer_focused = customer_focusnode.hasFocus;
      });
    });

    total_amount_focus.addListener(() {
      setState(() {
        is_total_focused = total_amount_focus.hasFocus;
      });
    });

    description_focusnode.addListener((){
      setState(() {
        is_description_focused = description_focusnode.hasFocus;
      });
    });

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
        title: Text('Estimate/Quotation',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        bottom: Prefered_underline_appbar(),
        actions: [
          IconButton(
            icon: Icon(Remix.settings_2_line),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Transaction_Settings()));
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
        color:  Color(0xFFE8E8E8),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Container(
                        color:Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    showInvoiceSheet(context);
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Recipt No.",style: TextStyle(color: Colors.grey),),
                                      Row(
                                        children: [
                                          Text("$invoice_no"),
                                          SizedBox(width: 5,),
                                          Icon(
                                            Remix.arrow_down_s_line,
                                            size: 20,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                                child: VerticalDivider(
                                  color: Colors.grey.shade300,
                                  thickness: 2,
                                  width: 20,
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    showInvoiceSheet(context);
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
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
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Date",style: TextStyle(color: Colors.grey),),
                                            Row(
                                              children: [
                                                Text(
                                                  "${time.day}/${time.month}/${time.year}",
                                                  style: TextStyle(fontSize: 15),
                                                ),
                                                Icon(
                                                  Remix.arrow_down_s_line,
                                                  size: 20,
                                                  color: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          ],
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
                      SizedBox(height: 15,),

                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            SizedBox(height: 16),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                controller: customer_contorller,
                                focusNode: customer_focusnode,
                                decoration: InputDecoration(
                                  floatingLabelStyle: TextStyle(color: is_customer_focused?Colors.blueAccent:Colors.grey),
                                  labelText: "Customer Name *",
                                  labelStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // if (addedItems.isNotEmpty)
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Expand/Collapse Header
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Billed Items",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Icon(
                                      isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),

                            // Items List (Expandable)
                            if (isExpanded)
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 5,
                                      spreadRadius: 2,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Column(
                                    children: [
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: 1,
                                        itemBuilder: (context, index) {

                                          return GestureDetector(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                // Item Row with Delete Button
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text("#1 Maggie", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),),
                                                    Text("₹ 100",
                                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                                    IconButton(
                                                      icon: Icon(Icons.delete, color: Colors.red),
                                                      onPressed: () {
                                                        setState(() {
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 5),

                                                // Item Subtotal
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("Item Subtotal:", style: TextStyle(color: Colors.grey[600])),
                                                    Text(
                                                      "1 x 55 = ₹ 55",
                                                      style: TextStyle(color: Colors.grey[600]),
                                                    ),
                                                  ],
                                                ),

                                                SizedBox(height: 5),

                                                // Discount Row
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(
                                                        text: "Discount (%): ",
                                                        style: TextStyle(color: Colors.orange[700], fontSize: 14),
                                                        children: [
                                                          TextSpan(text: "5", style: TextStyle(fontWeight: FontWeight.bold),),
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      "₹ 25",
                                                      style: TextStyle(color: Colors.orange[700], fontWeight: FontWeight.bold),
                                                    ),
                                                  ],
                                                ),

                                                SizedBox(height: 5),

                                                // Tax Row
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("GST (18 %):", style: TextStyle(color: Colors.grey[600])),
                                                    Text(
                                                      "₹ 0",
                                                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                                                    ),
                                                  ],
                                                ),

                                                SizedBox(height: 10),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      Divider(color: Colors.grey[300]),

                                      // ✅ Total Calculation Section
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Total Discount: ₹ 0.0}"),
                                          Text("Total Tax: ₹ 0"),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Total Qty: 1"),
                                          Text(
                                            "Total Amount: ₹ 200",
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>Add_Items_to_Sale(title: "Add Items to Credit Note")));
                                },
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.grey),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add, color: Colors.blueAccent),
                                    SizedBox(width: 8),
                                    Text("Add Items", style: TextStyle(color: Colors.blueAccent)),
                                    SizedBox(width: 8),
                                    Text("(Optional)", style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                            ],
                          )
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 16,right: 16,top: 8),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "Total Price",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              SizedBox(
                                width: 15, // Fixed width for rupee symbol
                                child: Icon(Icons.currency_rupee, size: 15),
                              ),
                              Expanded(
                                flex: 1,
                                child: Stack(
                                  children: [
                                    // Dotted Border (Only Bottom)
                                    Positioned(
                                      bottom: 10,
                                      left: 0,
                                      right: 0,
                                      child: DottedBorder(
                                        color: is_total_focused?Colors.blueAccent:Colors.grey,
                                        strokeWidth: 1.5, // Border thickness
                                        dashPattern: [5, 3], // Dotted pattern
                                        borderType: BorderType.Rect, // Rectangle border
                                        padding: EdgeInsets.zero, // No padding inside
                                        customPath: (size) => Path()
                                          ..moveTo(0, size.height) // Start from bottom-left
                                          ..lineTo(size.width, size.height), // Draw to bottom-right
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: 0, // Invisible container to align with textfield
                                        ),
                                      ),
                                    ),
                                    TextField(
                                      controller: total_amount_controller,
                                      focusNode: total_amount_focus,
                                      onChanged: (value) {
                                        setState(() {
                                          total_amount_controller.text = value;
                                        });
                                      },
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.end,
                                      decoration: InputDecoration(
                                        border: InputBorder.none, // Removes default border
                                        contentPadding: EdgeInsets.only(bottom: 5), // Align text properly
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ),
                      SizedBox(height: 10,),

                      if (total_amount_controller.text != null && total_amount_controller.text.isNotEmpty)
                        Container(
                          padding: EdgeInsets.only(left: 16,right: 16,top: 16),
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("State", style: TextStyle(fontSize: 15, color: Colors.black)),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.white,
                                        context: context,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                        ),
                                        builder: (context) {
                                          return StatefulBuilder(
                                            builder: (context, setStateModal) {
                                              return Container(
                                                height: MediaQuery.of(context).size.height*0.80,
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Select State",
                                                            style: TextStyle(fontSize: 18),
                                                          ),
                                                          IconButton(
                                                            onPressed: (){
                                                              Navigator.pop(context);
                                                            },
                                                            icon: Icon(Remix.close_line),
                                                          )
                                                        ],
                                                      ),
                                                    ),

                                                    Divider(color: Colors.grey.shade200,thickness: 1,),
                                                    Expanded(
                                                      child: ListView(
                                                        children: [
                                                          for (var state in [
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
                                                            "Andaman and Nicobar Islands",
                                                            "Chandigarh",
                                                            "Dadra and Nagar Haveli and Daman and Diu",
                                                            "Delhi",
                                                            "Jammu and Kashmir",
                                                            "Ladakh",
                                                            "Lakshadweep",
                                                            "Puducherry"
                                                          ])
                                                            ListTile(
                                                              title: Text(state),
                                                              onTap: () {
                                                                setState(() {
                                                                  Country = state;
                                                                });
                                                                Navigator.pop(context);
                                                              },
                                                              tileColor: Country == state
                                                                  ? Colors.grey[200]
                                                                  : null,
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
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          Country ?? "Select", // Fallback if null
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Icon(Icons.arrow_drop_down, color: Colors.grey),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),


                      if (total_amount_controller.text != null && total_amount_controller.text.isNotEmpty)
                        Column(
                          children: [
                            Container(height: 20,color: Colors.white,),
                            SizedBox(height: 10,),
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
                            SizedBox(height: 10,),
                          ],
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
}


List<String> PrefixName = ["None"];
List<int> PrefixNumber = [0];

int _selectedButton = 0;
String? newPrefix;

void showInvoiceSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
              left: 2.0,
              right: 2.0,
              top: 10.0,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Change Receipt No.",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.cancel,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Invoice Prefix",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: PrefixName.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _selectedButton = index;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: index == _selectedButton
                                              ? Colors.redAccent
                                              : Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                        color: index == _selectedButton
                                            ? Colors.red[50]
                                            : Colors.transparent,
                                      ),
                                      child: Text(
                                        '${PrefixName[index]}',
                                        style: TextStyle(
                                          color: index == _selectedButton
                                              ? Colors.redAccent
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    'Add Prefix',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  backgroundColor: Colors.white,
                                  content: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: SizedBox(
                                      width: 600,
                                      child: TextField(
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          labelText: "Prefix Name",
                                          hintText: "e.g. INV",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                                color: Colors.blueAccent,
                                                width: 2.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 1.0),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          newPrefix = value;
                                        },
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(color: Colors.blueAccent),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        if (newPrefix != null &&
                                            newPrefix!.isNotEmpty) {
                                          setState(() {
                                            PrefixName.add(newPrefix!);
                                            newPrefix = null;
                                          });
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Text(
                                        "Save",
                                        style: TextStyle(color: Colors.blueAccent),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[50],
                            ),
                            child: Text(
                              'Add Prefix',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Invoice No",
                          hintText: "Invoice No",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                            BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                            BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                          ),
                          onPressed: () {
                            // Save logic
                          },
                          child: Text("SAVE"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
