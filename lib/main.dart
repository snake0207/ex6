import 'package:flutter/material.dart';
import 'dice.dart';

void main() {
  runApp(const Login());
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  // Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController idCtrler = TextEditingController();
  TextEditingController pwdCtrler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: const <Widget>[
          Icon(Icons.search),
        ],
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 50.0),
                  ),
                  const Center(
                    child: Image(
                      image: AssetImage('assets/login.gif'),
                      width: 130.0,
                      height: 120.0,
                    ),
                  ),
                  Form(
                    child: Theme(
                      data: ThemeData(
                        primaryColor: Colors.blue,
                        inputDecorationTheme: const InputDecorationTheme(
                          labelStyle: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(50.0),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              controller: idCtrler,
                              decoration: const InputDecoration(
                                labelText: 'Enter your @email ',
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextField(
                              controller: pwdCtrler,
                              decoration: const InputDecoration(
                                labelText: 'Enter Password',
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            const SizedBox(
                              width: 30.0,
                              height: 30.0,
                            ),
                            TextButton.icon(
                              label: const Text('Login'),
                              icon: const Icon(Icons.arrow_forward),
                              onPressed: () {
                                if (idCtrler.text == 'snake0207' &&
                                    pwdCtrler.text == '1234') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const Dice()));
                                } else if (idCtrler.text == 'snake0207' &&
                                    pwdCtrler.text != '1234') {
                                  showSnackBar(context);
                                } else if (idCtrler.text != 'snake0207' &&
                                    pwdCtrler.text == '1234') {
                                  showSnackBar(context);
                                } else {
                                  showSnackBar(context);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text(
      'Invalid Login information !!',
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    backgroundColor: Colors.blue,
    duration: Duration(seconds: 3),
  ));
}
