import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _randomWords = <WordPair>[];

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, item) {
        if (item.isOdd) return const Divider();
        final index = item ~/ 2;
        if (index >= _randomWords.length) {
          _randomWords.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_randomWords[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return const ListTile(
      title: Text("generate Word Pair! "),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: _buildList());
  }
}
