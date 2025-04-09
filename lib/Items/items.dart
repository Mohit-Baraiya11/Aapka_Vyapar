import 'package:demo/Home/Home.dart';
import 'package:demo/Items/Add_new_item.dart';
import 'package:demo/Items/More%20Option/Categories.dart';
import 'package:demo/Items/More%20Option/Inactive_Items.dart';
import 'package:demo/Items/More%20Option/Units.dart';
import 'package:demo/Items/Online%20Store/MyStorePage/myStore.dart';
import 'package:demo/Items/Show%20All/Export%20%20Items/export-items.dart';
import 'package:demo/Items/Show%20All/Import%20Items/import-items.dart';
import 'package:demo/Items/Stock%20Summary%20Report/Stock_summary_report.dart';
import 'package:demo/Menu/My%20business/Report/Item_Detail_Report.dart';
import 'package:demo/Menu/My%20business/Report/Item_Wise_Profit_And_Loss.dart';
import 'package:demo/Menu/My%20business/Report/Low_Stock_Summary.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import 'ItemDetails/itemDetails.dart';

class ItemsPageContent extends StatefulWidget {
  const ItemsPageContent({super.key});

  @override
  State<ItemsPageContent> createState() => _ItemsPageContentState();
}

// Items Page Content
class _ItemsPageContentState extends State<ItemsPageContent> {

  bool is_show_inactive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
             Column(
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
                              //Add Txn
                              QuickLink(
                                icon: Remix.store_2_line,
                                label: "Online Store",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OnlineStoreScreen()),
                                  );
                                },
                              ),
                              //Sale Report
                              QuickLink(
                                icon: Remix.funds_line,
                                label: "Stock Summary",
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Stock_Summary_Report()));
                                },
                              ),
                              //Txn settings
                              QuickLink(
                                icon: Remix.settings_2_line,
                                label: "Txn Settings",
                                iconColor: Colors.red,
                                onTap: (){
                
                                },
                              ),
                              //Show all
                              QuickLink(
                                icon: Remix.arrow_right_circle_line,
                                label: "Show All",
                                onTap: () {
                                  More_Option(context);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                
                
                    ///searchabar
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Search for transaction",
                                  hintStyle:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                                  prefixIcon: Icon(
                                    Remix.search_line,
                                    color: Colors.blue,
                                  ),
                                  suffixIcon:Icon(Remix.filter_2_line, color: Colors.blue,),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            height: 40,
                            width: 40,
                            child: IconButton(
                                onPressed: (){
                                  showModalBottomSheet(
                                      backgroundColor: Colors.white,
                                      context: context,
                                      builder: (context){
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          height: MediaQuery.of(context).size.height * 0.40,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("More Options",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                                    IconButton(
                                                        onPressed: (){
                                                          Navigator.pop(context);
                                                        },
                                                        icon: Icon(Remix.close_line)
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(color: Colors.grey.shade200,thickness: 1,),
                
                                              ListTile(
                                                onTap: (){
                                                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Inactive_Items()));
                                                },
                                                dense: true,
                                                visualDensity: VisualDensity.compact,
                                                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                                                title: Text("Mark Items Active",style: TextStyle(fontSize: 15),),
                                                trailing: Icon(Remix.arrow_right_s_line,size:22,),
                                              ),
                                              Divider(color: Colors.grey.shade200,thickness: 1,),
                
                
                                              ListTile(
                                                dense: true,
                                                visualDensity: VisualDensity.compact,
                                                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                                                title: Text("Mark Items Inactive",style: TextStyle(fontSize: 15),),
                                                trailing: Icon(Remix.arrow_right_s_line,size:22,),
                                              ),
                                              Divider(color: Colors.grey.shade200,thickness: 1,),
                
                                              ListTile(
                                                dense: true,
                                                visualDensity: VisualDensity.compact,
                                                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                                                title: Text("Show Inactive",style: TextStyle(fontSize: 15),),
                                                trailing: Checkbox(
                                                    activeColor: Colors.blueAccent,
                                                    value: is_show_inactive,
                                                    onChanged: (val){
                                                      setState(() {
                                                        is_show_inactive=val!;
                                                      });
                                                      Navigator.pop(context);
                                                    }
                                                ),
                                              ),
                                              Divider(color: Colors.grey.shade200,thickness: 1,),
                
                                              ListTile(
                                                onTap: (){
                                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Units()));
                                                },
                                                dense: true,
                                                visualDensity: VisualDensity.compact,
                                                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                                                title: Text("Untis",style: TextStyle(fontSize: 15),),
                                                trailing: Icon(Remix.arrow_right_s_line,size:22,),
                                              ),
                                              Divider(color: Colors.grey.shade200,thickness: 1,),
                
                                              ListTile(
                                                onTap: (){
                                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Categories()));
                                                },
                                                dense: true,
                                                visualDensity: VisualDensity.compact,
                                                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                                                title: Text("Categories",style: TextStyle(fontSize: 15),),
                                                trailing: Icon(Remix.arrow_right_s_line,size:22,),
                                              ),
                
                                            ],
                                          ),
                                        );
                                      }
                                  );
                                },
                                icon: Icon(Remix.more_2_line)
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                
                    // Item
                    Expanded(
                      child: ListView.builder(
                          itemCount: 1,
                          itemBuilder:(context,index){
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemDetailsScreen(itemName: "Patoto", salePrice: 1200, purchasePrice: 300, inStock: 10)));
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Cofee",style: TextStyle(fontSize: 16),),
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Text("GROCERY",style: TextStyle(fontSize: 11),),
                                            ),
                                            IconButton(onPressed: (){}, icon: Icon(Remix.share_forward_line,)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Sale Price", style: TextStyle(color: Colors.grey.shade500, fontSize: 15)),
                                              SizedBox(height: 4),
                                              Text("₹ 100.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Purchase Price", style: TextStyle(color: Colors.grey.shade500, fontSize: 15)),
                                              SizedBox(height: 4),
                                              Text("₹ 200.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("In stock", style: TextStyle(color: Colors.grey.shade500, fontSize: 15)),
                                              SizedBox(height: 4),
                                              Text("200.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF38C782))),
                                            ],
                                          ),
                                        ],
                                      ),
                                    SizedBox(height: 10,),
                                  ],
                                ),
                              ),
                            );
                          }
                      ),
                    ),
                
                  ],
                ),
             Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(14),
                      backgroundColor: Color(0xFFE03537),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_new_item()));
                    },
                    child:Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Remix.box_3_line,color: Colors.white,size: 20,),
                        const SizedBox(width: 8),
                        Text(
                          "Add new Items",
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
      ),
    );
  }
  void More_Option(BuildContext context)
  {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height*0.30,
          child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Sale Transactions Header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "More Option",
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
                    Divider(color: Colors.grey.shade200,thickness: 1,),
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ImportItemsPage()));
                            }
                            if(index==1){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ExportItemsScreen()));
                            }
                            if(index==2){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Item_Wise_Profit_And_Loss()));
                            }
                            if(index==3){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Item_Detail_Report()));
                            }
                            if(index==4){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Low_Stock_Summary()));
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
        );
      },
    );
  }
  var iconOf_moreOption = [
    Remix.sticky_note_add_line,
    Remix.delete_bin_line,
    Remix.bubble_chart_line,
    Remix.instance_line,
    Remix.box_2_line,
  ];
  var labelOf_moreOption = [
    "Import Items",
    "Export Items",
    "Item Wise PnL",
    "Item Deetails",
    "Low Stock Summary",
  ];
}
