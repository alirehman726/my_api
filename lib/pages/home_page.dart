import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final url = "http://13.234.59.19/btl/API/loginApi.php";
  final url = "https://jsonplaceholder.typicode.com/posts";

  var _postsJson = [];

  void fetchPosts() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jsonData;
      });
    } catch (err) {
      print('error');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Successful'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _postsJson.length,
          itemBuilder: (context, i) {
            final post = _postsJson[i];
            // return Text(
            //     "Title ${post["first_name"]}\n Body: ${post["city"]}\n\n");
            return Text("Title ${post["title"]}\n Body: ${post["body"]}\n\n");
          },
        ),
      ),
    );
  }
}
