import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:english_words/english_words.dart';

void main() {
  // runApp(
  //     const MaterialApp(title: "Material App Title", home: CustomScaffold()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "text child hello",
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Appbar Title"),
            ),
            body: const Center(child: RandomWords())));
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          CustomAppBar(
              titleWidget: Text(
            "Variable Title",
            style: Theme.of(context).primaryTextTheme.titleLarge,
          )),
          const Expanded(child: Center(child: Text("Hello world!!!")))
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CustomAppBar({required this.titleWidget});

  final Widget titleWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration: const BoxDecoration(color: Colors.red),
      child: Row(
        children: <Widget>[
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.ac_unit_sharp),
            tooltip: "this is tooltip",
          ),
          Expanded(child: titleWidget),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: "search tooltip",
          )
        ],
      ),
    );
  }
}
