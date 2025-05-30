import 'package:country_picker/country_picker.dart';
import 'package:demo/Home/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Services/auth_service.dart';
import '../main.dart';
import 'dart:async';

///sign up with email and password
class Sign_Up extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUp();
}
class SignUp extends State<Sign_Up> {
  TextEditingController name_controller = TextEditingController();
  FocusNode name_focusnode = FocusNode();
  bool is_name_focused = false;

  TextEditingController email_controller = TextEditingController();
  FocusNode email_focusnode = FocusNode();
  bool is_email_focused = false;


  TextEditingController password_controller = TextEditingController();
  FocusNode password_focusnode = FocusNode();
  bool is_password_focused = false;

  Color _buttonColor = Colors.grey;

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    name_focusnode.addListener(() {
      setState(() {
        is_name_focused = name_focusnode.hasFocus;
      });
    });

    email_focusnode.addListener(() {
      setState(() {
        is_email_focused = email_focusnode.hasFocus;
      });
    });

    password_focusnode.addListener(() {
      setState(() {
        is_password_focused = password_focusnode.hasFocus;
      });
    });

    name_controller.addListener(_updateButtonColor);
    email_controller.addListener(_updateButtonColor);
    password_controller.addListener(_updateButtonColor);

  }

  @override
  void dispose() {
    name_controller.dispose();
    email_controller.dispose();
    password_controller.dispose();

    name_focusnode.dispose();
    email_focusnode.dispose();
    password_focusnode.dispose();
    super.dispose();
  }


  void _updateButtonColor() {
    setState(() {
      if (name_controller.text.isNotEmpty &&
          email_controller.text.isNotEmpty &&
          password_controller.text.isNotEmpty) {
        _buttonColor = Color(0xFFE03537);
      } else {
        _buttonColor = Colors.grey;
      }
    });
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
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false, // This prevents keyboard overflow issues
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sign up text
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                child: Text(
                  "Sign up",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              // Sentences
              Row(
                children: [
                  Text(
                    "Get control of your business with ",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035, color: Colors.black38),
                  ),
                  Image.asset(
                    "Assets/Images/Vyapar_logo.png",
                    width: MediaQuery.of(context).size.width * 0.04,
                    height: MediaQuery.of(context).size.width * 0.04,
                    color: Colors.grey,
                  ),
                  Text(
                    " Vyapar",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              SizedBox(width: 8),
              ///name
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: TextField(
                  style: TextStyle(fontSize:MediaQuery.of(context).size.width * 0.045),
                  focusNode: name_focusnode,
                  controller: name_controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(
                      color: is_name_focused ? Colors.blueAccent : Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: is_name_focused ? Colors.blueAccent : Colors.grey,
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 1.8,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),

              ///email
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: TextField(
                  style: TextStyle(fontSize:MediaQuery.of(context).size.width * 0.045),
                  focusNode: email_focusnode,
                  controller: email_controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: is_email_focused ? Colors.blueAccent : Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: is_email_focused ? Colors.blueAccent : Colors.grey,
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 1.8,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),

              ///password
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: TextField(
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                  ),
                  focusNode: password_focusnode,
                  controller: password_controller,
                  obscureText: _obscureText,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: is_password_focused ? Colors.blueAccent : Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: is_password_focused ? Colors.blueAccent : Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 1.8,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.065),

              //Get otp button
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _buttonColor,
                  ),
                  onPressed: () async {
                    if (name_controller.text.isNotEmpty &&
                        email_controller.text.isNotEmpty &&
                        password_controller.text.isNotEmpty) {
                      String result = await AuthService().register(
                        name_controller.text.trim(),
                        email_controller.text.trim(),
                        password_controller.text,
                      );

                      print("Result from AuthService: $result");

                      if (result.toLowerCase().contains("success")) {
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Registration successful!")),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(result)),
                        );
                      }
                    }
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already registered? ",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigate to login page
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
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
        ),
      ),
    );
  }
}


///Login
class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Login();
}
class _Login extends State<Login>{

  TextEditingController email_controller = TextEditingController();
  FocusNode email_focusnode = FocusNode();
  bool is_email_focused = false;


  TextEditingController password_controller = TextEditingController();
  FocusNode password_focusnode = FocusNode();
  bool is_password_focused = false;

  Color _buttonColor = Colors.grey;

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();

    email_focusnode.addListener(() {
      setState(() {
        is_email_focused = email_focusnode.hasFocus;
      });
    });

    password_focusnode.addListener(() {
      setState(() {
        is_password_focused = password_focusnode.hasFocus;
      });
    });

