import 'dart:ffi';
import 'package:flutter_firebase/features/user_auth/presentation/pages/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../global/common/toast.dart';
import 'dart:convert';

import 'dart:ui';

int id_user = 0;

//['January','February','March','April','May','June','July','August','September','October','November','December'];

List<List> gardenuser = [
  [0, 'Garden Olive', 0, 'olive', '10', '2002', 'January', '1'],
  [0, 'Garden Orange', 1, 'orange', '15', '2002', 'February', '1'],
  [0, 'GardenCactus', 2, 'cactus', '50', '2002', 'March', '1'],
  [0, 'Garden Pear', 3, 'pear', '20', '2002', 'April', '1'],
  [0, 'Garden Fig', 4, 'fig', '5', '2002', 'May', '1'],
];
int selectedIndex = 0;
List<List> garden_key = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    garden_key.clear();
    selectedIndex = 0;
    for (int i = 0; i < gardenuser.length; i++) {
      if (gardenuser[i][0] == id_user) garden_key.add(gardenuser[i]);
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (index == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else if (index == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => alert()));
      } else if (index == 2) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => add()));
      } else if (index == 3) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => store()));
      } else if (index == 4) {
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => information()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Home',
          style: TextStyle(
            fontSize: 24 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.2125 * ffem / fem,
            color: Color(0xff000000),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: garden_key.length,
        itemBuilder: (context, index) {
          return Container(
              padding: EdgeInsets.all(10), // Padding around each notification
              margin:
                  EdgeInsets.only(bottom: 5), // Small space between each item
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border(
                    bottom: BorderSide(
                        color: Colors.grey.shade300)), // Underline each item
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: Image.asset(
                      'images/begin2.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${garden_key[index][1]}',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.green[10],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ID              : ${garden_key[index][2]}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Type         : ${garden_key[index][3]}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Number   : ${garden_key[index][4]}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Date 1st   : ${garden_key[index][5]}/${garden_key[index][6]}/${garden_key[index][7]}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ));
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('MACHTAL Q',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            ListTile(
              title: const Text('Setting'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => setting()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'alert'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'add'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'store'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'information'),
        ],
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////

class alert extends StatefulWidget {
  @override
  _alertState createState() => _alertState();
}

class _alertState extends State<alert> {
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (index == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else if (index == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => alert()));
      } else if (index == 2) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => add()));
      } else if (index == 3) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => store()));
      } else if (index == 4) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => information()));
      }
    });
  }

  List<String> items = [
    "You will update the app next week and confirm the app update to get you all new",
    "Don't forget to irrigate plants ",
    "Providing fertilizer for the plant increases its productivity",
    "You can grow aloe vera in march or September months",
    'Take care of your garden flowers every day because they are beautiful',
    'Dont forget to till the Earth',
    'Fertilizing the ground increases soil fertility and this benefits the plant',
    'Good to trim trees',
    'Provide the appropriate amount of water and fertilizer needs and adequately expose them to sunlight. If more than that, they may kill a plant.',
    'Its good to have bees at tree flowers because they pollinate them.',

    // ... add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Alert',
          style: TextStyle(
            fontSize: 24 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.2125 * ffem / fem,
            color: Color(0xff000000),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(10), // Padding around each notification
            margin: EdgeInsets.only(bottom: 5), // Small space between each item
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                      color: Colors.grey.shade300)), // Underline each item
            ),
            child: Text(
              items[index],
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Qussay Agbaria'),
            ),
            ListTile(
              title: const Text('Setting'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => setting()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'alert'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'add'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'store'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'information'),
        ],
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

//********************************************************************
int garden_number_list = 10;
//id_user -> key
//gardenuser matrix

class add extends StatefulWidget {
  @override
  _addState createState() => _addState();
}

class _addState extends State<add> {
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

  String name_the_garden = '';
  String number_plant_in_garden = '';
  String type_plant_in_garden = '';
  String birthday_year = "2000";
  String? birthday_month = "May";
  String birthday_day = "3";

