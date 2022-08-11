import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserRatings extends StatelessWidget {
  const UserRatings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Ratings'),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: ((context, index) {
          return ListTile(
            title: Text('item 0'),
            trailing: Text('3/5'),
          );
        }),
      ),
    );
  }
}
