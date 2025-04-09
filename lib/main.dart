import 'package:demo/Dashboard/Dashboard.dart';
import 'package:demo/Home/Notification/Notification.dart';
import 'package:demo/Menu/Menu.dart';
import 'package:demo/Settings/Settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remixicon/remixicon.dart';

import 'Home/Compony_Detail_Page/Business_Details.dart';
import 'Home/Home.dart';
import 'Items/items.dart';
import 'Splash-Screen/Splash_Screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Roboto', // Forces all text to use Roboto
      ),
      home:SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int myindex = 0;

  var arrText = [
    HomePage(),
    Dashboard(),
    ItemsPageContent(),
    Menu(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            backgroundColor: Colors.white,
            onTap: (index) {
              setState(() {
                myindex = index;
              });
            },
            currentIndex: myindex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black54,
            items: const [
              BottomNavigationBarItem(icon: Icon(Remix.home_8_line), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Remix.bar_chart_2_line), label: 'Dashboard'),
              BottomNavigationBarItem(icon: Icon(Remix.box_3_line), label: 'Items'),
              BottomNavigationBarItem(icon: Icon(Remix.menu_2_fill), label: 'Menu'),
            ],
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            bottom: 55, // Position the arrow above the icons
            left: MediaQuery.of(context).size.width / 4 * myindex +
                MediaQuery.of(context).size.width / 9 - 10,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutBack,
              width: 30, // Width of the arrow base
              height: 10, // Height of the arrow tip
              child: CustomPaint(
                painter: ArrowPainter(),
              ),
            ),
          ),
        ],
      ),

      body: Center(
        child: arrText[myindex],
      ),
    );
  }
}


// Custom AppBar Widget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.grey.shade300,
        statusBarIconBrightness: Brightness.light,
      ),
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Business_Details()));
          },
          child: Container(
            padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                border:Border.all(width: 1,color: Colors.blue),
                borderRadius: BorderRadius.circular(90),
              ),
              child: Icon(Remix.store_2_line, color: Colors.blue,size: 18,)
          ),
        ), // Replace with your store icon
      ),
      title: const Text(
        "Mohit_Store",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          icon: const Icon(Remix.notification_3_line),
          onPressed: () {
           Navigator.push(context,MaterialPageRoute(builder: (context)=>Notification_page()));
          },
        ),
        Container(
          child: IconButton(icon: Icon(Remix.settings_2_line),
            onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
            }
          ,),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}





class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, 0); // Top center
    path.lineTo(0, size.height); // Bottom left
    path.lineTo(size.width, size.height); // Bottom right
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