  void _gotologin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (index == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else if (index == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => alert()));
      } else if (index == 2) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => add()));
      } else if (index == 3) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => store()));
      } else if (index == 4) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => information()));
      }
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Add',
          style: TextStyle(
            fontSize: 24 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.2125 * ffem / fem,
            color: Color(0xff000000),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        initialValue: name_the_garden,
                        onChanged: (value) {
                          setState(() {
                            name_the_garden = value.toString();
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Garden Name',
                            hintText: 'Enter Garden Name'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a garden name';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            name_the_garden = value.toString();
                          });
                        },
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        initialValue: type_plant_in_garden,
                        onChanged: (value) {
                          setState(() {
                            type_plant_in_garden = value.toString();
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Type Garden',
                            hintText: 'Enter Type Garden '),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a type garden';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            type_plant_in_garden = value.toString();
                          });
                        },
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        initialValue: number_plant_in_garden,
                        onChanged: (value) {
                          setState(() {
                            number_plant_in_garden = value.toString();
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Number plants in garden',
                            hintText: 'Enter Number plants in garden'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter number plants in garden';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            number_plant_in_garden = value.toString();
                          });
                        },
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        5 * fem, 5 * fem, 210 * fem, 1 * fem),
                    child: Text(
                      'First day planting',
                      style: TextStyle(
                        fontSize: 25 * ffem,
                        fontWeight: FontWeight.bold,
                        height: 1.2125 * ffem / fem,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                  Container(
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Done Submit Report")));
                            print('Successfully add the state.');

                            List<dynamic> a_garden = [];
                            a_garden.add(id_user); //ok
                            a_garden.add(name_the_garden);
                            a_garden.add(garden_number_list);
                            a_garden.add(type_plant_in_garden);
                            a_garden.add(number_plant_in_garden);
                            a_garden.add(birthday_year);
                            a_garden.add(birthday_month);
                            a_garden.add(birthday_day);
                            garden_number_list = garden_number_list + 1;
                            gardenuser.add(a_garden);
                            print(a_garden);
                            _formKey.currentState!.reset();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }
                        },
                        child: Text(
                          '+',
                          style: TextStyle(fontSize: 30, color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green, // Background color
                            elevation: 10,
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 10),
                            shape: RoundedRectangleBorder(
                              // Square shape with rounded corners
                              borderRadius: BorderRadius.circular(
                                  10), // Adjust the radius here
                            ))),
                  ),
                ],
              ))),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Qussay Agbaria'),
            ),
            ListTile(
              title: const Text('Setting'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => setting()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'alert'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'add'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'store'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'information'),
        ],
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

//***************************************************************

class store extends StatefulWidget {
  @override
  _storeState createState() => _storeState();
}

class _storeState extends State<store> {
  List<dynamic> _peopleList = []; //List<dynamic>();
  void _getPeople() async {
    String peopleString =
        await DefaultAssetBundle.of(context).loadString('images/people.json');
    dynamic jsonData = json.decode(peopleString);
    if (mounted)
      setState(() {
        _peopleList = jsonData['results'];
      });
  }

  @override
  void initState() {
    super.initState();
    _getPeople();
  }

