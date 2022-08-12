import 'package:flutter/material.dart';
import 'package:item_rating/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'username_page.dart';
import 'models/item_Provider.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController tc = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Username is empty';
                }
                return null;
              },
              controller: tc,
              decoration: kUsernameDecoration,
            ),
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off)),
                labelText: 'Password',
              ),
              obscureText: _isObscure,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Password is empty';
                }
                return null;
              },
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                final isValidForm = formKey.currentState!.validate();
                if (isValidForm) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (UsernamePage()),
                    ),
                  );
                }
                Provider.of<ListOfItems>(context, listen: false).usernameInput =
                    tc.text;
                print(tc.text);
                Future.delayed(Duration(seconds: 1), () {
                  tc.clear();
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
