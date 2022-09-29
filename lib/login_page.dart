import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  Widget _body() {
    return SingleChildScrollView(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset('assets/images/logo.png')),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, top: 20.0, bottom: 12.0),
                        child: Column(children: [
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Email"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            obscureText: true,
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Senha",
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber,
                              ),
                              onPressed: () {
                                if (email == 'lameco@gmail.com' &&
                                    password == "123") {
                                  debugPrint("Correct");
                                  Navigator.of(context)
                                      .pushReplacementNamed('/home');
                                } else {
                                  debugPrint("Wrong");
                                }
                              },
                              child: const SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "Entrar",
                                  textAlign: TextAlign.center,
                                ),
                              ))
                        ]),
                      ),
                    ),
                  ]),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.amber,
            ),
            _body()
          ],
        ));
  }
}
