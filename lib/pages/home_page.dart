import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/drawer_item.dart';
import './barang_page.dart';
import './landing_page.dart';
import './order_page.dart';
import './profile_page.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<BottomNavigationBarItem> navbarItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded),
      label: "Beranda",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.add_box_rounded),
      label: "Add Order",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.assignment),
      label: "Order List",
    ),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _index = 0;
  final List<Widget> _body = [
    barangPage(),
    const orderListPage(),
    orderPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade200,
        title: const Text(
          'Pet Cat',
          style: TextStyle(color: Colors.black, fontFamily: 'Acme'),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: RadialGradient(radius: 2.0, colors: <Color>[
                Colors.pink.shade400,
                Colors.pink.shade100,
              ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 248, 187, 208),
                    backgroundImage:
                        AssetImage('assets/images/petshop_logo.png'),
                    radius: 50,
                  ),
                  Text(
                    "PetShop",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Fjalla',
                      wordSpacing: 1,
                      inherit: false,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.grey,
              ),
              title: const Text(
                "Settings",
                style: TextStyle(color: Colors.grey),
              ),
              subtitle: const Text(
                "Application Settings",
                style: TextStyle(color: Colors.grey),
              ),
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return const Settings();
                  }),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.notifications,
                color: Colors.grey,
              ),
              title: const Text(
                "Announcement",
                style: TextStyle(color: Colors.grey),
              ),
              subtitle: const Text(
                "Announcement !",
                style: TextStyle(color: Colors.grey),
              ),
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return const pemberitahuan();
                  }),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings_applications,
                color: Colors.grey,
              ),
              title: const Text(
                "About Application",
                style: TextStyle(color: Colors.grey),
              ),
              subtitle: const Text(
                "Application Specifications",
                style: TextStyle(color: Colors.grey),
              ),
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return const tentang();
                  }),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.help,
                color: Colors.grey,
              ),
              title: const Text(
                "Privacy Policy",
                style: TextStyle(color: Colors.grey),
              ),
              subtitle: const Text(
                "Permissions of the application",
                style: TextStyle(color: Colors.grey),
              ),
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return const kebijakan();
                  }),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.grey,
              ),
              title: const Text(
                "Log Out",
                style: TextStyle(color: Colors.grey),
              ),
              subtitle: const Text(
                "Exit the application",
                style: TextStyle(color: Colors.grey),
              ),
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return const landingPage();
                  }),
                );
              },
            ),
          ],
        ),
      ),
      body: _body.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        items: navbarItem,
        currentIndex: _index,
        onTap: (i) {
          setState(() {
            _index = i;
          });
        },
      ),
    );
  }
}
