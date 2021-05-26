import 'package:apartment_service/widgets/copyright_footer.dart';
import 'package:apartment_service/widgets/login_text_field.dart';
import 'package:apartment_service/widgets/social_button.dart';
import 'package:apartment_service/widgets/terms_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/apartment.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 90, left: 20),
                  color: Color(0x191970).withOpacity(.85),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Welcome to ",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.yellow[700],
                          ),
                          children: [
                            TextSpan(
                              text: "NASS",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        isSignupScreen
                            ? "Signup to Continue"
                            : "Login to Continue",
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(microseconds: 700),
            curve: Curves.bounceOut,
            top: isSignupScreen ? 200 : 250,
            child: AnimatedContainer(
              duration: Duration(microseconds: 700),
              curve: Curves.bounceOut,
              padding: EdgeInsets.only(top: 20),
              height: isSignupScreen ? 390 : 310,
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen
                                      ? Colors.grey[400]
                                      : Colors.black,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                height: isSignupScreen ? 0 : 2,
                                width: 100,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen
                                      ? Colors.black
                                      : Colors.grey[400],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                height: isSignupScreen ? 2 : 0,
                                width: 100,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (isSignupScreen) buildSignupSection(),
                    if (!isSignupScreen) buildLoginSection(),
                    Container(
                      margin: EdgeInsets.all(5),
                      width: 120,
                      child: SocialButton(
                        name: "Continue",
                        background: Colors.green,
                        icon: Icon(CommunityMaterialIcons.arrow_right_bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height - 150,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text(
                  "Or Continue with",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SocialButton(
                      name: "Facebook",
                      background: Colors.blue[900],
                      icon: Icon(CommunityMaterialIcons.facebook),
                    ),
                    SocialButton(
                      name: "Google",
                      background: Colors.red[900],
                      icon: Icon(CommunityMaterialIcons.google),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CopyrightFooter(),
        ],
      ),
    );
  }

  Container buildLoginSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          LoginTextField(
            icon: CommunityMaterialIcons.email_outline,
            hintText: "Email",
            inputType: TextInputType.emailAddress,
          ),
          LoginTextField(
            icon: CommunityMaterialIcons.lock_outline,
            hintText: "Password",
            inputType: TextInputType.text,
            isPassword: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = !isRememberMe;
                      });
                    },
                  ),
                  Text(
                    "Remember me",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot password?",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          LoginTextField(
            icon: CommunityMaterialIcons.account_outline,
            hintText: "Username",
            inputType: TextInputType.text,
          ),
          LoginTextField(
            icon: CommunityMaterialIcons.email_outline,
            hintText: "Email",
            inputType: TextInputType.emailAddress,
          ),
          LoginTextField(
            icon: CommunityMaterialIcons.lock_outline,
            hintText: "Password",
            inputType: TextInputType.text,
            isPassword: true,
          ),
          Container(
            width: 210,
            margin: EdgeInsets.only(
              top: 20,
              bottom: 10,
            ),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "By pressing 'Continue' you agree to our ",
                style: TextStyle(
                  color: Colors.black54,
                ),
                children: [
                  TextSpan(
                    text: "terms and conditions",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.orange,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return TermsDialog();
                          },
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
