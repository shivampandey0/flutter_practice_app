import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice_app/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorations,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: GoogleFonts.openSans(color: Colors.white, ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorations,
          height: 60.0,
          child: TextField(
            obscureText: true,
//            keyboardType: TextInputType.visiblePassword,
            style: GoogleFonts.openSans(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
          onPressed: () => print('Forgot Password'),
          padding: EdgeInsets.only(right: 0.0),
          child: Text(
            'Forgot Password?',
            style: kLabelStyle,
          )),
    );
  }

  Widget _buildRememberMe() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
              checkColor: Colors.green,
              activeColor: Colors.white,
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          )
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: GoogleFonts.openSans(
              color: Color(0xFF527DAA),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,),
        ),
        onPressed: () => print('Login Pressed'),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: GoogleFonts.openSans(
              color: Colors.white,
              fontWeight: FontWeight.w500,),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Sign in with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, offset: Offset(0, 2), blurRadius: 6.0),
            ],
            image: DecorationImage(image: logo)),
      ),
    );
  }

  Widget _buildSignUpBtn() {
    return GestureDetector(
      onTap: () => print('Sign UP btn Pressed'),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: 'Don\'t have an Account?',
            style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400),
          ),
          TextSpan(
            text: 'Sign Up',
            style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(() => print('Login with Facebook'),
              AssetImage('assets/logo/facebook.jpg')),
          _buildSocialBtn(() => print('Login with Google'),
              AssetImage('assets/logo/google.jpg')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: ()=>FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildForgotPasswordBtn(),
                      _buildRememberMe(),
                      _buildLoginBtn(),
                      _buildSignInWithText(),
                      _buildSocialBtnRow(),
                      _buildSignUpBtn()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
