import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:flutter_firebase/features/user_auth/presentation/pages/login_page.dart';
import 'package:flutter_firebase/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:flutter_firebase/global/common/toast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  bool isSigningUp = false;

  String gender = 'Male';
  String birthday_year = "2000";
  String? birthday_month = "May";
  String birthday_day = "3";

  int currentYear = DateTime.now().year;
  List<String> yearList = [];
  List<String> monthList = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  List<String> dayList = [];

  void initState() {
    super.initState();
    int currentYear = DateTime.now().year;
    for (int i = currentYear - 50; i <= currentYear + 50; i++) {
      yearList.add('${i}');
    }
    for (int i = 1; i <= 31; i++) {
      dayList.add('${i}');
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
/*
  void _gotologin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
*/
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            padding:
                EdgeInsets.fromLTRB(30 * fem, 144 * fem, 25 * fem, 180 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1, 0),
                end: Alignment(1, 0),
                colors: <Color>[
                  Color(0xff2af598),
                  Color.fromARGB(255, 19, 114, 173)
                ],
                stops: <double>[0, 1],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                          0 * fem,
                          0 * fem,
                          96.33 * fem,
                          0.33 * fem,
                        ),
                        width: 33.33 * fem,
                        height: 33.33 * fem,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          iconSize: 30,
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                        ),
                      ),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FormContainerWidget(
                    controller: _usernameController,
                    hintText: "First Name",
                    isPasswordField: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FormContainerWidget(
                    controller: lastname,
                    hintText: "Last Name",
                    isPasswordField: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FormContainerWidget(
                    controller: _emailController,
                    hintText: "Email",
                    isPasswordField: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FormContainerWidget(
                    controller: _passwordController,
                    hintText: "Password",
                    isPasswordField: true,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(
                          20 * fem, 0 * fem, 0 * fem, 4 * fem),
                      child: Row(
                        children: [
                          Text('Gender :'),
                          Radio(
                              value: 'Male',
                              groupValue: gender,
                              onChanged: (val) {
                                setState(() {
                                  gender = val as String;
                                });
                              }),
                          Text('Male'),
                          Radio(
                              value: 'Female',
                              groupValue: gender,
                              onChanged: (val) {
                                setState(() {
                                  gender = val as String;
                                });
                              }),
                          Text('Female')
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        20 * fem, 15 * fem, 220 * fem, 1 * fem),
                    child: Text(
                      'Birthday',
                      style: TextStyle(
                        fontSize: 25 * ffem,
                        fontWeight: FontWeight.w900,
                        height: 1.2125 * ffem / fem,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 30 * fem),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        DropdownButton(
                          value: birthday_year,
                          items: yearList.map((val) {
                            return DropdownMenuItem(
                                child: Text('${val}'), value: val);
                          }).toList(),
                          onChanged: (val) => setState(
                            () {
                              birthday_year = val as String;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        DropdownButton(
                          value: birthday_month,
                          items: monthList.map((val) {
                            return DropdownMenuItem(
                                child: Text(val), value: val);
                          }).toList(),
                          onChanged: (val) => setState(
                            () {
                              birthday_month = val as String;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        DropdownButton(
                          value: birthday_day,
                          items: dayList.map((val) {
                            return DropdownMenuItem(
                                child: Text('${val}'), value: val);
                          }).toList(),
                          onChanged: (val) => setState(
                            () {
                              birthday_day = val as String;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _signUp();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 49, 211, 8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                          child: isSigningUp
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                                (route) => false);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 0, 0),
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 50 * fem, 50 * fem, 30 * fem),
                      padding: EdgeInsets.only(bottom: 10, left: 100, top: 20),
                      child: Row(
                        children: [
                          Image.asset(
                            'images/leaf1.png',
                            width: 41.67 * fem,
                            height: 39.58 * fem,
                          ),
                          Text(
                            'Sprout',
                            style: TextStyle(
                              fontSize: 35 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      isSigningUp = true;
    });

    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(
      email,
      password,
      _usernameController.text,
      lastname.text,
      gender,
      birthday_year,
      birthday_month!,
      birthday_day,
    );

    setState(() {
      isSigningUp = false;
    });
    if (user != null) {
      showToast(message: "User is successfully created");
      Navigator.pushNamed(context, "/home");
    } else {
      showToast(message: "Some error happend");
    }
  }
}