  String propercase(String input) {
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (index == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else if (index == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => alert()));
      } else if (index == 2) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => add()));
      } else if (index == 3) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => store()));
      } else if (index == 4) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => information()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Store',
          style: TextStyle(
            fontSize: 24 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.2125 * ffem / fem,
            color: Color(0xff000000),
          ),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _peopleList.length,
        itemBuilder: (BuildContext context, int i) {
          String fullName =
              "${propercase(_peopleList[i]['name']['first'])} ${propercase(_peopleList[i]['name']['last'])}";
          String phone = _peopleList[i]['phone'];
          String email = _peopleList[i]['email'];
          String location = _peopleList[i]['location'];
          return Container(
            padding:
                EdgeInsets.all(5.0), // Putting a padding around each 'card'
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  child: Image.asset(
                    'images/rosa.png',
                    height: 100,
                    width: 100,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      fullName,
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Email: $email',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'phone: $phone',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'location: $location',
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('SP_ROUT'),
            ),
            ListTile(
              title: const Text('Setting'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => setting()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'alert'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'add'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'store'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'information'),
        ],
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

//****************************************************************

class information extends StatefulWidget {
  @override
  _informationState createState() => _informationState();
}

class _informationState extends State<information> {
  List<dynamic> _peopleList = []; //List<dynamic>();
  void _getPeople() async {
    String peopleString =
        await DefaultAssetBundle.of(context).loadString('images/people.json');
    dynamic jsonData = json.decode(peopleString);
    if (mounted)
      setState(() {
        _peopleList = jsonData['results'];
      });
  }

  @override
  void initState() {
    super.initState();
    _getPeople();
  }

  String propercase(String input) {
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (index == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else if (index == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => alert()));
      } else if (index == 2) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => add()));
      } else if (index == 3) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => store()));
      } else if (index == 4) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => information()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Information',
          style: TextStyle(
            fontSize: 24 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.2125 * ffem / fem,
            color: Color(0xff000000),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(10), // Padding around each notification
                margin:
                    EdgeInsets.only(bottom: 5), // Small space between each item
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.shade300)), // Underline each item
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: Image.asset(
                        'images/leaf3.jpg',
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Olive',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.green[10],
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'information: Olive is a versatile fruit.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'environment: Mediterranean region',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'temperature: 20-30°C',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'waterAmount: Moderate',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        )
                      ],
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.all(10), // Padding around each notification
                margin:
                    EdgeInsets.only(bottom: 5), // Small space between each item
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.shade300)), // Underline each item
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: Image.asset(
                        'images/leaf3.jpg',
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Orange',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.green[10],
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'information: Orange is a versatile fruit.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'environment: Temperate regions',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'temperature: 20-30°C',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'waterAmount: Regular',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        )
                      ],
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.all(10), // Padding around each notification
                margin:
                    EdgeInsets.only(bottom: 5), // Small space between each item
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.shade300)), // Underline each item
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: Image.asset(
                        'images/leaf3.jpg',
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'lemon',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.green[10],
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'information: lemon is a versatile fruit.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'environment: Mediterranean region',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'temperature: 20-30°C',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'waterAmount: Moderate',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        )
                      ],
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.all(10), // Padding around each notification
                margin:
                    EdgeInsets.only(bottom: 5), // Small space between each item
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.shade300)), // Underline each item
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: Image.asset(
                        'images/leaf3.jpg',
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fig',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.green[10],
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'information: fig is a versatile fruit.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'environment: Mediterranean region',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'temperature: 20-30°C',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'waterAmount: Moderate',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        )
                      ],
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.all(10), // Padding around each notification
                margin:
                    EdgeInsets.only(bottom: 5), // Small space between each item
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.shade300)), // Underline each item
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: Image.asset(
                        'images/leaf3.jpg',
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cuctus',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.green[10],
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'information: cactus is a versatile fruit.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'environment: Mediterranean region',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'temperature: 20-30°C',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'waterAmount: Moderate',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        )
                      ],
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.all(10), // Padding around each notification
                margin:
                    EdgeInsets.only(bottom: 5), // Small space between each item
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.shade300)), // Underline each item
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: Image.asset(
                        'images/leaf3.jpg',
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pear',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.green[10],
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'information: pear is a versatile fruit.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'environment: Mediterranean region',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'temperature: 20-30°C',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'waterAmount: Moderate',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        )
                      ],
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.all(10), // Padding around each notification
                margin:
                    EdgeInsets.only(bottom: 5), // Small space between each item
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.shade300)), // Underline each item
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: Image.asset(
                        'images/leaf3.jpg',
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Grapes',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.green[10],
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'information: grapes is a versatile fruit.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'environment: Mediterranean region',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'temperature: 20-30°C',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'waterAmount: Moderate',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Qussay Agbaria'),
            ),
            ListTile(
              title: const Text('Setting'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => setting()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'alert'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'add'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'store'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'information'),
        ],
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

//***************************************************************

