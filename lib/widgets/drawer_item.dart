import 'package:flutter/material.dart';

class pemberitahuan extends StatelessWidget {
  const pemberitahuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Announcement",
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 0.0),
              child: const Image(
                image: AssetImage('assets/images/petshop_logo.png'),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: const Text(
                textAlign: TextAlign.center,
                "Here a notification will appear\nfrom service",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                  fontFamily: "Acme",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class tentang extends StatelessWidget {
  const tentang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About Application",
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.10), BlendMode.dstATop),
            image: const AssetImage('assets/images/petshop_logo.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: ListView(
          children: [
            const Text(
              "Kelompok 4A2-20\nAplikasi PetShop",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'FjallaOne',
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/asril.jpg"),
                          radius: 50,
                        ),
                      ),
                      Text(
                        "Asril M. Fahroji\n2009106109",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
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
                        padding: EdgeInsets.only(top: 20),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/adrian.jpeg"),
                          radius: 50,
                        ),
                      ),
                      Text(
                        "Adrian Tasmin\n2009106112",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Acme",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/silvia.jpg"),
                          radius: 50,
                        ),
                      ),
                      Text(
                        "Silvia Ananda\n2009106120",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
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

class kebijakan extends StatelessWidget {
  const kebijakan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy Policy",
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
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(children: [
          Column(
            children: const [
              Text(
                "\nPrivacy Policy for Pet Cat",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Acme",
                ),
              ),
              Text(
                "At Pet Cat, accessible from www.youtube.com, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by Pet Cat and how we use it.\nIf you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.",
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                "\nLog Files",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Acme",
                ),
              ),
              Text(
                "Pet Cat follows a standard procedure of using log files. These files log visitors when they visit Apps. All hosting companies do this and a part of hosting services' analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users' movement on the Apps, and gathering demographic information. Our Privacy Policy was created with the help of the Privacy Policy Generator.",
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                "\nCookies",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Acme",
                ),
              ),
              Text(
                "Like any other Apps, Pet Cat uses 'cookies'. These cookies are used to store information including visitors' preferences, and the pages on the Apps that the visitor accessed or visited. The information is used to optimize the users' experience by customizing our web page content based on visitors' browser type and/or other information.",
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

Future<dynamic> CustomAlert(
    BuildContext context, String title, String content) {
  return showDialog<dynamic>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
