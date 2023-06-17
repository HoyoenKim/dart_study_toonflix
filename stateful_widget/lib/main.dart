import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  // stateless widget just build ui
  // state widget chage data in real time
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  List<int> numbers = [];
  bool showTitle = true;

  void onClicked() {
    setState(() {
      // setState 가 실행될때 마다 build가 다시 호출된다.
      numbers.add(numbers.length);
    });
  }

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    // context contains information of widget inspector
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showTitle ? const MyLargeTitle() : const Text('Nothing To See'),
            IconButton(
              onPressed: toggleTitle,
              icon: const Icon(
                Icons.remove_red_eye,
              ),
            )
            //for (var n in numbers)
            //  Text(
            //    '$n',
            //    style: const TextStyle(fontSize: 30),
            //  ),
            //IconButton(
            //  onPressed: onClicked,
            //  icon: const Icon(Icons.add_box_rounded),
            //  iconSize: 40,
            //),
          ],
        )),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    // called before build, called onetime
    // TODO: implement initState
    super.initState();
    print('initSate!');
  }

  @override
  void dispose() {
    //before dispoes widget
    // TODO: implement dispose
    super.dispose();
    print("dispose!");
  }

  @override
  Widget build(BuildContext context) {
    print('build!');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
