import 'package:flutter/material.dart';
import 'package:item_rating/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'username_page.dart';
import 'models/item_Provider.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController tc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            // validator: (text) {
            //   if (text == null || text.isEmpty) {
            //     return 'Text is empty';
            //   }
            //   return null;
            // },
            controller: tc,
            decoration: kUsernameDecoration,
          ),
          // TextField(
          //   decoration: InputDecoration(labelText: 'Username'),
          // ),
          TextFormField(decoration: kPasswordDecoration),
          const SizedBox(height: 25),
          ElevatedButton(
            child: Text('Login'),
            onPressed: () {
              Provider.of<ListOfItems>(context, listen: false).usernameInput =
                  tc.text;
              print(tc.text);
              Future.delayed(Duration(seconds: 1), () {
                tc.clear();
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => (UsernamePage()),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
