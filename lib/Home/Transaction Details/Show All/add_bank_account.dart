import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:remixicon/remixicon.dart';

class Add_Bank_Account extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => AddBankAccount();
}

class AddBankAccount extends State<Add_Bank_Account>
{
  TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

   _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  bool print_bank_details = false;
  bool print_UPI_qr = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade300,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
        title: Text("Add Bank Account"),
        shadowColor: Colors.black,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height:50,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Bank Name/Account Display Name",
                            hintText: "Bank Name/Account Display Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide(color: Colors.grey, width: 1.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height:50,
                              child: TextField(
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  labelText: "Opening Balance",
                                  hintText: "Opening Balance",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              height:50,
                              child: TextField(
                                controller: _dateController,
                                readOnly: true,
                                onTap: () => _selectDate(context), // Open date picker on tap
                                decoration: InputDecoration(
                                  labelText: "As On",
                                  suffixIcon: Icon(Icons.calendar_today, color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(color: Colors.blue[50],thickness: 10,),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Expanded(
                              child: Text("Print bank details on invoice",style: TextStyle(fontSize: 17),)
                          ),
                          Switch(
                            value: print_bank_details,
                            onChanged: (value) {
                              setState(() {
                                print_bank_details = value;
                              });
                            },
                            activeColor: Colors.white,
                            activeTrackColor: Colors.blueAccent,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Expanded(
                              child: Text("Print UPI QR Code on invoices",style: TextStyle(fontSize: 17),)
                          ),
                          Switch(
                            value: print_UPI_qr,
                            onChanged: (value) {
                              setState(() {
                                print_UPI_qr = value;
                              });
                            },
                            activeColor: Colors.white,
                            activeTrackColor: Colors.blueAccent,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                          ),
                        ],
                      ),


                      if(print_bank_details==true && print_UPI_qr==false)
                        Column(
                          children: [
                            SizedBox(height: 10,),
                            SizedBox(
                              height:50,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Account Holder Name",
                                  hintText: "Bank Name/Account Display Name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            SizedBox(
                              height:50,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Account Number *",
                                  hintText: "Account Number *",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            SizedBox(
                              height:50,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "IFSC Code",
                                  hintText: "IFSC Code",
                                  suffix: Icon(Remix.search_2_line,color: Colors.blueAccent,),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            SizedBox(
                              height:50,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Branch Name",
                                  hintText: "Branch Name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                      if(print_UPI_qr==true && print_bank_details==false)
                        Column(
                          children: [

                            SizedBox(height: 10,),
                            SizedBox(
                              height:50,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Account Number *",
                                  hintText: "Account Number *",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),

                            SizedBox(
                              height:50,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "IFSC Code",
                                  hintText: "IFSC Code",
                                  suffix: Icon(Remix.search_2_line,color: Colors.blueAccent,),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            SizedBox(
                              height:50,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Branch Name",
                                  hintText: "Branch Name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 18.0, right: 18.0, top: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      thickness: 1, // Thickness of the line
                                      color: Colors.grey, // Color of the line
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      'or',
                                      style: TextStyle(
                                        fontSize: 17, // Font size
                                        color: Colors.grey, // Font color
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      thickness: 1, // Thickness of the line
                                      color: Colors.grey, // Color of the line
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            SizedBox(
                              height:50,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "UPI ID for QR Code (Option)",
                                  hintText: "UPI ID for QR Code (Option)",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),

                      if(print_UPI_qr==true && print_bank_details==true)
                        Column(
                          children: [
                            SizedBox(height: 10,),
                            SizedBox(
                              height:50,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Account Holder Name",
                                  hintText: "Bank Name/Account Display Name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            SizedBox(
                              height:50,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Account Number *",
                                  hintText: "Account Number *",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),

                            SizedBox(
                              height:50,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "IFSC Code",
                                  hintText: "IFSC Code",
                                  suffix: Icon(Remix.search_2_line,color: Colors.blueAccent,),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            SizedBox(
                              height:50,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Branch Name",
                                  hintText: "Branch Name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            SizedBox(
                              height:50,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "UPI ID for QR Code (Option)",
                                  hintText: "UPI ID for QR Code (Option)",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
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
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: Text("Save",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
}
