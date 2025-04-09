import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';
import 'Party_Additional_Fields.dart';

class Party_Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PartySettings();
}

class PartySettings extends State<Party_Settings> {
  bool GSTN_NUMBER = true;
  bool Party_Grouping = false;

  bool Party_shippping_address = false;
  bool invite_parties = true;
  bool Loyalty_Points = false;


  String shareTransactionAs = "Ask me Everytime";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade300,
          statusBarIconBrightness: Brightness.light,
        ),
        surfaceTintColor: Colors.white,
        title: Text(
          "Party",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFDAE7F2),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [

            buildSwitchTile("GSTN Number", GSTN_NUMBER, (val) {
              setState(() => GSTN_NUMBER = val);
            }),
            buildSwitchTile("Party Grouping", Party_Grouping, (val) {
              setState(() => Party_Grouping = val);
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Party_Additional_Fields()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text("Invite parties to add themselves")),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Remix.arrow_right_line)
                    ),
                  ],
                ),
              ),
            ),

            buildSwitchTile("Party Addition Fields", Party_shippping_address, (val) {
              setState(() => Party_shippping_address = val);
            }),
            buildSwitchTile("Party Shipping Address", invite_parties, (val) {
              setState(() => invite_parties = val);
            }),
            buildSwitchTile("Loyalty Points", Loyalty_Points, (val) {
              setState(() => Loyalty_Points = val);
            }),
          ],
        ),
      ),
    );
  }


  Widget buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(title)),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: Colors.blue.shade300,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey.shade400,
            trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
          ),

        ],
      ),
    );
  }

}
