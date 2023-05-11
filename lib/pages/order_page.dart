import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class orderPage extends StatefulWidget {
  @override
  State<orderPage> createState() => _orderPageState();
}

class _orderPageState extends State<orderPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebase = FirebaseFirestore.instance;
    CollectionReference registry = firebase.collection("regis_cat");
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<QuerySnapshot>(
          future: registry.get(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              var allData = snapshot.data!.docs;
              return allData.length != 0
                  ? ListView.builder(
                      itemCount: allData.length,
                      itemBuilder: (_, index) {
                        return Container(
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide())),
                          child: ListTile(
                            title: Text(
                              allData[index]['nama'],
                              style: const TextStyle(
                                fontFamily: "Acme",
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(
                              "Telepon : ${allData[index]['no_tlp']}"
                              "\nAlamat : ${allData[index]['alamat']}"
                              "\nTipe : ${allData[index]['tipe']}",
                              style: const TextStyle(
                                fontFamily: "Fjalla",
                                fontSize: 10,
                              ),
                            ),
                            trailing: IconButton(
                              icon:
                                  const Icon(Icons.more_vert_rounded, size: 30),
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Dialog(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        const Text("Pilih ?"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("Edit"),
                                              ),
                                            ),
                                            SizedBox(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("Hapus"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                  : const Center(child: Text("No Data"));
            } else {
              return const Center(
                child: Text(
                  "Loading ...",
                  style: TextStyle(fontSize: 12),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class orderListPage extends StatefulWidget {
  const orderListPage({super.key});

  @override
  State<orderListPage> createState() => _orderListPageState();
}

class _orderListPageState extends State<orderListPage> {
  String? name;
  String? phone;
  String? address;
  String? type;

  bool Nilaiswitch = false;

  final ctrlName = TextEditingController();
  final ctrlPhone = TextEditingController();
  final ctrlAddress = TextEditingController();
  final ctrltipe = TextEditingController();

  Widget Name(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      controller: ctrlName,
      decoration: InputDecoration(
        hintText: "Name patient",
        prefixIcon: const Icon(Icons.pets_outlined),
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        fillColor: Colors.white.withOpacity(0.3),
        filled: true,
      ),
    );
  }

  Widget Phone(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      controller: ctrlPhone,
      decoration: InputDecoration(
        hintText: "Phone",
        prefixIcon: const Icon(Icons.phone),
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        fillColor: Colors.white.withOpacity(0.3),
        filled: true,
      ),
    );
  }

  Widget Address(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      controller: ctrlAddress,
      decoration: InputDecoration(
        hintText: "Address",
        prefixIcon: const Icon(Icons.home_outlined),
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        fillColor: Colors.white.withOpacity(0.3),
        filled: true,
      ),
    );
  }

  Widget Type(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      controller: ctrltipe,
      decoration: InputDecoration(
        hintText: "Type",
        prefixIcon: const Icon(Icons.home_outlined),
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.5),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
        fillColor: Colors.white.withOpacity(0.3),
        filled: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebase = FirebaseFirestore.instance;
    CollectionReference registry = firebase.collection("regis_cat");
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.pink.shade50,
              image: DecorationImage(
                alignment: Alignment.center,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.09), BlendMode.dstATop),
                image: const AssetImage('assets/images/petshop_logo.png'),
                fit: BoxFit.contain,
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Column(
                    children: [
                      const Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Acme',
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Name(context),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Column(
                    children: [
                      const Text(
                        'Phone',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Acme',
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Phone(context),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Column(
                    children: [
                      const Text(
                        'Address',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Acme',
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Address(context),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Column(
                    children: [
                      const Text(
                        'Type',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Acme',
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Type(context),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 10, 0),
                  child: SwitchListTile(
                    title: const Text(
                      "Privacy Policy",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Acme',
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: const Text(
                        "Aggrement to the privacy policy your request will be processed"),
                    value: Nilaiswitch,
                    activeTrackColor: Colors.grey,
                    activeColor: Colors.brown,
                    onChanged: (value) {
                      setState(() {
                        Nilaiswitch = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  width: 315,
                  height: 45,
                  child: ElevatedButton(
                    // tombol order
                    onPressed: () {
                      registry.add({
                        'nama': ctrlName.text,
                        'no_tlp': ctrlPhone.text,
                        'alamat': ctrlAddress.text,
                        'tipe': ctrltipe.text
                      });
                      final snackBar = SnackBar(
                        content: Text('Pesanan Anda diterima !'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text(
                      "Order",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'RussoOne'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
