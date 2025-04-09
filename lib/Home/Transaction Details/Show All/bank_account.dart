
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'add_bank_account.dart';

class Bank_Account extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>BankAccount();
}

class BankAccount extends State<Bank_Account>
{
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade300,
          statusBarIconBrightness: Brightness.light,
        ),
        surfaceTintColor: Colors.white,
        title: Text("Bank Accounts"),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Top Image
            Container(
              color: Colors.deepPurple,
              width: double.infinity,
              child: Image.asset(
                "Assets/Images/banking.png",
                fit: BoxFit.contain,
              ),
            ),
            // Main Options
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // First Option
                    _buildOptionCard(
                      icon: Icons.account_balance,
                      iconColor: Colors.deepOrangeAccent,
                      title: "Add your bank & record all your bank transactions",
                    ),
                    SizedBox(height: 16),
                    // Second Option
                    _buildOptionCard(
                      icon: Icons.qr_code_scanner,
                      iconColor: Colors.green,
                      title: "Get payments into your bank account via QR code.",
                    ),
                    SizedBox(height: 16),
                    // Video Section
                  ],
                ),
              ),
            ),
            // Bottom Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_Bank_Account()));
                },
                icon: Icon(Icons.add,color: Colors.white,),
                label: Text("Add Bank",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard({required IconData icon, required Color iconColor, required String title,})
  {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
    
  }
}
