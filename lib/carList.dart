import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'main.dart';

class CarListPage extends StatefulWidget {
  @override
  State<CarListPage> createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  String bodytype = carSearch?.bodytype != null ? carSearch!.bodytype : '';
  //String color = carSearch?.color != null ? carSearch!.color : '';

  @override
  Widget build(BuildContext context) {
    //print(bodytype);
    return Scaffold(
      appBar: AppBar(
        title: Text('車一覧'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('cars')
                  .where('bodytype', isEqualTo: bodytype )
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<DocumentSnapshot> documents = snapshot.data!.docs;
                  return ListView(
                    children: documents.map((document) {
                      return Card(
                          child: ListTile(
                        title: Text(document['name']),
                        subtitle: Text(document['color']),
                      ));
                    }).toList(),
                  );
                }
                // データが読込中の場合
                return const Center(
                  child: Text('読込中...'),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}