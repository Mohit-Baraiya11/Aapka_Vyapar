import 'package:demo/Dashboard/Bank/Bank_Details.dart';
import 'package:demo/Dashboard/Bank/Bank_account_list.dart';
import 'package:demo/Dashboard/Cah_in_Hand.dart';
import 'package:demo/Dashboard/Expense/Expense.dart';
import 'package:demo/Dashboard/Expense/Expense_Detail.dart';
import 'package:demo/Dashboard/Item/Items.dart';
import 'package:demo/Dashboard/Payable.dart';
import 'package:demo/Dashboard/Purchase_Report.dart';
import 'package:demo/Dashboard/Receivable.dart';
import 'package:demo/Home/Home.dart';
import 'package:demo/Home/Sale_Report.dart';
import 'package:demo/Home/Transaction%20Details/Show%20All/profit&loss.dart';
import 'package:demo/Items/ItemDetails/itemDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Receivable()));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade50,
                                      borderRadius: BorderRadius.circular(90),
                                    ),
                                    child:Icon(Remix.arrow_left_down_line, color: Colors.green, size: 20),
                                  ),
                                   SizedBox(width: 5),
                                   Text(
                                    "You'll Get",
                                    style: TextStyle(fontSize: 14, color: Colors.black54),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "₹ 300.00",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Payable()));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.red.shade50,
                                      borderRadius: BorderRadius.circular(90),
                                    ),
                                    child:Icon(Remix.arrow_right_up_line, color: Color(0xFFE03537), size: 20),
                                  ),                                const SizedBox(width: 5),
                                  const Text(
                                    "You'll Give",
                                    style: TextStyle(fontSize: 14, color: Colors.black54),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "₹ 300.00",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                SizedBox(
                  height: 350, // Set a fixed height
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                //purchase and Expense
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Purchase (Feb)",
                              style: TextStyle(fontSize: 14, color: Colors.black54),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "₹ 110.00",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Expense()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Expense (Feb)",
                                style: TextStyle(fontSize: 14, color: Colors.black54),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "₹ 300.00",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Quick Links Section
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.only(top: 8.0,),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 7),
                          child: Text(
                            "Most Used Reports",
                            style: TextStyle(fontSize: 15,),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Add Txn
                          QuickLink(
                            icon: Remix.discount_percent_line,
                            backgroundColor: Colors.pink.shade50,
                            label: "Sales",
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Sale_Report()));
                            },
                          ),

                          // Txn Settings
                          QuickLink(
                            icon: Remix.shopping_cart_2_line,
                            label: "Purchase",
                              backgroundColor: Colors.pink.shade50,
                            iconColor: Colors.red,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Purchase_Report()));
                            }
                          ),
                          // Show All
                          QuickLink(
                            icon: Remix.hand_coin_line,
                            label: "Profit & Loss",
                            backgroundColor: Colors.pink.shade50,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Profit_and_loss()));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),



                // Cash & Bank Section
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cash & Bank",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Bank_Account_List()));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Bank Balance",
                                      style: TextStyle(fontSize: 14, color: Colors.black54),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "₹ 3640.00",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF38C782), // Green Color
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cash_In_Hand()));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Cash in-hand",
                                      style: TextStyle(fontSize: 14, color: Colors.black54),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "₹ 3640.00",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFE03537), // Red Color
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "List of Bank",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      // Use ListView.builder for dynamic data
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return ListTile(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Bank_Details()));
                                },
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                                visualDensity: VisualDensity(vertical: -4),
                                leading: Text("HDFC", style: TextStyle(fontSize: 15)),
                                trailing:  Text("₹ 400.00", style: TextStyle(fontSize: 15, color: Color(0xFFE03537)),),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Inventory Section
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Inventory",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Items()));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Stock Value",
                                      style: TextStyle(fontSize: 14, color: Colors.black54),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "₹ 3,01,640.00",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF38C782), // Green Color
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Items()));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "No. of Items",
                                      style: TextStyle(fontSize: 14, color: Colors.black54),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "5",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Low Stock Items (2)",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      ListView.builder(
                        shrinkWrap: true,
                        physics:  NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return ListTile(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemDetailsScreen(itemName: "Maggie", salePrice: 100, purchasePrice: 20, inStock: 10)));
                                },
                                dense: true,
                                visualDensity: VisualDensity(vertical: -4),
                                contentPadding: EdgeInsets.zero,
                                leading: Text("Maggie", style: TextStyle(fontSize: 15)),
                                trailing: Text(
                                  "₹ 400.00",
                                  style: TextStyle(fontSize: 15, color: Color(0xFFE03537)),
                                ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Expenses Section
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Expenses",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return ListTile(
                                onTap:(){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Expense_Detail(Expense_Category: "Grocery")));
                                },
                                contentPadding: EdgeInsets.zero,
                                visualDensity: VisualDensity(vertical: -4),
                                dense: true,
                                leading: Text("Grocery", style: TextStyle(fontSize: 15)),
                                trailing: Text(
                                  "₹ 400.00",
                                  style: TextStyle(fontSize: 15, color: Color(0xFFE03537)),
                              ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
    );
  }
}
