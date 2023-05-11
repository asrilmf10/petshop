import 'package:flutter/material.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            fontFamily: 'Acme',
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.pink.shade200,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: Colors.pink.shade50,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 10, right: 5, left: 5),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/asril.jpg"),
                          radius: 60,
                        ),
                      ),
                      Text(
                        "Asril M. Fahroji\n2009106109",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Acme",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 10, right: 5),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/adrian.jpeg"),
                          radius: 60,
                        ),
                      ),
                      Text(
                        "Adrian Tasmin\n2009106112",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Acme",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/silvia.jpg"),
                          radius: 60,
                        ),
                      ),
                      Text(
                        "Silvia Ananda\n2009106120",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Acme",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
