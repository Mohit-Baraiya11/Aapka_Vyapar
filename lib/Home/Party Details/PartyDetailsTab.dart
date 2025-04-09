import 'package:demo/Home/Party%20Details/Show%20All/Party_Details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Home.dart';
import 'Add_new_party.dart';
import 'Import_Party.dart';
import 'Party_Statement.dart';
import 'Party_Transaction.dart';
import 'Show All/all_parties_report.dart';

class PartyDetailsTab extends StatefulWidget
{
  @override
  State<StatefulWidget> createState()=>_PartyDetailsTab();
}


class _PartyDetailsTab extends State<PartyDetailsTab> {

  void sendWhatsAppMessage(String phoneNumber, String message) async {
    final url = "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";

    print("Trying to launch: $url"); // Debugging log

    if (await canLaunchUrl(Uri.parse(url))) {
      bool launched = await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      if (!launched) {
        print("Failed to launch WhatsApp.");
      }
    } else {
      print("Could not launch WhatsApp. Check URL format.");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      child: Stack(
        children:[
          Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)),
                  padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
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
                            icon: Remix.account_box_line,
                            label: "Import Party",
                            backgroundColor: Colors.lightBlue,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Import_Party()));
                            },
                          ),
                          QuickLink(
                            backgroundColor: Colors.lightBlue,
                            icon: Remix.contacts_line,
                            label: "Party Statement",
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Party_Statement()));
                            },
                          ),
                          QuickLink(
                            backgroundColor: Colors.lightBlue,
                            icon: Remix.settings_2_line,
                            label: "Party settings",
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Party_Settings()));
                            },
                          ),
                          QuickLink(
                            backgroundColor: Colors.lightBlue,
                            icon: Remix.arrow_right_circle_line,
                            label: "Show All",
                            onTap: () {
                              double screenWidth = MediaQuery.of(context).size.width;
                              double screenHeight = MediaQuery.of(context).size.height;
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: screenHeight * 0.3,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 18.0, top: 8.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "More Options",
                                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                                          GridView.builder(
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              childAspectRatio: 1.5,
                                            ),
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  if (index == 1) {
                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => All_Parties_Report()));
                                                  }
                                                },
                                                child: QuickLink(
                                                  icon: iconOf_party_detail_show_all[index],
                                                  label: labelOf_iconOf_party_detail_show_all[index],
                                                  backgroundColor: default_color,
                                                ),
                                              );
                                            },
                                            itemCount: labelOf_iconOf_party_detail_show_all.length,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
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
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        color: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            double screenWidth = MediaQuery.of(context).size.width;
                            double screenHeight = MediaQuery.of(context).size.height;
                            showModalBottomSheet(
                              backgroundColor: Colors.white,
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return Container(
                                  height: screenHeight * 0.40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("More Options",
                                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                                            IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.close)),
                                          ],
                                        ),
                                      ),
                                      Divider(thickness: 0.5, height: 1),
                                      ListTile(
                                        dense: true,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                        title: Text("Sort by Name [A-Z]", style: TextStyle(fontSize: 15)),
                                        trailing: Checkbox(value: false, onChanged: (bool? value) {}),
                                      ),
                                      Divider(thickness: 0.5, height: 1),
                                      GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                            backgroundColor: Colors.white,
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Container(
                                                color: Colors.white,
                                                child: FractionallySizedBox(
                                                  heightFactor: 0.5,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(16.0),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text("Send Reminder", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                                            IconButton(
                                                              icon: Icon(Icons.close),
                                                              onPressed: () => Navigator.pop(context),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(),
                                                      ListTile(
                                                        title: Text("Mohit"),
                                                        subtitle: Text("Balance: ₹500"),
                                                        trailing: ElevatedButton(
                                                          onPressed: () {
                                                            sendWhatsAppMessage("+919904598373", "Hi Mohit, please pay your pending balance.");
                                                            Navigator.pop(context);
                                                          },
                                                          child: Text("Send"),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: ListTile(
                                          dense: true,
                                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                          title: Text("Bulk Payment Reminder", style: TextStyle(fontSize: 15)),
                                          trailing: Icon(Icons.arrow_forward_ios, size: 16),
                                        ),
                                      ),
                                      Divider(thickness: 0.5, height: 1),
                                      ListTile(
                                        dense: true,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                        title: Text("Bulk Message", style: TextStyle(fontSize: 15)),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                                      ),
                                      Divider(thickness: 0.5, height: 1),
                                      ListTile(
                                        dense: true,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                        title: Text("Party Grouping", style: TextStyle(fontSize: 15)),
                                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.more_vert),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Party_Details()));
                        },
                        title: Text("Mohit", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.black)),
                        subtitle: Text("22 jan 25", style: TextStyle(fontSize: 12, color: Colors.grey)),
                        trailing: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("₹ 200", style: TextStyle(fontSize: 13, color: Color(0xFF38C782))),
                              Text("you'll get", style: TextStyle(fontSize: 13, color: Color(0xFF38C782))),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Add_new_Party()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Remix.user_3_line, color: Colors.white, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      "Add New Parties",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



var iconOf_party_detail_show_all = [
  Remix.share_line,
  Remix.building_4_line,
  Remix.notification_3_line,
  Remix.whatsapp_line
];
var labelOf_iconOf_party_detail_show_all = [
  "Invite Party",
  "All Parties Report",
  "Reminder Settings",
  "Greetings  & Offers",
];

void sendWhatsAppMessage(String phoneNumber, String message) async {
  final url = "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";

  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } else {
    print("Could not launch WhatsApp");
  }
}