import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/pages/setting_page.dart';
import 'package:todo_app/utils/authentication.dart';
import 'package:todo_app/widgets/placeholder_widget.dart';
import 'sign_in_screen.dart';
import 'package:todo_app/pages/task_page.dart';
import 'package:todo_app/utils/font_style.dart';

var blue = Color(0xf0442D0);
var yellow = Color(0xFABE2C);
var now = DateTime.now();
final List<String> entries = <String>[
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
];
List todos = [
  "Kuda",
  "Ayam",
  "Kucing",
  "Sapi",
];

final List<int> colorCodes = <int>[600, 500, 100];

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late User _user;
  int _currentIndex = 0;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignInScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);
  final screens = [
    Task(),
    Text(
      'Add',
      style: optionStyle,
    ),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 252, 255, 1),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 108,
        backgroundColor: Color.fromRGBO(4, 66, 208, 1),
        centerTitle: false,
        title: Row(
          children: [
            _user.photoURL != null
                ? ClipOval(
                    child: Material(
                      color: Colors.grey.withOpacity(0.3),
                      child: (Container(
                        child: Image.network(
                          _user.photoURL!,
                          fit: BoxFit.contain,
                        ),
                      )),
                    ),
                  )
                : ClipOval(
                    child: Material(
                      color: Colors.grey.withOpacity(0.3),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.person, size: 10, color: Colors.red),
                      ),
                    ),
                  ),
            Padding(padding: EdgeInsets.only(left: 20)),
            Text("Hallo,"),
            Text(_user.displayName!),
            Text("!")
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped, // new
          selectedItemColor: Color.fromRGBO(4, 66, 208, 1),
          unselectedItemColor: Color.fromRGBO(127, 138, 156, 1),
          currentIndex: _currentIndex,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Task',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            )
          ]),
      body: SafeArea(
        child: Container(child: screens[_currentIndex]),
      ),
    );

    // child: Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Row(),
    //     _user.photoURL != null
    //         ? ClipOval(
    //             child: Material(
    //               color: Colors.grey.withOpacity(0.3),
    //               child: Image.network(
    //                 _user.photoURL!,
    //                 fit: BoxFit.fitHeight,
    //               ),
    //             ),
    //           )
    //         : ClipOval(
    //             child: Material(
    //               color: Colors.grey.withOpacity(0.3),
    //               child: Padding(
    //                 padding: const EdgeInsets.all(16.0),
    //                 child: Icon(
    //                   Icons.person,
    //                   size: 60,
    //                   color: Colors.grey,
    //                 ),
    //               ),
    //             ),
    //           ),
    //     SizedBox(height: 16.0),
    //     Text(
    //       'Hello',
    //       style: TextStyle(
    //         color: Colors.grey,
    //         fontSize: 26,
    //       ),
    //     ),
    //     SizedBox(height: 8.0),
    //     Text(
    //       _user.displayName!,
    //       style: TextStyle(
    //         color: Colors.yellow,
    //         fontSize: 26,
    //       ),
    //     ),
    //     SizedBox(height: 8.0),
    //     Text(
    //       '( ${_user.email!} )',
    //       style: TextStyle(
    //         color: Colors.orange,
    //         fontSize: 20,
    //         letterSpacing: 0.5,
    //       ),
    //     ),
    //     SizedBox(height: 24.0),
    //     Text(
    //       'You are now signed in using your Google account. To sign out of your account click the "Sign Out" button below.',
    //       style: TextStyle(
    //           color: Colors.grey.withOpacity(0.8),
    //           fontSize: 14,
    //           letterSpacing: 0.2),
    //     ),
    //     SizedBox(height: 16.0),
    //     _isSigningOut
    //         ? CircularProgressIndicator(
    //             valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    //           )
    //         : ElevatedButton(
    //             style: ButtonStyle(
    //               backgroundColor: MaterialStateProperty.all(
    //                 Colors.redAccent,
    //               ),
    //               shape: MaterialStateProperty.all(
    //                 RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(10),
    //                 ),
    //               ),
    //             ),
    //             onPressed: () async {
    //               setState(() {
    //                 _isSigningOut = true;
    //               });
    //               await Authentication.signOut(context: context);
    //               setState(() {
    //                 _isSigningOut = false;
    //               });
    //               Navigator.of(context)
    //                   .pushReplacement(_routeToSignInScreen());
    //             },
    //             child: Padding(
    //               padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
    //               child: Text(
    //                 'Sign Out',
    //                 style: TextStyle(
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.white,
    //                   letterSpacing: 2,
    //                 ),
    //               ),
    //             ),
    //           ),
    //   ],
    // ),
  }
}
