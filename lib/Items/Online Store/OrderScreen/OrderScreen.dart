import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade300,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
        title:Text('Orders', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.red,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 3.0,
                  color: Color(0xFFE03537),
                ),
                insets: EdgeInsets.symmetric(horizontal: 120.0),
              ),
              labelColor: Colors.red,
              unselectedLabelColor: Colors.grey,
              indicatorWeight: 3,
              tabs: const [
                Tab(text: 'Sale Orders'),
                Tab(text: 'Online Orders'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Sale Orders Tab
                _buildSaleOrdersTab(),

                // Online Orders Tab
                _buildOnlineOrdersTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String selected_button = "All";
  int value = 0;

  Widget _buildSaleOrdersTab() {

    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 30,
                child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        selected_button = "All";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:selected_button=="All"?Colors.red.shade50:Colors.white,
                      side: BorderSide(color:selected_button=="All"?Color(0xFFE03537):Colors.grey),
                      padding: EdgeInsets.zero,
                    ),
                    child: Text("All",style: TextStyle(color: selected_button=="All"?Color(0xFFE03537):Colors.grey),)
                ),
              ),
              SizedBox(width: screenwidth*0.01,),
              Container(
                height: 30,
                child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        selected_button=="Open Estimate";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:selected_button=="Open Estimate"?Colors.red.shade50:Colors.white,
                        side: BorderSide(color:selected_button=="Open Estimate"?Color(0xFFE03537):Colors.grey),
                        padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: Text("Open Estimate",style: TextStyle(color: selected_button=="Open Estimate"?Color(0xFFE03537):Colors.grey),)
                ),
              ),
              SizedBox(width: screenwidth*0.01,),
              Container(
                height: 30,
                child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        selected_button = "Close Estimate";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:selected_button=="Close Estimate"?Colors.red.shade50:Colors.white,
                        side: BorderSide(color:selected_button=="Close Estimate"?Color(0xFFE03537):Colors.grey),
                       padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: Text("Close Estimate",style: TextStyle(color: selected_button=="Close Estimate"?Color(0xFFE03537):Colors.grey),)
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: screenwidth,
            color: Colors.blue.shade50,
            child: Expanded(
              child: value == 1
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Icon(Remix.survey_line,color: Colors.blueAccent,size: 100,),
                  ),
                   Text(
                    "Hey! You have no order yet.\nPlease add your sale order here.",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                ],
              )
                  : Column(
                    children: [
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
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
                                    hintStyle:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                                    prefixIcon: Icon(
                                      Remix.search_line,
                                      color: Colors.blue,
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
                      ),

                      Expanded(
                        child: ListView.builder(
                                      itemCount: 1,
                                      padding: EdgeInsets.only(top: 8),
                                      itemBuilder: (context, index) {
                                            return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                        child: Container(
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
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Mohit",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(width: 5,),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.orange.shade100,
                                              borderRadius:
                                              BorderRadius.circular(15),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
                                              child: Text(
                                                "OVERDUE",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.orange.shade900,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text("₹ 9.80")
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "#1",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
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

                                ],
                              ),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Advance",style: TextStyle(fontSize: 12,color: Colors.grey),),
                                      Text("₹ 9.80",style: TextStyle(fontSize: 12,color: Colors.grey),),
                                    ],
                                  ),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Balance",style: TextStyle(fontSize: 12,color: Colors.grey),),
                                      Text("₹ 9.80",style: TextStyle(fontSize: 12,color: Colors.grey),),
                                    ],
                                  ),


                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Due Date",style: TextStyle(fontSize: 12,color: Colors.grey),),
                                      Text("11 Mar,25",style: TextStyle(fontSize: 12,color: Colors.grey),),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 30,
                                    child: ElevatedButton(
                                        onPressed: (){},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue.shade50,
                                          padding: EdgeInsets.symmetric(horizontal: 16),
                                        ),
                                        child: Text("Convert to Sale",style: TextStyle(color: Colors.blueAccent),)
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                                            );
                                           },
                                          ),
                      ),
                 ]
                ),
            ),
          ),
        ),
      ],
    );
  }

  String online_order_button = "All";

  Widget _buildOnlineOrdersTab() {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Order',
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              suffixIcon: GestureDetector(
                onTap: (){
                  _showSortingOptions(context);
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.filter_list, color: Colors.grey),
                ),
              ),
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 30,
                child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        online_order_button = "All";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:online_order_button=="All"?Colors.black54:Colors.white,
                      side: BorderSide(color:online_order_button!="All"?Colors.grey:Colors.transparent),
                      padding: EdgeInsets.zero,
                    ),
                    child: Text("All",style: TextStyle(color: online_order_button=="All"?Colors.white:Colors.grey),)
                ),
              ),
              SizedBox(width: screenwidth*0.01,),
              Container(
                height: 30,
                child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        online_order_button=="Open";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:online_order_button=="Open"?Colors.orange:Colors.white,
                      side: BorderSide(color:online_order_button!="Open"?Colors.grey:Colors.transparent),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: Text("Open",style: TextStyle(color: online_order_button=="Open"?Colors.white:Colors.grey),)
                ),
              ),
              SizedBox(width: screenwidth*0.01,),
              Container(
                height: 30,
                child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        online_order_button = "Cencelled";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:online_order_button=="Cencelled"?Color(0xFFE03537):Colors.white,
                      side: BorderSide(color:online_order_button!="Cencelled"?Colors.grey:Colors.transparent),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: Text("Cencelled",style: TextStyle(color: online_order_button=="Cencelled"?Colors.white:Colors.grey),)
                ),
              ),
              SizedBox(width: screenwidth*0.01,),
              Container(
                height: 30,
                child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        online_order_button = "Dellivered";
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:online_order_button=="Dellivered"?Colors.green:Colors.white,
                      side: BorderSide(color:online_order_button!="Dellivered"?Colors.grey:Colors.transparent),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    child: Text("Dellivered",style: TextStyle(color: online_order_button=="Dellivered"?Colors.white:Colors.grey),)
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: screenwidth,
            color: Colors.white,
            child: Expanded(
              child: value == 1
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Icon(Remix.survey_line,color: Colors.blueAccent,size: 100,),
                  ),
                  Text(
                    "Hey! You have no order yet.\nPlease add your sale order here.",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                ],
              )
                  : Column(
                  children: [

                    Expanded(
                      child: ListView.builder(
                        itemCount: 1,
                        padding: EdgeInsets.only(top: 8),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(4),
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
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE03537),
                                          borderRadius: BorderRadius.circular(4)
                                        ),
                                        padding: EdgeInsets.all(2),
                                        child: Text("NEW",style: TextStyle(color: Colors.white,fontSize: 10),),
                                      ),
                                    ],
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Order #1",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.orange.shade100,
                                                borderRadius:
                                                BorderRadius.circular(15),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
                                                child: Text(
                                                  "OPEN",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.orange.shade900,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                              "20 Feb - 03:48 PM",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                    ]
                                    ),
                                  ),

                                  SizedBox(height: 6),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Mohit Baraiya",style: TextStyle(fontSize: 15),),
                                            Text("1 Item",style: TextStyle(fontSize: 13,color: Colors.grey),),
                                          ],
                                        ),
                                        Text("₹ 0",style: TextStyle(fontSize: 15),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 30,
                                          child: ElevatedButton(
                                              onPressed: (){},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.blue.shade50,
                                                padding: EdgeInsets.symmetric(horizontal: 16),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4),
                                                )
                                              ),
                                              child: Text("Convert to Sale",style: TextStyle(color: Colors.blueAccent),)
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ]
              ),
            ),
          ),
        ),

      ],
    );
  }
  void _showSortingOptions(BuildContext context) {
    String? selectedOption;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sort By',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: Icon(Remix.close_line),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey.shade200,thickness: 1,),

                  SizedBox(height: 16),
                  RadioListTile<String>(
                    activeColor: Colors.blueAccent,
                    title: Text('Date (Newest First)'),
                    value: 'newest_first',
                    groupValue: selectedOption,
                    onChanged: (String? value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    activeColor: Colors.blueAccent,
                    title: Text('Date (Oldest First)'),
                    value: 'oldest_first',
                    groupValue: selectedOption,
                    onChanged: (String? value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    activeColor: Colors.blueAccent,
                    title: Text('Order Total (Highest to Lowest)'),
                    value: 'highest_to_lowest',
                    groupValue: selectedOption,
                    onChanged: (String? value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    activeColor: Colors.blueAccent,
                    title: Text('Order Total (Lowest to Highest)'),
                    value: 'lowest_to_highest',
                    groupValue: selectedOption,
                    onChanged: (String? value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                          child: ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                padding: EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )
                              ),
                              child: Text("Apply",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),)
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

}
