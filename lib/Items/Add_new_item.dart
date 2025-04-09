import 'package:demo/Dashboard/Item/Set_Conversion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';
import '../Home/Prefered_underline_appbar.dart';

class Add_new_item extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Addnewitem();
}

class Addnewitem extends State<Add_new_item> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedTaxType = "Without Tax";
  String selectedDiscountType = "Percentage";

  TextEditingController _dateController = TextEditingController();

  TextEditingController item_name_controller = TextEditingController();
  TextEditingController item_code_controller = TextEditingController();
  TextEditingController hsn_sac_code_controller = TextEditingController();

  ///pricing
  TextEditingController sale_price_controller = TextEditingController();
  TextEditingController discount_on_sale_price_controller = TextEditingController();
  TextEditingController purchase_price_controller = TextEditingController();
  TextEditingController _taxrate = TextEditingController();

  ///Stock
  TextEditingController opening_stock = TextEditingController();
  TextEditingController at_price_unit_controller = TextEditingController();
  TextEditingController min_stock_qty_controller = TextEditingController();
  TextEditingController item_location_controller = TextEditingController();

  String? _selectedCategoryName;
  String? _selectedCategoryId;
  final TextEditingController _categoryController = TextEditingController();
  List<Map<String, dynamic>> _categories = [];
  final TextEditingController _addCategoryController = TextEditingController();

  // Add these to your state class
  final TextEditingController online_store_item_price_controller = TextEditingController();
  final TextEditingController online_store_item_description_controller = TextEditingController();

  bool is_product = true;

  ///ADD CATEGORY
  void _showAddCategoryDialog(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              height: MediaQuery.of(context).size.height * 0.25,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Add Category", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Remix.close_line)
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey.shade200, thickness: 1),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    height: 45,
                    child: TextField(
                      controller: _addCategoryController,
                      decoration: InputDecoration(
                        labelText: "Add new category",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(14),
                        backgroundColor: Color(0xFFE03537),
                      ),
                      onPressed: () async {

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Create",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
    );
  }

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    _dateController.text = formattedDate;

    _taxrate.text = selectedGstLabel;

    _tabController = TabController(length: 3, vsync: this); // Changed to 3 tabs
  }

  @override
  void dispose() {
    _categoryController.dispose();
    _tabController.dispose();
    item_name_controller.dispose();
    item_code_controller.dispose();
    hsn_sac_code_controller.dispose();
    _categoryController.dispose();
    _addCategoryController.dispose();
    sale_price_controller.dispose();
    discount_on_sale_price_controller.dispose();
    purchase_price_controller.dispose();
    _taxrate.dispose();
    opening_stock.dispose();
    _dateController.dispose();
    at_price_unit_controller.dispose();
    min_stock_qty_controller.dispose();
    item_location_controller.dispose();
    super.dispose();
  }

  String selectedGstLabel = "None";
  double selectedGstValue = 0.0;
  final Map<String, double> gstOptions = {
    "Exempted": 0.0,
    "GST@0%": 0.0,
    "IGST@0%": 0.0,
    "GST@0.25%": 0.25,
    "IGST@0.25%": 0.25,
    "GST@3%": 3.0,
    "IGST@3%": 3.0,
    "GST@5%": 5.0,
    "IGST@5%": 5.0,
    "GST@12%": 12.0,
    "IGST@12%": 12.0,
    "GST@18%": 18.0,
    "IGST@18%": 18.0,
    "GST@28%": 28.0,
    "IGST@28%": 28.0,
  };

  void _showGstBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tax %",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: gstOptions.length,
                  itemBuilder: (context, index) {
                    final key = gstOptions.keys.elementAt(index); // Get the label
                    final value = gstOptions[key]!; // Get the percentage value
                    return ListTile(
                      title: Text(key), // Show the label
                      trailing: Text("${value.toStringAsFixed(1)}%"), // Show the value
                      onTap: () {
                        setState(() {
                          selectedGstLabel = key;
                          _taxrate.text = key;
                        });
                        Navigator.pop(context); // Close the bottom sheet
                      },
                    );
                  },
                ),
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
          statusBarColor: Colors.grey.shade400,
          statusBarIconBrightness: Brightness.light,
        ),
        surfaceTintColor: Colors.white,
        title:Text("Add Items", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),),
        backgroundColor: Colors.white,
        bottom: Prefered_underline_appbar(),
      ),
      bottomNavigationBar: Row(
        children: [
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
              child: Text("Cencle",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE03537),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  )
              ),
              child: Text("Save",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.blue[50],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Product",style: TextStyle(fontSize: 14,color:is_product?Colors.black:Colors.grey,fontWeight: FontWeight.w500),),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          is_product = !is_product;
                        });
                      },
                      child: Container(
                        height: 25,
                        width: 50,
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          mainAxisAlignment: is_product?MainAxisAlignment.end:MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(90.0),
                              ),
                              width: 20,
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text("Services",style: TextStyle(fontSize: 14,color:!is_product?Colors.black:Colors.grey,fontWeight: FontWeight.w500),),
                  ],
                ),
              ),

              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.white,
                child: Column(
                  children: [
                    // Item name
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: item_name_controller,
                              decoration: InputDecoration(
                                labelText: "Item Name",
                                suffix: SizedBox(
                                  height: 30,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue.shade50,
                                      ),
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Set_Conversion()));
                                      },
                                      child: Text("Select Unit",style: TextStyle(color: Colors.blueAccent),)
                                  ),
                                ),
                                floatingLabelStyle: TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(
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

                    // Item code / Barcode
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: item_code_controller,
                              decoration: InputDecoration(
                                labelText: "Item Code / Barcode",
                                suffix: SizedBox(
                                  height: 30,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue.shade50,
                                      ),
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Set_Conversion()));
                                      },
                                      child: Text("Assign Code",style: TextStyle(color: Colors.blueAccent),)
                                  ),
                                ),
                                floatingLabelStyle: TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(
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

                    // Item Category
                    Padding(
                      padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              readOnly: true,
                              controller: _categoryController,
                              onTap: () {
                                showModalBottomSheet(
                                  backgroundColor: Colors.white,
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    // Create a local variable to track selection within the modal
                                    String? localSelectedCategoryId = _selectedCategoryId;
                                    String? localSelectedCategoryName = _selectedCategoryName;

                                    return StatefulBuilder(
                                      builder: (context, setModalState) {
                                        return Container(
                                          height: MediaQuery.of(context).size.height * 0.85,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8.0),
                                            color: Colors.white,
                                          ),
                                          child: Stack(
                                            children: [
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Select Category", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                                        IconButton(
                                                            onPressed: () {
                                                              Navigator.pop(context);
                                                            },
                                                            icon: Icon(Icons.close)
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(color: Colors.grey.shade200, thickness: 1),
                                                  SizedBox(height: 10),

                                                  // Search field
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                        prefixIcon: Icon(Remix.search_2_line, color: Colors.blueAccent),
                                                        hintText: "Search Category",
                                                        floatingLabelStyle: TextStyle(color: Colors.blue),
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
                                                      onChanged: (value) {
                                                        // Implement search functionality if needed
                                                      },
                                                    ),
                                                  ),
                                                  Divider(color: Colors.grey.shade200, thickness: 1),

                                                  // Add New Category Tile
                                                  ListTile(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                      _showAddCategoryDialog(context);
                                                    },
                                                    dense: true,
                                                    visualDensity: VisualDensity.compact,
                                                    title: Text("Add New Category", style: TextStyle(color: Colors.blueAccent)),
                                                    trailing: Icon(Remix.add_circle_line, color: Colors.blueAccent),
                                                  ),
                                                  Divider(color: Colors.grey.shade200, thickness: 1),

                                                  Expanded(
                                                    child: _categories.isEmpty
                                                        ? Center(child: Text("No categories found"))
                                                        : ListView.separated(
                                                      itemCount: _categories.length,
                                                      separatorBuilder: (context, index) {
                                                        return Divider(color: Colors.grey.shade200, thickness: 1);
                                                      },
                                                      itemBuilder: (context, index) {
                                                        final category = _categories[index];
                                                        return ListTile(
                                                          dense: true,
                                                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                                          visualDensity: VisualDensity.compact,
                                                          title: Text(category['name']),
                                                          trailing: Radio<String>(
                                                            activeColor: Colors.blueAccent,
                                                            value: category['id'],
                                                            groupValue: localSelectedCategoryId,
                                                            onChanged: (value) {
                                                              setModalState(() {
                                                                localSelectedCategoryId = value;
                                                                localSelectedCategoryName = category['name'];
                                                              });
                                                            },
                                                          ),
                                                          onTap: () {
                                                            setModalState(() {
                                                              localSelectedCategoryId = category['id'];
                                                              localSelectedCategoryName = category['name'];
                                                            });
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Positioned(
                                                bottom: 20,
                                                left: 0,
                                                right: 0,
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.all(14),
                                                    backgroundColor: Color(0xFFE03537),
                                                  ),
                                                  onPressed: () {
                                                    if (localSelectedCategoryId != null) {
                                                      // Update the parent widget's state
                                                      setState(() {
                                                        _selectedCategoryId = localSelectedCategoryId;
                                                        _selectedCategoryName = localSelectedCategoryName;
                                                        _categoryController.text = localSelectedCategoryName!;
                                                      });
                                                    }
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "Apply",
                                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                  ),
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
                              decoration: InputDecoration(
                                hintText: _selectedCategoryName ?? "Item Category",
                                suffixIcon: Icon(Remix.arrow_down_s_line),
                                floatingLabelStyle: TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(
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

                    // HSN / SAC Code
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: hsn_sac_code_controller,
                              decoration: InputDecoration(
                                labelText: "HSN / SAC Code",
                                floatingLabelStyle: TextStyle(color: Colors.blue),
                                border: OutlineInputBorder(
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
                  ],
                ),
              ),

              Container(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: TabBar(
                        controller: _tabController,
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(color: Colors.red, width: 3.0),
                          insets: EdgeInsets.symmetric(horizontal: -50.0),
                        ),
                        indicatorColor: Colors.red,
                        indicatorWeight: 2.0,
                        labelColor: Colors.red,
                        unselectedLabelColor: Colors.grey,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        tabs: [
                          Tab(text: 'Pricing'),
                          Tab(text: 'Stock'),
                          Tab(text: 'Online Store'),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      height: 550,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // Pricing Tab
                          Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Sale Price", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                      Divider(),
                                      SizedBox(height: 16),
                                      TextField(
                                        controller: sale_price_controller,
                                        decoration: InputDecoration(
                                          labelText: "Sale Price",
                                          floatingLabelStyle: TextStyle(color: Colors.blue),
                                          border: OutlineInputBorder(
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
                                      SizedBox(height: 16),
                                      TextField(
                                        controller: discount_on_sale_price_controller,
                                        decoration: InputDecoration(
                                          labelText: "Disc On Sale Price",
                                          floatingLabelStyle: TextStyle(color: Colors.blue),
                                          border: OutlineInputBorder(
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
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                                Container(color: Colors.blue[50], height: 10,),

                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Purchase Price", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                      Divider(),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              controller: purchase_price_controller,
                                              decoration: InputDecoration(
                                                labelText: "Purchase Item",
                                                hintText: "Purchase Item",
                                                floatingLabelStyle: TextStyle(color: Colors.blue),
                                                border: OutlineInputBorder(
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
                                    ],
                                  ),
                                ),
                                Container(color: Colors.blue[50], height: 10,),

                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Taxes", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                      Divider(),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              onTap: ()=>_showGstBottomSheet(context),
                                              readOnly: true,
                                              controller: _taxrate,
                                              decoration: InputDecoration(
                                                labelText: "Tax Rate",
                                                floatingLabelStyle: TextStyle(color: Colors.blue),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                          // Stock Tab
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                      children: [
                                        SizedBox(height: 16),
                                        TextField(
                                          controller: opening_stock,
                                          decoration: InputDecoration(
                                            labelText: "Opening Stock",
                                            hintText: "Ex:300",
                                            floatingLabelStyle: TextStyle(color: Colors.blue),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(4.0),
                                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(4.0),
                                              borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        Row(
                                          children: [
                                        Expanded(
                                        child: TextField(
                                        controller: _dateController,
                                          readOnly: true,
                                          keyboardType: TextInputType.datetime,
                                          decoration: InputDecoration(
                                            labelText: "As of Date",
                                            suffixIcon: Icon(Remix.calendar_2_line),
                                            floatingLabelStyle: TextStyle(color: Colors.blue),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(4.0),
                                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(4.0),
                                              borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                             ),
                                           ),
                                         ),
                                       ),
                                        SizedBox(width: 10,),
                                        Expanded(
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            controller: at_price_unit_controller,
                                            decoration: InputDecoration(
                                              labelText: "At Price/Unit",
                                              hintText: "Ex:2000",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(4.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(4.0),
                                                borderSide: BorderSide(color: Colors.blue, width: 2.0),
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
                                       SizedBox(height: 16),
                                     Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            keyboardType: TextInputType.datetime,
                                            controller: min_stock_qty_controller,
                                            decoration: InputDecoration(
                                              labelText: "Min Stock Qty",
                                              hintText: "Ex:5",
                                              floatingLabelStyle: TextStyle(color: Colors.blue),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(4.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(4.0),
                                                borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(4.0),
                                                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Expanded(
                                            child: TextField(
                                              controller: item_location_controller,
                                              decoration: InputDecoration(
                                                labelText: "Item Location",
                                                hintText: "Item Location",
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(4.0),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(4.0),
                                                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
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
                                    ],
                                ),
                              ),
                            ],
                          ),


                          //Online store
                          Column(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.all(16.0),
                                 child: Column(
                                      children: [
                                        SizedBox(height: 16),
                                        TextField(
                                          controller: online_store_item_price_controller,
                                          decoration: InputDecoration(
                                            labelText: "Online Store Item Price",
                                            floatingLabelStyle: TextStyle(color: Colors.blue),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(4.0),
                                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(4.0),
                                              borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        TextField(
                                          controller: online_store_item_description_controller,
                                          decoration: InputDecoration(
                                            labelText: "Online Store Item Description",
                                            floatingLabelStyle: TextStyle(color: Colors.blue),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(4.0),
                                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(4.0),
                                              borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                       
                                      ],
                                    ),
                               ),
                             ],
                           ),
                            
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}