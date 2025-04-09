

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import '../Home.dart';
import '../Sale_Report.dart';
import 'Add Txn/Other Transaction/Expenses.dart';
import 'Add Txn/Other Transaction/p2p_transfer.dart';
import 'Add Txn/Purchase Transaction/Payment_Out.dart';
import 'Add Txn/Purchase Transaction/Purchase_Order.dart';
import 'Add Txn/Purchase Transaction/Purchase_Return.dart';
import 'Add Txn/Purchase Transaction/purchase.dart';
import 'Add Txn/Sale Transaction/Delivery_Challan.dart';
import 'Add Txn/Sale Transaction/Estimate_Quotation.dart';
import 'Add Txn/Sale Transaction/Sale_Order.dart';
import 'Add Txn/Sale Transaction/Sale_Return.dart';
import 'Add Txn/Sale Transaction/add_new_sales.dart';
import 'Add Txn/Sale Transaction/payment-in.dart';
import 'Show All/all_transaction.dart';
import 'Show All/bank_account.dart';
import 'Show All/day_book.dart';
import 'Show All/profit&loss.dart';
import 'Transaction Settings/txn_settings.dart';

class TransactionDetailsTab extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _TransactionDetailsTab();
}
class _TransactionDetailsTab extends State<TransactionDetailsTab> {
  final Map<String, bool> filterOptions = {
    "Sale": false,
    "Sale Order": false,
    "Credit Note": false,
    "Purchase": false,
    "Purchase Order": false,
    "Debit Note": false,
    "Payment-In": false,
    "Payment-Out": false,
    "Estimate/Quotation": false,
    "Expense": false,
    "Delivery Challan": false,
    "Party To Party [Rcvd]": false,
    "Party To Party [Paid]": false,
    "Sale FA": false,
    "Purchase FA": false,
    "Sale [Cancelled]": false,
    "Job Work Out (Challan)": false,
    "Purchase (Job work)": false,
  };
  @override
  Widget build(BuildContext context) {
    var value = 0;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body:Container(
        color: Colors.blue.shade50,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    // Quick Links Section
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 35, bottom: 7),
                              child: Text(
                                "Quick Links",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              QuickLink(
                                icon: Remix.file_add_line,
                                backgroundColor: Colors.redAccent,
                                label: "Add Txn",
                                onTap: () {
                                  pop_up_modal(context);
                                },
                              ),
                              QuickLink(
                                icon: Remix.file_chart_line,
                                label: "Sale Report",
                                backgroundColor: Colors.lightBlue,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Sale_Report()),
                                  );
                                },
                              ),
                              QuickLink(
                                icon: Remix.settings_2_line,
                                label: "Txn Settings",
                                backgroundColor: Colors.lightBlue,
                                iconColor: Colors.red,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Transaction_Settings()),
                                  );
                                },
                              ),
                              QuickLink(
                                icon: Remix.arrow_right_circle_line,
                                label: "Show All",
                                backgroundColor: Colors.lightBlue,
                                onTap: () {
                                  ShowAll(context);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),

                    // Search Bar
                    if (value != 1)
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Search for transaction",
                                  hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                                  prefixIcon: Icon(
                                    Remix.search_line,
                                    color: Colors.blue,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        backgroundColor: Colors.white,
                                        isScrollControlled: true,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                        ),
                                        builder: (context) {
                                          return Container(
                                            child: FractionallySizedBox(
                                              heightFactor: 0.85,
                                              child: StatefulBuilder(
                                                builder: (context, setModalState) {
                                                  return Stack(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Text(
                                                                  "Filter By",
                                                                  style: TextStyle(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontSize: 22,
                                                                  ),
                                                                ),
                                                                IconButton(
                                                                  onPressed: () {
                                                                    Navigator.pop(context);
                                                                  },
                                                                  icon: Icon(Icons.close),
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(),
                                                            Expanded(
                                                              child: ListView(
                                                                children: filterOptions.keys.map((filter) {
                                                                  return CheckboxListTile(
                                                                    title: Text(filter),
                                                                    value: filterOptions[filter],
                                                                    onChanged: (bool? value) {
                                                                      setModalState(() {
                                                                        filterOptions[filter] = value!;
                                                                      });
                                                                    },
                                                                  );
                                                                }).toList(),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Positioned(
                                                        bottom: 16,
                                                        left: 16,
                                                        right: 16,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: ElevatedButton(
                                                                style: ElevatedButton.styleFrom(
                                                                  backgroundColor: Colors.grey.shade200,
                                                                  minimumSize: Size(120, 48),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(90),
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  setModalState(() {
                                                                    filterOptions.updateAll((key, value) => false);
                                                                  });
                                                                },
                                                                child: Text(
                                                                  "Clear",
                                                                  style: TextStyle(color: Colors.black),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(width: 10),
                                                            Expanded(
                                                              child: ElevatedButton(
                                                                style: ElevatedButton.styleFrom(
                                                                  backgroundColor: Colors.red,
                                                                  minimumSize: Size(120, 48),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(90),
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.pop(context);
                                                                },
                                                                child: Text(
                                                                  "Apply",
                                                                  style: TextStyle(color: Colors.white),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(Remix.filter_2_line, color: Colors.blue),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    SizedBox(height: 10),

                    // Transactions List Section
                    value == 1
                        ? Column(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset("Assets/Images/note.png"),
                        ),
                        const Text(
                          "Hey! You have not added any transactions yet.\nAdd your first transaction now.",
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                      ],
                    )
                        : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                                        fontSize: 15,
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
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFC0F1E1),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                                    child: Text(
                                      "Payment-in",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Color(0xFF38C782),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Total",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "₹ 500.00",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Unused",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "₹ 500.00",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 9),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.3,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            child: Icon(
                                              Remix.printer_line,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          GestureDetector(
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
                                                    height: screenHeight * 0.25,
                                                    padding: EdgeInsets.symmetric(
                                                      horizontal: screenWidth * 0.04,
                                                      vertical: screenHeight * 0.015,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets.only(bottom: screenHeight * 0.01),
                                                          child: Text(
                                                            "Share transaction",
                                                            style: TextStyle(
                                                              fontSize: screenWidth * 0.045,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
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
                                                                          size: screenWidth * 0.06,
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
                                              size: MediaQuery.of(context).size.width * 0.06,
                                            ),
                                          ),
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
                                                    height: screenHeight * 0.25,
                                                    child: Column(
                                                      children: [
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
                                                                  Navigator.pop(context);
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
                                            child: Icon(Remix.more_2_line),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 80), // Add padding at bottom to prevent overlap with button
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 14,vertical: 12),
                    backgroundColor: Color(0xFFE03537),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Add_new_Sales()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Remix.money_rupee_circle_line, color: Colors.white, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        "Add New Sale",
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
var iconOf_moreOption = [
  Remix.bank_line,
  Remix.book_open_line,
  Remix.sticky_note_line,
  Remix.arrow_up_down_line,
  Remix.printer_line,
  Remix.chat_settings_line,
];
var labelOf_moreOption = [
  "Bank Accounts",
  "Day Book",
  "All Txns Report",
  "Profit & Loss",
  "Print Settings",
  "Txn SMS Settings"
];

void ShowAll(BuildContext context)
{
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        color: Colors.white,
        child: FractionallySizedBox(
          heightFactor: 0.3,
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "More Options",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(Remix.close_line,size: 25,),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          if(index==0){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Bank_Account()));
                          }
                          if(index==1){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Day_Book()));
                          }
                          if(index==2){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>All_Transaction()));
                          }
                          if(index==3){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Profit_and_loss()));
                          }
                        },
                        child: QuickLink(
                          icon: iconOf_moreOption[index],
                          label: labelOf_moreOption[index],
                          backgroundColor: default_color,
                        ),
                      );
                    },
                    itemCount: iconOf_moreOption.length,
                  ),
                ],
              ),
          ),
      );
    },
  );
}

