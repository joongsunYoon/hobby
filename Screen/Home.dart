import 'package:flutter/material.dart';
import 'package:test_app/Screen/Profile.dart';
import 'package:test_app/person_list/person.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  bool CheckMode = false;
  List checkList = List<bool>.filled(10, false);
  List profile_list = List<person>.filled(
      10, person(name: '윤중선', profile: '안녕하세요 개발자입니다', age: 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade200,
        leading: CheckMode
            ? IconButton(
                onPressed: () {
                  return setState(() {
                    CheckMode = !CheckMode;
                    checkList = List.filled(10, false);
                  });
                },
                icon: const Icon(Icons.close),
              )
            : Container(),
        title: const Text(
          'List',
          style: TextStyle(fontSize: 23),
        ),
      ),
      body: ListView.builder(
        itemCount: profile_list.length,
        itemBuilder: (context, index) {
          return CheckMode
              ? ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(profile_list[index].name + '$index'),
                  subtitle: Text('${profile_list[index].age + index}'),
                  trailing: IconButton(
                    icon: checkList[index]
                        ? const Icon(Icons.check_box)
                        : const Icon(Icons.check_box_outline_blank),
                    onPressed: () {
                      return setState(() {
                        checkList[index] = !checkList[index];
                      });
                    },
                  ),
                )
              : ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(profile_list[index].name + '$index'),
                  subtitle: Text('${profile_list[index].age + index}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder:
                            ((context, animation, secondaryAnimation) =>
                                Profile(
                                  name: profile_list[index].name,
                                  profile: profile_list[index].profile,
                                )),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var begin = const Offset(0, 1);
                          var end = const Offset(0, 0);
                          var curveTween = CurveTween(curve: Curves.ease);
                          var tween =
                              Tween(begin: begin, end: end).chain(curveTween);
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  onLongPress: () {
                    return setState(() {
                      CheckMode = !CheckMode;
                    });
                  },
                );
        },
      ),
    );
  }
}
