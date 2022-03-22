import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_minggu4/login_page.dart';
import 'package:tugas_minggu4/screen/home_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String nama = '';
  String email = '';
  String pass = '';
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void save() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("nama", nama);
      pref.setString("email", email);
      pref.setString("pass", pass);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
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
              Text("Create Your Account"),
              SizedBox(height: 10),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama Harus Diisi';
                  }
                  return null;
                },
                onSaved: (value) {
                  nama = value!;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'Nama',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email harus di isi';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value!;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password Harus di Isi';
                  }
                  return null;
                },
                onSaved: (value) {
                  pass = value!;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  save();
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