class setting extends StatefulWidget {
  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                iconSize: 30,
                onPressed: () {
                  setState(() {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  });
                },
              ),
              Container(
                // settingH3X (1:271)
                margin: EdgeInsets.fromLTRB(10 * fem, 0, 0, 15 * fem),
                child: Text(
                  'Setting',
                  style: TextStyle(
                    fontSize: 24 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2125 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => profile()),
                        );
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 10 * fem),
                      padding: EdgeInsets.fromLTRB(
                          26 * fem, 18 * fem, 235 * fem, 20.33 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20 * fem),
                        gradient: LinearGradient(
                          begin: Alignment(-1, 0),
                          end: Alignment(1, 0),
                          colors: <Color>[Color(0xff84fab0), Color(0xff8fd3f4)],
                          stops: <double>[0, 1],
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 19.33 * fem, 0 * fem),
                            width: 41.67 * fem,
                            height: 41.67 * fem,
                            child: Icon(Icons.man),
                          ),
                          Container(
                            // profileJPs (1:273)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 3.67 * fem),
                            child: Text(
                              'Profile',
                              style: TextStyle(
                                fontSize: 24 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xff2c2c2c),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => security()),
                        );
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 10 * fem),
                      padding: EdgeInsets.fromLTRB(
                          26 * fem, 18 * fem, 0 * fem, 20.33 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20 * fem),
                        gradient: LinearGradient(
                          begin: Alignment(-1, 0),
                          end: Alignment(1, 0),
                          colors: <Color>[Color(0xff84fab0), Color(0xff8fd3f4)],
                          stops: <double>[0, 1],
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 19.33 * fem, 0 * fem),
                            width: 41.67 * fem,
                            height: 41.67 * fem,
                            child: Icon(Icons.shield),
                          ),
                          Container(
                            // profileJPs (1:273)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 3.67 * fem),
                            child: Text(
                              'Security',
                              style: TextStyle(
                                fontSize: 24 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xff2c2c2c),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => aboutus()),
                        );
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 10 * fem),
                      padding: EdgeInsets.fromLTRB(
                          26 * fem, 18 * fem, 0 * fem, 20.33 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20 * fem),
                        gradient: LinearGradient(
                          begin: Alignment(-1, 0),
                          end: Alignment(1, 0),
                          colors: <Color>[Color(0xff84fab0), Color(0xff8fd3f4)],
                          stops: <double>[0, 1],
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 19.33 * fem, 0 * fem),
                            width: 41.67 * fem,
                            height: 41.67 * fem,
                            child: Icon(Icons.account_balance),
                          ),
                          Container(
                            // profileJPs (1:273)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 3.67 * fem),
                            child: Text(
                              'About us',
                              style: TextStyle(
                                fontSize: 24 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xff2c2c2c),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => help()),
                        );
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 10 * fem),
                      padding: EdgeInsets.fromLTRB(
                          26 * fem, 18 * fem, 235 * fem, 20.33 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20 * fem),
                        gradient: LinearGradient(
                          begin: Alignment(-1, 0),
                          end: Alignment(1, 0),
                          colors: <Color>[Color(0xff84fab0), Color(0xff8fd3f4)],
                          stops: <double>[0, 1],
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 19.33 * fem, 0 * fem),
                            width: 41.67 * fem,
                            height: 41.67 * fem,
                            child: Icon(Icons.help),
                          ),
                          Container(
                            // profileJPs (1:273)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 3.67 * fem),
                            child: Text(
                              'Help',
                              style: TextStyle(
                                fontSize: 24 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xff2c2c2c),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 10 * fem),
                      padding: EdgeInsets.fromLTRB(
                          26 * fem, 18 * fem, 235 * fem, 20.33 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20 * fem),
                        gradient: LinearGradient(
                          begin: Alignment(-1, 0),
                          end: Alignment(1, 0),
                          colors: <Color>[Color(0xff84fab0), Color(0xff8fd3f4)],
                          stops: <double>[0, 1],
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 19.33 * fem, 0 * fem),
                            width: 41.67 * fem,
                            height: 41.67 * fem,
                            child: Icon(Icons.logout),
                          ),
                          Container(
                            // profileJPs (1:273)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 3.67 * fem),
                            child: Text(
                              'Log out',
                              style: TextStyle(
                                fontSize: 24 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xff2c2c2c),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}

//************************************************

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      width: double.infinity,
      child: Container(
        // profileVNy (1:172)
        width: double.infinity,
        height: 926 * fem,
        decoration: BoxDecoration(
          color: Color(0xff000000),
          borderRadius: BorderRadius.circular(35 * fem),
        ),
        child: Stack(
          children: [
            Positioned(
              // rectangle3PjF (1:173)
              left: 0 * fem,
              top: 0 * fem,
              child: Align(
                child: SizedBox(
                  width: 428 * fem,
                  height: 201 * fem,
                  child: Image.asset(
                    'images/cat.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle1V1b (1:174)
              left: 0 * fem,
              top: 158 * fem,
              child: Align(
                child: SizedBox(
                  width: 428 * fem,
                  height: 797 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15 * fem),
                      border: Border.all(color: Color(0xff888888)),
                      color: Color(0xff3affa0),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle4mzh (1:175)
              left: 4 * fem,
              top: 162 * fem,
              child: Align(
                child: SizedBox(
                  width: 420 * fem,
                  height: 761 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20 * fem),
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // ellipse1tJd (1:176)
              left: 37 * fem,
              top: 112 * fem,
              child: Align(
                child: SizedBox(
                  width: 120 * fem,
                  height: 120 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60 * fem),
                      border: Border.all(color: Color(0xff000000)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'images/sprout_icon.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // qussayagbariaNzV (1:177)
              left: 140 * fem,
              top: 265 * fem,
              child: Align(
                child: SizedBox(
                  width: 400 * fem,
                  height: 25 * fem,
                  child: Text(
                    'Qusy,Mohmad,Othmn,Moath ',
                    style: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xff3affa0),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // UGq (1:178)
              left: 230 * fem,
              top: 307 * fem,
              child: Align(
                child: SizedBox(
                  width: 146 * fem,
                  height: 25 * fem,
                  child: Text(
                    '201920202023',
                    style: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xff3affa0),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // kk9 (1:179)
              left: 290 * fem,
              top: 409 * fem,
              child: Align(
                child: SizedBox(
                  width: 22 * fem,
                  height: 25 * fem,
                  child: Text(
                    '5',
                    style: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xff3affa0),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // TPf (1:180)
              left: 290 * fem,
              top: 456 * fem,
              child: Align(
                child: SizedBox(
                  width: 13 * fem,
                  height: 25 * fem,
                  child: Text(
                    '5',
                    style: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xff3affa0),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // ktZ (1:181)
              left: 290 * fem,
              top: 358 * fem,
              child: Align(
                child: SizedBox(
                  width: 50 * fem,
                  height: 25 * fem,
                  child: Text(
                    '100',
                    style: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125 * ffem / fem,
                      color: Color.fromARGB(255, 0, 255, 132),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // plantsfEq (1:182)
              left: 51 * fem,
              top: 360 * fem,
              child: Align(
                child: SizedBox(
                  width: 58 * fem,
                  height: 25 * fem,
                  child: Text(
                    'Plants',
                    style: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // idZb7 (1:183)
              left: 51 * fem,
              top: 312 * fem,
              child: Align(
                child: SizedBox(
                  width: 20 * fem,
                  height: 25 * fem,
                  child: Text(
                    'ID',
                    style: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // namefe9 (1:184)
              left: 51 * fem,
              top: 265 * fem,
              child: Align(
                child: SizedBox(
                  width: 56 * fem,
                  height: 25 * fem,
                  child: Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // gardensN2m (1:185)
              left: 47 * fem,
              top: 412 * fem,
              child: Align(
                child: SizedBox(
                  width: 80 * fem,
                  height: 25 * fem,
                  child: Text(
                    'Gardens',
                    style: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // kindT4D (1:186)
              left: 47 * fem,
              top: 459 * fem,
              child: Align(
                child: SizedBox(
                  width: 43 * fem,
                  height: 25 * fem,
                  child: Text(
                    'Kind',
                    style: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125 * ffem / fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // kindT4D (1:186)
              left: 20 * fem,
              top: 60 * fem,
              child: Align(
                child: SizedBox(
                  width: 43 * fem,
                  height: 25 * fem,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    iconSize: 30,
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => setting()),
                        );
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    )));
  }
}

//******************************************************************************

class security extends StatefulWidget {
  @override
  _securityState createState() => _securityState();
}

class _securityState extends State<security> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                iconSize: 30,
                onPressed: () {
                  setState(() {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => setting()),
                    );
                  });
                },
              ),
              Container(
                // settingH3X (1:271)
                margin: EdgeInsets.fromLTRB(10 * fem, 0, 0, 15 * fem),
                child: Text(
                  'Security',
                  style: TextStyle(
                    fontSize: 24 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2125 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => change_password()),
                        );
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 10 * fem),
                      padding: EdgeInsets.fromLTRB(
                          26 * fem, 18 * fem, 0, 20.33 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20 * fem),
                        gradient: LinearGradient(
                          begin: Alignment(-1, 0),
                          end: Alignment(1, 0),
                          colors: <Color>[Color(0xff84fab0), Color(0xff8fd3f4)],
                          stops: <double>[0, 1],
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Change password',
                            style: TextStyle(
                              fontSize: 24 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xff2c2c2c),
                            ),
                          ),
                        ],
                      ),
                    )),
                Container(
                    padding: EdgeInsets.only(bottom: 20, left: 120, top: 20),
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
                    ))
              ],
            ),
          ),
        ));
  }
}

//******************************************************************************

class change_password extends StatefulWidget {
  const change_password({super.key});

  @override
  State<change_password> createState() => _change_passwordState();
}

class _change_passwordState extends State<change_password> {
  String _val4 = '';

  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 30,
              onPressed: () {
                setState(() {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => security()),
                  );
                });
              },
            ),
            Container(
              // settingH3X (1:271)
              margin: EdgeInsets.fromLTRB(10 * fem, 0, 0, 15 * fem),
              child: Text(
                'Change password',
                style: TextStyle(
                  fontSize: 24 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2125 * ffem / fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  initialValue: _val4,
                  onChanged: (String val) {
                    setState(() => _val4 = val as String);
                  },
                  onSaved: (String? val) {
                    print('Saved name${_val4}');
                    setState(() {
                      _val4 = val as String;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return "enter a new password";
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Write a new password",
                    labelText: "New password",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 80, top: 40),
                child: ElevatedButton(
                    child: Text("change"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Done change password")));
                        _formKey.currentState!.reset();

                        print('Successfully saved the state.');
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//******************************************************************************
class aboutus extends StatefulWidget {
  @override
  _aboutusState createState() => _aboutusState();
}

class _aboutusState extends State<aboutus> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 30,
              onPressed: () {
                setState(() {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => setting()),
                  );
                });
              },
            ),
            Container(
              // settingH3X (1:271)
              margin: EdgeInsets.fromLTRB(10 * fem, 0, 0, 15 * fem),
              child: Text(
                'About us',
                style: TextStyle(
                  fontSize: 24 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2125 * ffem / fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            // aboutuso6h (1:198)
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(35 * fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // autogrouprdxp4gq (LyWRRN8rdQsnJ1rX1QRDXP)
                  padding: EdgeInsets.fromLTRB(
                      83 * fem, 31 * fem, 101.27 * fem, 23 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // autogroupqsrbNhX (LyWQgihFLTtGWdsULpQsRb)
                        margin: EdgeInsets.fromLTRB(
                            16 * fem, 0 * fem, 20.73 * fem, 32 * fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // vectorJLH (1:210)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 26 * fem, 0 * fem),
                              width: 50 * fem,
                              height: 50 * fem,
                              child: Image.asset(
                                'images/facebook.png',
                                width: 50 * fem,
                                height: 50 * fem,
                              ),
                            ),
                            Container(
                              // link21P (1:211)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 1 * fem, 0 * fem, 0 * fem),
                              child: Text(
                                'Facbook.com',
                                style: TextStyle(
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2125 * ffem / fem,
                                  color: Color(0xff4fce91),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroupob6hjRb (LyWQpP99SgV56cqVGsob6h)
                        margin: EdgeInsets.fromLTRB(
                            17 * fem, 0 * fem, 36.73 * fem, 31 * fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // vectorfq3 (1:206)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 24 * fem, 0 * fem),
                              width: 50 * fem,
                              height: 40 * fem,
                              child: Image.asset(
                                'images/twitter.png',
                                width: 50 * fem,
                                height: 40 * fem,
                              ),
                            ),
                            Container(
                              // linkz6d (1:212)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 1 * fem, 0 * fem, 0 * fem),
                              child: Text(
                                'Twitter.com',
                                style: TextStyle(
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2125 * ffem / fem,
                                  color: Color(0xff4fce91),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroup3v8yWKs (LyWQw8SuRrKNA4QR3x3v8y)
                        margin: EdgeInsets.fromLTRB(
                            15 * fem, 0 * fem, 6.73 * fem, 33 * fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // vectorEFs (1:207)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 27 * fem, 0 * fem),
                              width: 50 * fem,
                              height: 50 * fem,
                              child: Image.asset(
                                'images/instagram.png',
                                width: 50 * fem,
                                height: 50 * fem,
                              ),
                            ),
                            Container(
                              // linkkV7 (1:213)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 3 * fem, 0 * fem, 0 * fem),
                              child: Text(
                                'Instagram.com',
                                style: TextStyle(
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2125 * ffem / fem,
                                  color: Color(0xff4fce91),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroupd3jpro3 (LyWR3dG5ZeJcSG8s4Pd3jP)
                        margin: EdgeInsets.fromLTRB(
                            15 * fem, 0 * fem, 24.73 * fem, 33 * fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // vectorysf (1:208)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 26 * fem, 0 * fem),
                              width: 50 * fem,
                              height: 40 * fem,
                              child: Image.asset(
                                'images/youtube.png',
                                width: 50 * fem,
                                height: 40 * fem,
                              ),
                            ),
                            Container(
                              // linkJ9F (1:214)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 1 * fem, 0 * fem, 0 * fem),
                              child: Text(
                                'youtube.com',
                                style: TextStyle(
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2125 * ffem / fem,
                                  color: Color(0xff4fce91),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroup3ngycvd (LyWR9Cw7aPXMBvUDur3ngy)
                        margin: EdgeInsets.fromLTRB(
                            17 * fem, 0 * fem, 23.73 * fem, 57 * fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // vectorm2q (1:209)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 24 * fem, 0 * fem),
                              width: 50 * fem,
                              height: 50 * fem,
                              child: Image.asset(
                                'images/linkedin.png',
                                width: 50 * fem,
                                height: 50 * fem,
                              ),
                            ),
                            Container(
                              // linkgfb (1:215)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 1 * fem, 0 * fem, 0 * fem),
                              child: Text(
                                'Linkedin.com',
                                style: TextStyle(
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2125 * ffem / fem,
                                  color: Color(0xff4fce91),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // sprout211C5 (1:216)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 57 * fem),
                        width: 243.73 * fem,
                        height: 250 * fem,
                        child: Image.asset(
                          'images/sprout2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 40 * fem,
                              height: 40 * fem,
                              child: Image.asset(
                                'images/leaf1.png',
                                width: 40 * fem,
                                height: 40 * fem,
                              ),
                            ),
                            Text(
                              // sproutJqP (1:205)
                              'Sprout',
                              style: TextStyle(
                                fontSize: 30 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff535353),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//*****************************************************************************

class help extends StatefulWidget {
  @override
  _helpState createState() => _helpState();
}

class _helpState extends State<help> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                iconSize: 30,
                onPressed: () {
                  setState(() {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => setting()),
                    );
                  });
                },
              ),
              Container(
                // settingH3X (1:271)
                margin: EdgeInsets.fromLTRB(10 * fem, 0, 0, 15 * fem),
                child: Text(
                  'Help',
                  style: TextStyle(
                    fontSize: 24 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2125 * ffem / fem,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => common_problem()),
                        );
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 10 * fem),
                      padding: EdgeInsets.fromLTRB(
                          26 * fem, 18 * fem, 0, 20.33 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20 * fem),
                        gradient: LinearGradient(
                          begin: Alignment(-1, 0),
                          end: Alignment(1, 0),
                          colors: <Color>[Color(0xff84fab0), Color(0xff8fd3f4)],
                          stops: <double>[0, 1],
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Common problem',
                            style: TextStyle(
                              fontSize: 24 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xff2c2c2c),
                            ),
                          ),
                        ],
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => report()),
                        );
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 10 * fem),
                      padding: EdgeInsets.fromLTRB(
                          31.25 * fem, 17.08 * fem, 211 * fem, 17.08 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20 * fem),
                        gradient: LinearGradient(
                          begin: Alignment(-1, 0),
                          end: Alignment(1, 0),
                          colors: <Color>[Color(0xff84fab0), Color(0xff8fd3f4)],
                          stops: <double>[0, 1],
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // securityAqP (1:274)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 0 * fem),
                            child: Text(
                              'Report',
                              style: TextStyle(
                                fontSize: 24 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xff2c2c2c),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                Container(
                    padding: EdgeInsets.only(bottom: 20, left: 120, top: 20),
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
                    ))
              ],
            ),
          ),
        ));
  }
}

//*****************************************************************************

class report extends StatefulWidget {
  const report({super.key});

  @override
  State<report> createState() => _reportState();
}

class _reportState extends State<report> {
  String _val4 = '';

  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 30,
              onPressed: () {
                setState(() {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => help()),
                  );
                });
              },
            ),
            Container(
              // settingH3X (1:271)
              margin: EdgeInsets.fromLTRB(10 * fem, 0, 0, 15 * fem),
              child: Text(
                'Report',
                style: TextStyle(
                  fontSize: 24 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2125 * ffem / fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _val4,
                onChanged: (String val) {
                  setState(() => _val4 = val as String);
                },
                onSaved: (String? val) {
                  print('Saved name${_val4}');
                  setState(() {
                    _val4 = val as String;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "enter your report";
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Write your report",
                  labelText: "Report",
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 80, top: 40),
                child: ElevatedButton(
                    child: Text("Submit"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Done Submit Report")));
                        _formKey.currentState!.reset();

                        print('Successfully report the state.');
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//******************************************************************************

class common_problem extends StatefulWidget {
  const common_problem({super.key});

  @override
  State<common_problem> createState() => _common_problemState();
}

class _common_problemState extends State<common_problem> {
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 30,
              onPressed: () {
                setState(() {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => help()),
                  );
                });
              },
            ),
            Container(
              // settingH3X (1:271)
              margin: EdgeInsets.fromLTRB(10 * fem, 0, 0, 15 * fem),
              child: Text(
                'Common Problem',
                style: TextStyle(
                  fontSize: 24 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2125 * ffem / fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Problem: Users may be harmed by the lack of electronic communication.',
              style: TextStyle(
                color: Colors.red,
              )),
          Text(
              'Solution: In the Help section, provide instructions on checking and recovering Internet connections.',
              style: TextStyle(
                color: Colors.green,
              )),
          Text(
              'You can also display a message within the app when there is no internet.',
              style: TextStyle(
                color: Colors.green,
              )),
          SizedBox(
            height: 10,
          ),
          Text('Problem: Users experienced app crashes or freezing.',
              style: TextStyle(
                color: Colors.red,
              )),
          Text(
              'Solution: Encourage users to update to the latest version of the app, check device compatibility, and report issues to your support team. Provide a link or contact information to report a cause.',
              style: TextStyle(
                color: Colors.green,
              )),
          SizedBox(
            height: 10,
          ),
          Text(
              'Problem: Users are responsible for logging in or authenticating.',
              style: TextStyle(
                color: Colors.red,
              )),
          Text(
              'Solution: Step-by-step instructions on how to log in, recover your password, or create an account. Include links to relevant FAQs or contact support for reading assistance.',
              style: TextStyle(
                color: Colors.green,
              )),
          SizedBox(
            height: 10,
          ),
          Text(
              'Problem: It may affect the user in general and not lose his data properly.',
              style: TextStyle(
                color: Colors.red,
              )),
          Text(
              'Solution: Explain how data shifts work, find out the simple steps, and include the option to run manual shifts. If possible, instruct users about verifying their accounts.',
              style: TextStyle(
                color: Colors.green,
              )),
          SizedBox(
            height: 10,
          ),
          Text(
              'If you dont solve your problem contact us through our official accounts and thank you.')
        ],
      ),
    );
  }
}
