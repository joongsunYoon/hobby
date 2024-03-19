import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String ID = '';
  String password = '';
  bool keep_Login = false;
  late SharedPreferences pref;
  TextEditingController IDcontroller = TextEditingController();
  TextEditingController PWcontroller = TextEditingController();
  late bool IDButtonOn = false;
  late bool PWButtonOn = false;

  @override
  void initState() {
    LoginCheck();
  }

  void LoginCheckBox() {
    setState(() {
      keep_Login = !keep_Login;
      pref.setBool('keep_Login_pref', keep_Login);
    });
  }

  void LoginCheck() async {
    pref = await SharedPreferences.getInstance();
    final prefKeep = pref.getBool('keep_Login_pref');
    if (prefKeep != null) {
      keep_Login = prefKeep;
    }
    final prefID = pref.getString('ID');
    final prefPassword = pref.getString('Password');
    setState(() {
      if (keep_Login) {
        if (prefID != null) {
          ID = prefID;
          IDButtonOn = true;
          PWButtonOn = true;
        }
        if (prefPassword != null) {
          password = prefPassword;
        }
      }
    });
    IDcontroller = TextEditingController(text: ID);
    PWcontroller = TextEditingController(text: password);
  }

  void PressedLoginButton() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        ID = IDcontroller.text;
        password = PWcontroller.text;
        pref.setString('ID', ID);
        pref.setString('Password', password);
      });
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const Home(),
          transitionsBuilder: ((context, animation, secondaryAnimation, child) {
            var begin = const Offset(0, 1);
            var end = const Offset(0, 0);
            var curveTween = CurveTween(curve: Curves.ease);
            var tween = Tween(begin: begin, end: end).chain(curveTween);
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          }),
        ),
      );
    }

    final prefID = pref.getString('ID');
    final prefPassword = pref.getString('Password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(183, 214, 62, 62),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ID',
                      style: TextStyle(
                        color: Colors.red[400],
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: IDcontroller,
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            IDButtonOn = true;
                          } else {
                            IDButtonOn = false;
                          }
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'ID를 입력하시오';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.red[400],
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: PWcontroller,
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            PWButtonOn = true;
                          } else {
                            PWButtonOn = false;
                          }
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password를 입력하시오';
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          '로그인 저장',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        IconButton(
                            onPressed: LoginCheckBox,
                            icon: keep_Login
                                ? const Icon(Icons.check_box_outlined)
                                : const Icon(Icons.check_box_outline_blank)),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: (IDButtonOn && PWButtonOn)
                              ? Colors.red.shade600
                              : Colors.red.shade200,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 120,
                          ),
                        ),
                        onPressed: PressedLoginButton,
                        child: const Text(
                          '로그인',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
