import 'package:demo/Home/Prefered_underline_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';

class Profit_and_loss extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Profitandloss();
}

class Profitandloss extends State<Profit_and_loss> {

  var firstDate = DateTime.now();
  var lastDate = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);

  String? selectedTimeDuration = "This week";
  final List<String> timeDurationOptions = [
    'Today',
    'This week',
    'This month',
    'This quarter',
    'This Financial Year',
    'Custom'
  ];

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
  void _showTimeSelectionModal(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.48,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              Divider(color: Colors.grey.shade200, thickness: 1),
              ListView.separated(
                shrinkWrap: true,
                itemCount: timeDurationOptions.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: Colors.grey.shade200, thickness: 1);
                },
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    title: Text(timeDurationOptions[index]),
                    trailing: selectedTimeDuration == timeDurationOptions[index]
                        ? Icon(Icons.circle, color: Colors.blue, size: 12)
                        : null,
                    onTap: () {
                      setState(() {
                        selectedTimeDuration = timeDurationOptions[index];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade300,
          statusBarIconBrightness: Brightness.light,
        ),
        surfaceTintColor: Colors.white,
        backgroundColor:Colors.white,
        bottom: Prefered_underline_appbar(),
        title: Text('Profit And Loss Report',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
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
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                            Icon(Remix.arrow_down_s_line,color: Colors.blueAccent,),
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
                    Icon(Remix.calendar_2_line,color: Colors.blueAccent,size: 15,),
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
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      colors: [Colors.lightBlueAccent.shade100,Color(0x88D8E7F1FF)],
                    ),
                  ),
                  padding: EdgeInsets.all(4.0),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Gross Profit",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.grey),
                                          )),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "₹100.00",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.greenAccent),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Net Profit",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.grey),
                                          )),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "₹100.00",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.greenAccent),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                buildSectionTitle("Particulars"),
                                Divider(thickness: 1, height: 24),
                                buildRowItem("Sale (+)", "₹ 100.00", Colors.green),
                                buildRowItem("Sale FA (+)", "₹ 0.00", Colors.red),
                                buildRowItem("Cr. Note/Sale Return (-)", "₹ 0.00", Colors.red),
                                buildRowItem("Purchase (-)", "₹ 0.00", Colors.red),
                                buildRowItem("Purchase FA (-)", "₹ 0.00", Colors.red),
                                buildRowItem("Dr. Note/Purchase Return (+)", "₹ 0.00", Colors.green),
                                buildRowItem("Payment Out Discount (+)", "₹ 0.00", Colors.green),
                                Divider(thickness: 1, height: 24),
                                buildSectionTitle("Stocks"),
                                buildRowItem("Opening Stock (-)", "₹ 0.00", Colors.red),
                                buildRowItem("Closing Stock (+)", "₹ 0.00", Colors.green),
                                buildRowItem("Opening FA Stock (-)", "₹ 0.00", Colors.red),
                                buildRowItem("Closing FA Stock (+)", "₹ 0.00", Colors.green),
                                Divider(thickness: 1, height: 24),
                                buildSectionTitle("Direct Expenses (-)"),
                                buildRowItem("Other Direct Expense", "₹ 0.00", Colors.red),
                                buildRowItem("Payment In Discount", "₹ 0.00", Colors.green),
                                Divider(thickness: 1, height: 24),
          
                                buildSectionTitle("Tax Payable (-)"),
                                buildRowItem("GST Payable", "₹ 0.00", Colors.red),
                                buildRowItem("TCS Payable", "₹ 0.00", Colors.red),
                                buildRowItem("TDS Payable", "₹ 0.00", Colors.red),
          
                                buildSectionTitle("Tax Payable (+)"),
                                buildRowItem("GST Receivable", "₹ 0.00", Colors.green),
                                buildRowItem("TCS Receivable", "₹ 0.00", Colors.green),
                                buildRowItem("TDS Receivable", "₹ 0.00", Colors.green),
          
                                buildSectionTitle_Profit("Gross Profit", "₹100.00", Colors.green),
          
                                buildSectionTitle("Other Income (+)"),
                                buildRowItem("Other Income", "₹ 0.00", Colors.green),
          
                                buildSectionTitle("Indirect Expenses (-)"),
                                buildRowItem("Other Expense", "₹ 0.00", Colors.red),
                                buildRowItem("Loan Interest Expense", "₹ 0.00", Colors.red),
                                buildRowItem("Loan Processing Free Expense", "₹ 0.00", Colors.red),
                                buildRowItem("Charges on Loan Expenses", "₹ 0.00", Colors.red),
          
                                buildSectionTitle_Profit("Net Profit", "₹100.00", Colors.green),
          
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      )

    );
  }
  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }
  Widget buildSectionTitle_Profit(String title,String amount,Color amountColor) {
    return Container(
      color: Color(0xFFC5F5E3),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.green),
            ),
            Text(
              amount,
              style: TextStyle(fontSize: 14, color: amountColor),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildRowItem(String title, String amount, Color amountColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          Text(
            amount,
            style: TextStyle(fontSize: 14, color: amountColor),
          ),
        ],
      ),
    );
  }
}
