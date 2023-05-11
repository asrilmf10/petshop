import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class barangPage extends StatefulWidget {
  @override
  State<barangPage> createState() => _barangPageState();
}

class _barangPageState extends State<barangPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference barang = firestore.collection("barang");
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 20),
        child: FutureBuilder<QuerySnapshot>(
          future: barang.get(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              var allData = snapshot.data!.docs;
              return allData.length != 0
                  ? ListView.builder(
                      itemCount: allData.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                          leading: ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: 60,
                              minHeight: 60,
                              maxWidth: 70,
                              maxHeight: 70,
                            ),
                            child: Image.network(allData[index]['gambar']),
                          ),
                          title: Text(allData[index]['nama_brg']),
                          subtitle: Text(
                              "Jumlah : ${allData[index]['jmlh_brg'].toString()}"),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.shopping_cart_rounded),
                          ),
                        );
                      })
                  : const Center(child: Text("No Data"));
            } else {
              return const Center(child: Text("Loading..."));
            }
          },
        ),
      ),
    );
  }
}