var iconOf_SaleTransaction = [
  Remix.download_cloud_2_line,
  Remix.arrow_up_line,
  Remix.truck_line,
  Remix.calculator_line,
  Remix.money_dollar_box_line,
  Remix.shape_2_line,
  Remix.discount_percent_line,
];
var labelOf_SaleTransaction = [
  "Payment-In",
  "Sale Return",
  "Delivery Challan",
  "Estimate/Quotation",
  "Proforma Invoice",
  "Sale Order",
  "Sale Invoice"
];

var iconOf_PurchaseTransaction = [
  Remix.shopping_cart_2_line,
  Remix.money_cny_box_line,
  Remix.secure_payment_line,
  Remix.shopping_bag_2_line,
];
var labelOf_PurchaseTransaction = [
  "Purchase",
  "Payment-Out",
  "Purchase Return",
  "Purchase Order",
];
var iconOf_OtherTransaction = [
  Remix.wallet_3_line,
  Remix.p2p_line,
];
var labelOf_OtherTransaction = [
  "Expenses",
  "P2P Transfer",
];



void pop_up_modal(BuildContext context) {

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        color: Colors.white,
        child: FractionallySizedBox(
          heightFactor: 0.85,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sale Transactions Header
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0,top: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Sale Transactions",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                  // Sale Transactions Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder: (context, index) {

                      return InkWell(
                        onTap: (){
                          if(index==0){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder){return Payment_in();}));
                          }
                          if(index==1){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>Sale_Return()));
                          }
                          if(index==2){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>Delivery_Challan()));
                          }
                          if(index==3 || index==4){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>Estimate_Quotation()));
                          }
                          if(index==5){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>Sale_Order()));
                          }
                          if(index==6){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>Add_new_Sales()));
                          }
                        },
                        child: QuickLink(
                          icon: iconOf_SaleTransaction[index],
                          label: labelOf_SaleTransaction[index],
                          backgroundColor: index == 0 ? Color(0XFF90D5FF) : default_color,
                        ),
                      );
                    },
                    itemCount: iconOf_SaleTransaction.length,
                  ),

                  // Purchase Transactions Header
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0,top: 8.0),
                    child: Text(
                      "Purchase Transactions",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // Purchase Transactions Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          if(index==0){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder){return Purchase();}));
                          }
                          if(index==1){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder){return Payment_Out();}));
                          }
                          if(index==2){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder){return Purchase_Return();}));
                          }
                          if(index==3){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder){return Purchase_Order();}));
                          }
                        },
                        child: QuickLink(
                          icon: iconOf_PurchaseTransaction[index],
                          label: labelOf_PurchaseTransaction[index],
                          backgroundColor: index == 0 ? Color(0XFF90D5FF) : default_color,

                        ),
                      );
                    },
                    itemCount: iconOf_PurchaseTransaction.length,
                  ),

                  // Other Transactions Header
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0,top: 8.0),
                    child: Text(
                      "Other Transactions",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // Other Transactions Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          if(index==0){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder){return Expenses();}));
                          }
                          if(index==1){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder){return P2P_Transfer();}));
                          }
                        },
                        child: QuickLink(
                          icon: iconOf_OtherTransaction[index],
                          label: labelOf_OtherTransaction[index],
                          backgroundColor: index == 0 ? Color(0XFF90D5FF) : default_color,
                        ),
                      );
                    },
                    itemCount: iconOf_OtherTransaction.length,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