    email_controller.addListener(_updateButtonColor);
    password_controller.addListener(_updateButtonColor);

  }

  @override
  void dispose() {
    email_controller.dispose();
    password_controller.dispose();

    email_focusnode.dispose();
    password_focusnode.dispose();
    super.dispose();
  }


  void _updateButtonColor() {
    setState(() {
      if (email_controller.text.isNotEmpty &&
          password_controller.text.isNotEmpty) {
        _buttonColor = Color(0xFFE03537);
      } else {
        _buttonColor = Colors.grey;
      }
    });
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
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false, // This prevents keyboard overflow issues
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Login
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              // Sentences
              Row(
                children: [
                  Text(
                    "Get control of your business with ",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035, color: Colors.black38),
                  ),
                  Image.asset(
                    "Assets/Images/Vyapar_logo.png",
                    width: MediaQuery.of(context).size.width * 0.04,
                    height: MediaQuery.of(context).size.width * 0.04,
                    color: Colors.grey,
                  ),
                  Text(
                    " Vyapar",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              SizedBox(width: 8),

              ///email
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: TextField(
                  style: TextStyle(fontSize:MediaQuery.of(context).size.width * 0.045),
                  focusNode: email_focusnode,
                  controller: email_controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: is_email_focused ? Colors.blueAccent : Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: is_email_focused ? Colors.blueAccent : Colors.grey,
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 1.8,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),

              ///password
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: TextField(
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                  ),
                  focusNode: password_focusnode,
                  controller: password_controller,
                  obscureText: _obscureText,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: is_password_focused ? Colors.blueAccent : Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: is_password_focused ? Colors.blueAccent : Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 1.8,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.065),

              //Login button
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _buttonColor,
                  ),
                  onPressed: () async {
                    print("Login button pressed");

                    if (email_controller.text.isNotEmpty && password_controller.text.isNotEmpty) {
                      print("Email and password are filled");
                      String result = await AuthService().login(
                        email_controller.text.trim(),
                        password_controller.text,
                      );
                      print("Login Result: $result");

                      if (result.trim() == "User login successfully") {
                        print("Login Success");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage(title: "aapka vyapar")),
                        );
                      } else {
                        print("Login failed");
                      }
                    } else {
                      print("Empty fields");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please enter email and password")),
                      );
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>Forgot_Password()),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigate to Register Page
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Sign_Up()), // Replace with your RegisterPage widget
                            );
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
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
        ),
      ),
    );
  }
}

///Forgot password
class Forgot_Password extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Forgot_Password();
}
class _Forgot_Password extends State<Forgot_Password>{

  TextEditingController email_controller = TextEditingController();
  FocusNode email_focusnode = FocusNode();
  bool is_email_focused = false;

  Color _buttonColor = Colors.grey;


  @override
  void initState() {
    super.initState();

    email_focusnode.addListener(() {
      setState(() {
        is_email_focused = email_focusnode.hasFocus;
      });
    });

    email_controller.addListener(_updateButtonColor);

  }

  @override
  void dispose() {
    email_controller.dispose();
    email_focusnode.dispose();
    super.dispose();
  }


  void _updateButtonColor() {
    setState(() {
      if (email_controller.text.isNotEmpty) {
        _buttonColor = Color(0xFFE03537);
      } else {
        _buttonColor = Colors.grey;
      }
    });
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
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false, // This prevents keyboard overflow issues
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Login
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              // Sentences
              Row(
                children: [
                  Text(
                    "Get control of your business with ",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035, color: Colors.black38),
                  ),
                  Image.asset(
                    "Assets/Images/Vyapar_logo.png",
                    width: MediaQuery.of(context).size.width * 0.04,
                    height: MediaQuery.of(context).size.width * 0.04,
                    color: Colors.grey,
                  ),
                  Text(
                    " Vyapar",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              SizedBox(width: 8),

              ///email
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: TextField(
                  style: TextStyle(fontSize:MediaQuery.of(context).size.width * 0.045),
                  focusNode: email_focusnode,
                  controller: email_controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: is_email_focused ? Colors.blueAccent : Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: is_email_focused ? Colors.blueAccent : Colors.grey,
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 1.8,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),


              SizedBox(height: MediaQuery.of(context).size.height * 0.065),

              //Get otp button
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _buttonColor,
                  ),
                  onPressed: () async {
                    String email = email_controller.text.trim();

                    if (email.isNotEmpty) {
                      String result = await AuthService().sendOtpToEmail(email);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            result == "success" ? "OTP sent successfully!" : result,
                          ),
                          backgroundColor:Colors.green,
                        ),
                      );
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Verifying_Otp(email: email,)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please enter a valid email."),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Get Otp",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),

            ],
          ),
        ),
      ),
    );
  }
}

