import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_minggu4/service/service.dart';
import 'package:tugas_minggu4/signup_page.dart';

import '../model/article_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String nama = '';
  String email = '';
  String pass = '';
  late SharedPreferences sharedPreferences;
  void getData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      nama = sharedPreferences.getString('nama')!;
      email = sharedPreferences.getString('email')!;
      pass = sharedPreferences.getString('pass')!;
    });
  }

  void logout() {
    sharedPreferences.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignUp(),
      ),
    );
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  List<Tab> myTab = [
    Tab(
      icon: Icon(
        Icons.home,
        color: Colors.deepOrange,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.business,
        color: Colors.deepOrange,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.toys,
        color: Colors.deepOrange,
      ),
    ),
    Tab(
      icon: Icon(
        Icons.card_travel,
        color: Colors.deepOrange,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    ApiService service = ApiService();
    return DefaultTabController(
      length: myTab.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          title: TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
            ),
          ),
          actions: [
            Icon(
              Icons.notifications,
              color: Color(0xFFFF3A44),
            ),
            SizedBox(width: 20)
          ],
          bottom: TabBar(tabs: myTab),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  nama,
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  email,
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  pass,
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: (() {
                    logout();
                  }),
                  child: Text('Log Out'),
                ),
              ],
            ),
            FutureBuilder(
              future: service.getArticle(),
              builder: (BuildContext context,
                  AsyncSnapshot<Iterable<Article>> snapshot) {
                if (snapshot.hasData) {
                  Iterable<Article>? articles = snapshot.data;
                  return Container(child: Text('SUKSES'));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            Text('3'),
            Text('4'),
          ],
        ),
      ),
    );
  }
}
