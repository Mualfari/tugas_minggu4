import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_minggu4/screen/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String namaValue = '';
  String passValue = '';
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  void getData() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      SharedPreferences pref = await SharedPreferences.getInstance();

      String nama = pref.getString('nama')!;
      String pass = pref.getString('pass')!;
      print(nama);
      print(pass);
      print(namaValue);
      print(passValue);
      if (namaValue == nama && passValue == pass) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else {
        showAboutDialog(
            context: context, children: [Text('Password / username Salah')]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 7),
              Center(
                child: Text(
                  'Flutter News',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text("Login to your account"),
              SizedBox(height: 10),
              TextFormField(
                onSaved: (value) {
                  namaValue = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'nama harus di isi';
                  } else {
                    return null;
                  }
                },
                // controller: namaT,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                onSaved: (value) {
                  passValue = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'password harus di isi';
                  } else {
                    return null;
                  }
                },
                // controller: passT,
                decoration: InputDecoration(
                  hintText: 'password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // loginBtn();
                  getData();
                },
                child: Text('Sign In'),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
