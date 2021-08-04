import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restfull_api/commons/route_generator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showPassword = true;
  bool isRemember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
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
                      Color(0x339bcd9b),
                      Color(0xb39bcd9b),
                      Color(0xdb9bcd9b),
                      Color(0xff9bcd9b),
                    ])),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 35.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      layoutEmail(),
                      SizedBox(
                        height: 20.0,
                      ),
                      layoutPassword(),
                      layoutForgotPassbtn(),
                      layoutRememberCb(),
                      layoutLoginBtn(),
                      layoutSignUpBtn()
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

  Widget layoutEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(1.0, 2.0))
              ]),
          height: 80.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black38),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff9bcd9b),
                )),
          ),
        )
      ],
    );
  }

  Widget layoutPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(1.0, 2.0))
                ]),
            height: 80.0,
            child: TextField(
              obscureText: this.showPassword,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black38),
                suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: () => setState(() {
                          this.showPassword != this.showPassword;
                        })),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff9bcd9b),
                ),
              ),
            )),
      ],
    );
  }

  Widget layoutForgotPassbtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print("Forgot Password pressed"),
        child: Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget layoutRememberCb() {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: isRemember,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    isRemember = value!;
                  });
                },
              )),
          Text('Remember me',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  Widget layoutLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 35),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(userRoute);
        },
        child: Text(
          'Login',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(15),
          primary: Color(0xff9bcd9b),
          onPrimary: Colors.white,
          elevation: 5.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  Widget layoutSignUpBtn() {
    return GestureDetector(
      onTap: () => print('Sign Up Pressed'),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Don\'t have an account?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500)),
          TextSpan(
              text: ' Sign Up',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }
}
