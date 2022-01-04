import 'Post.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> _postlar = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _verileriInternettenCek();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:_postlar.length,
      itemBuilder: _buildListItem,
    );
  }

  void _verileriInternettenCek() async {
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    http.Response response = await http.get(uri);
    List<dynamic> parsedResponse =
    json.decode(response.body);
    if (parsedResponse.length>0) {
      for (var item in parsedResponse) {
        _postlar.add(Post.fromJson(item));
      }
    }
    setState(() {});
  }

  Widget _buildListItem(BuildContext context, int index) {
    AlertDialog alertDialog;
    return Card(
      child: ListTile(
        title: Text(_postlar[index].title.toString()),
        leading: Icon(Icons.account_circle),
        onTap: (){
          alertDialog = AlertDialog(
              title: Text("Icerik"),
              content: Text(_postlar[index].body.toString()));
          showDialog(context: context, builder: (_) => alertDialog);
        },
      ),
    );
  }
}