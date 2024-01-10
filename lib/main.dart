import 'package:flutter/material.dart';
//import 'package:sqflite/sqflite.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:flutter/cupertino.dart';
//import 'picker.dart';
import 'carList.dart';
import 'database.dart';

final db = FirebaseFirestore.instance;
CarSearch? carSearch;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> bodytypeList = [
    'ファミリー',
    'セダン',
    'SUV',
    'コンパクト',
    'クロスカントリー',
    'バン',
    'ハッチバック',
    '2人乗り'
  ];
  /*
  List<String> colorList = [
    '白',
    '黒',
    '赤',
    '青',
    '水色',
    '黄色',
    'ゴールド',
    'シルバー',
    'カーキ',
    'グレー',
    'ベージュ'
  ];
  */
  final TextEditingController bodytypeController = TextEditingController();
  String bodytype = '';
  /*
  final TextEditingController colorController = TextEditingController();
  String color = '';
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('トヨタの車を検索'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
        child: Column(
          children: [
            Text('ボディタイプ'),
            TextField(
              style: const TextStyle(fontSize: 20),
              controller: bodytypeController,
              onTap: () {
                showBodyPicker(context, bodytypeController, bodytypeList);
              },
            ),
            /*
            Text('色'),
            TextField(
              style: const TextStyle(fontSize: 20),
              controller: colorController,
              onTap: () {
                showColorPicker(context, colorController, colorList);
              },
            ),
            */
            ElevatedButton(
                onPressed: () {
                  carSearch = CarSearch(bodytype);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CarListPage();
                  }));
                },
                child: Text('検索')),
          ],
        ),
      ),
    );
  }

  void showBodyPicker(
      BuildContext context, TextEditingController controller, List list) {
    final _pickerItems = list.map((item) => Text(item)).toList();
    var selectedIndex = 0;

    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 216,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CupertinoPicker(
              itemExtent: 32,
              children: _pickerItems,
              onSelectedItemChanged: (int index) {
                selectedIndex = index;
              },
            ),
          ),
        );
      },
    ).then((_) {
      if (selectedIndex != Null) {
        controller.value = TextEditingValue(text: list[selectedIndex]);
        setState(() {
          bodytype = list[selectedIndex];
          print(bodytype);
        });
      }
    });
  }

/*
  void showColorPicker(
      BuildContext context, TextEditingController controller, List list) {
    final _pickerItems = list.map((item) => Text(item)).toList();
    var selectedIndex = 0;

    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 216,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CupertinoPicker(
              itemExtent: 32,
              children: _pickerItems,
              onSelectedItemChanged: (int index) {
                selectedIndex = index;
              },
            ),
          ),
        );
      },
    ).then((_) {
      if (selectedIndex != Null) {
        controller.value = TextEditingValue(text: list[selectedIndex]);
        setState(() {
          color = list[selectedIndex];
          print(color);
        });
      }
    });
  }
  */
}