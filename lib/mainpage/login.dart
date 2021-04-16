import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'register_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isPc;
  bool isTab = false;
  bool isSignUp = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: LayoutBuilder(builder: (context, cnx) {
        if (cnx.maxWidth < 480) {
          isPc = false;
        } else {
          isPc = true;
          if (cnx.maxWidth < 768) {
            isTab = true;
          } else {
            isTab = false;
          }
        }
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          height: height,
          width: width,
          child: Row(
            children: [
              isPc
                  ? Expanded(
                      flex: isTab ? 3 : 7,
                      child: Image.asset(
                        'assets/Images/joi_big_logo.png',
                      ),
                    )
                  : Container(),
              isPc
                  ? VerticalDivider(
                      indent: 20.0,
                      endIndent: 20.0,
                    )
                  : Container(),
              isPc
                  ? SizedBox(
                      width: 20,
                    )
                  : Container(),
              Expanded(
                flex: isPc ? 3 : 1,
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              isSignUp = false;
                            });
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: isSignUp ? Colors.lightBlueAccent[100].withOpacity(0.5) : Colors.lightBlueAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              isSignUp = true;
                            });
                          },
                          child: Text(
                            "Sign-up",
                            style: TextStyle(
                                color: isSignUp ? Colors.lightBlueAccent : Colors.lightBlueAccent[100].withOpacity(0.5) ,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.person,
                            color: Colors.lightBlueAccent[100],
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    isSignUp ? Register() : Login(),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController conNo = TextEditingController();
  TextEditingController passW = TextEditingController();
  bool gotOtp = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome",
          style: TextStyle(color: Colors.black, fontSize: 50),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (String val) async {
              if (val.length != 10) {
                gotOtp = false;
                setState(() {});
              } else {
                gotOtp = true;

                setState(() {});
              }
            },
            controller: conNo,
            decoration: InputDecoration(
              labelText: "Contact No",
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: passW,
            enabled: gotOtp,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Password",
            ),
            obscureText: true,
          ),
        ),
        SizedBox(
          height: 150,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Forgot Password?",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async {
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