///verify OTP
class Verifying_Otp extends StatefulWidget {
  String email;
  Verifying_Otp({Key? key,required this.email}) : super(key: key);

  @override
  State<StatefulWidget> createState() => VerifyingOtp(email: this.email);
}
class VerifyingOtp extends State<Verifying_Otp> {
  String email;
  VerifyingOtp({required this.email});

  TextEditingController _OtpController = TextEditingController();
  FocusNode _OtpFocusNode = FocusNode();

  int _countdown = 30;
  Timer? _timer;
  bool _isResendButtonEnabled = false;


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _OtpFocusNode.requestFocus();
    });
    _startCountdown();
  }

  void _startCountdown() {
    setState(() {
      _countdown = 30;
      _isResendButtonEnabled = false;
    });

    _timer?.cancel(); // Changed from Games() to cancel()
    _timer = Timer.periodic(Duration(seconds: 1), (timer) { // Fixed the syntax here
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _isResendButtonEnabled = true;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text(
                  "Verifying Otp",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  focusNode: _OtpFocusNode,
                  controller: _OtpController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Otp",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent, // Focused border color
                        width: 1.8,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text(
                  "Resend Otp in ${_countdown}s",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () async {
                    String otp = _OtpController.text.trim();

                    if (email.isNotEmpty && otp.isNotEmpty) {
                      try {
                        int otpAsInt = int.parse(otp);
                        String result = await AuthService().verifyOtp(email, otpAsInt);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              result == "success" ? "OTP verified successfully!" : result,
                            ),
                            backgroundColor: result == "success" ? Colors.green : Colors.red,
                          ),
                        );

                        if (result == "success") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Reset_Password()),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("OTP must be numeric."),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Enter both email and OTP."),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Verify Otp",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


///reset password
class Reset_Password extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ResetPassword();
}
class ResetPassword extends State<Reset_Password> {

  TextEditingController email_controller = TextEditingController();
  FocusNode email_focusnode = FocusNode();
  bool is_email_focused = false;


  TextEditingController password_controller = TextEditingController();
  FocusNode password_focusnode = FocusNode();
  bool is_password_focused = false;

  Color _buttonColor = Colors.grey;

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    email_focusnode.addListener(() {
      setState(() {
        is_email_focused = email_focusnode.hasFocus;
      });
    });

    password_focusnode.addListener(() {
      setState(() {
        is_password_focused = password_focusnode.hasFocus;
      });
    });

    email_controller.addListener(_updateButtonColor);
    password_controller.addListener(_updateButtonColor);

  }

  @override
  void dispose() {
    email_controller.dispose();
    password_controller.dispose();

    email_focusnode.dispose();
    password_focusnode.dispose();
    super.dispose();
  }


  void _updateButtonColor() {
    setState(() {
      if (email_controller.text.isNotEmpty &&
          password_controller.text.isNotEmpty) {
        _buttonColor = Color(0xFFE03537);
      } else {
        _buttonColor = Colors.grey;
      }
    });
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
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false, // This prevents keyboard overflow issues
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sign up text
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                child: Text(
                  "Reset Password",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              // Sentences
              Row(
                children: [
                  Text(
                    "Get control of your business with ",
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035, color: Colors.black38),
                  ),
                  Image.asset(
                    "Assets/Images/Vyapar_logo.png",
                    width: MediaQuery.of(context).size.width * 0.04,
                    height: MediaQuery.of(context).size.width * 0.04,
                    color: Colors.grey,
                  ),
                  Text(
                    " Vyapar",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              SizedBox(width: 8),
              ///email
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: TextField(
                  style: TextStyle(fontSize:MediaQuery.of(context).size.width * 0.045),
                  focusNode: email_focusnode,
                  controller: email_controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: is_email_focused ? Colors.blueAccent : Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: is_email_focused ? Colors.blueAccent : Colors.grey,
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 1.8,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),

              ///new password
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: TextField(
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                  ),
                  focusNode: password_focusnode,
                  controller: password_controller,
                  obscureText: _obscureText,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: is_password_focused ? Colors.blueAccent : Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: is_password_focused ? Colors.blueAccent : Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 1.8,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.065),

              //Get otp button
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _buttonColor,
                  ),
                  onPressed: () async {
                    if (email_controller.text.isNotEmpty &&
                        password_controller.text.isNotEmpty) {
                      String result = await AuthService().resetPassword(email_controller.text.trim(),password_controller.text.trim());
                      print("Result from AuthService: $result");

                      if (result.toLowerCase().contains("success")) {
                        if (!mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Reset Password successful!")),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(result)),
                        );
                      }
                    }
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            ],
          ),
        ),
      ),
    );
  }
}