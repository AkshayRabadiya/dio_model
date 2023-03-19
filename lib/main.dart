import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            InkWell(
              onTap: () {
                ///login via repository
                final result = await UserRepository.login(
                  deviceType:
                  Platform.isAndroid ? "ANDROID" : "IOS",
                  dt: deviceToken!,
                  email: email,
                  password: password,
                );
              },
              child: const SizedBox(
                height: 50,
                child: Text("Login"),
              ),
            ),


            InkWell(
              onTap: () {
                QuestionModel pojo = QuestionModel();
                pojo.model = "gpt-3.5-turbo";
                messages!.isEmpty
                    ? pojo.messages = [
                  Messages(role: "user", content: txtMsg.text)
                ]
                    : pojo.messages = messages;
                messages!.add(Messages(role: "user", content: txtMsg.text));
                setState(() {});

                final result = await ChatRepository.requestChat(pojo: pojo);
                // ignore: unnecessary_null_comparison
                if (result.choices != null) {
                  setState(() {
                    questions.add(txtMsg.text);
                    txtMsg.text = "";
                    answers.add(result.choices![0].message!.content!);
                    messages!.add(Messages(
                        role: result.choices![0].message!.role,
                        content: result.choices![0].message!.content!));
                    // replay = replay + result.choices![0].text!;
                  });
                  _scrollToBottom();
                }
              },
              child: const SizedBox(
                height: 50,
                child: Text("Chat MSG Send"),
              ),
            ),



            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
