import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool is_search = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF00557D),
            statusBarIconBrightness: Brightness.light,
          ),
        surfaceTintColor:Colors.blue.shade50,
        backgroundColor: Colors.blue.shade50,
        title: Text("Settings",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        actions: [
          if(is_search==false)
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                is_search==true;
              });
            }
         ),

          if(is_search==true)
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    is_search==false;
                  });
                }
            ),
        ]
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            ListTile(
              onTap: (){},
              dense: true,
              contentPadding: EdgeInsets.only(left: 20),
              leading: Icon(Remix.settings_line),
              title: Text("Geberal",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
              trailing: IconButton(onPressed:(){}, icon: Icon(Remix.arrow_right_s_line)),
            ),
            Divider(color: Colors.grey.shade500,),
        
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.only(left: 20),
              leading: Icon(Remix.money_rupee_circle_line),
              title: Text("Transaction",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
              trailing: IconButton(onPressed:(){}, icon: Icon(Remix.arrow_right_s_line)),
            ),
            Divider(color: Colors.grey.shade500,),
        
        
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.only(left: 20),
              leading: Icon(Remix.printer_line),
              title: Text("Invoice Print",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
              trailing: IconButton(onPressed:(){}, icon: Icon(Remix.arrow_right_s_line)),
            ),
            Divider(color: Colors.grey.shade500,),
        
        
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.only(left: 20),
              leading: Icon(Remix.discount_percent_line),
              title: Text("Taxes & GST",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
              trailing: IconButton(onPressed:(){}, icon: Icon(Remix.arrow_right_s_line)),
            ),
            Divider(color: Colors.grey.shade500,),
        
        
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.only(left: 20),
              leading: Icon(Remix.group_3_line),
              title: Text("User management",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
              trailing: IconButton(onPressed:(){}, icon: Icon(Remix.arrow_right_s_line)),
            ),
            Divider(color: Colors.grey.shade500,),
        
        
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.only(left: 20),
              leading: Icon(Remix.message_2_fill),
              title: Text("Transaction SMS",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
              trailing: IconButton(onPressed:(){}, icon: Icon(Remix.arrow_right_s_line)),
            ),
            Divider(color: Colors.grey.shade500,),
        
        
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.only(left: 20),
              leading: Icon(Remix.notification_3_line),
              title: Text("Reminder",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
              trailing: IconButton(onPressed:(){}, icon: Icon(Remix.arrow_right_s_line)),
            ),
            Divider(color: Colors.grey.shade500,),
        
        
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.only(left: 20),
              leading: Icon(Remix.map_pin_user_fill),
              title: Text("Party",style:TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
              trailing: IconButton(onPressed:(){}, icon: Icon(Remix.arrow_right_s_line)),
            ),
            Divider(color: Colors.grey.shade500,),
        
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.only(left: 20),
              leading: Icon(Remix.slideshow_line),
              title: Text("Item",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
              trailing: IconButton(onPressed:(){}, icon: Icon(Remix.arrow_right_s_line)),
            ),
            Divider(color: Colors.grey.shade500,),
        
          ],
        ),
      ),
    );
  }
}
