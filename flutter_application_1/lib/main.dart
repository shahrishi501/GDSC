import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light, primarySwatch: Colors.deepPurple),
      home: const Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();

  bool passwordObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GDSC'),
      ),
      body: Form(
          key: _formkey,
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset('assets/gdsc-social-share.png'),
                TextFormField(
                  key: const ValueKey('email'),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Email-Id",
                      prefixIcon: Icon(Icons.email)),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: passwordObscure,
                  maxLength: 20,
                  key: const ValueKey('password'),
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordObscure = !passwordObscure;
                            });
                          },
                          icon: Icon(
                            passwordObscure ?
                            Icons.visibility_off : Icons.visibility
                            ))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    width: double.infinity,
                    height: 50,
                    child:
                        ElevatedButton(onPressed: () {}, child: const Text('Login')))
              ],
            ),
          )),
    );
  }
}
