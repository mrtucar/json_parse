import 'package:flutter/material.dart';
import 'User.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class KullaniciListesi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _KullaniciListesi();
  }
}

class _KullaniciListesi extends State<KullaniciListesi> {
  List<User> _kullanicililar = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _verileriInternettenCek();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(itemBuilder: itemBuilder,
    itemCount: _kullanicililar.length,);
  }

  Widget itemBuilder(BuildContext context, int index) {
    AlertDialog alertDialog;
    return Card(
      child: ListTile(
        title:Text(_kullanicililar[index].name.toString()),
        subtitle: Text(_kullanicililar[index].email.toString()),
        leading: Icon(Icons.contact_page_rounded),
        onTap: () {
          alertDialog = AlertDialog(
              title: Text("Adress"),
              content:SizedBox(
                  height: 200,
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_kullanicililar[index].address!.street!.toString()),
                  Text(_kullanicililar[index].address!.suite!.toString()),
                  Text(_kullanicililar[index].address!.city!.toString())
                ],
              ))
          );
          showDialog(context: context, builder: (_) => alertDialog);
        },
      ),
    );
  }

  void _verileriInternettenCek() async {
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/users");
    http.Response response = await http.get(uri);
    List<dynamic> parsedResponse =
    json.decode(response.body);
    print(parsedResponse[0]);
    if (parsedResponse.length>0) {
      for (var item in parsedResponse) {
        _kullanicililar.add(User.fromJson(item));
      }
    }
    setState(() {});
  }
}