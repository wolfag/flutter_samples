import 'package:flutter/material.dart';
import 'package:mdc_basic/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _unfocusedColor = Colors.grey[600];
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _usernameFocusNode.addListener(() {
      setState(() {});
    });

    _passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            SizedBox(
              height: 80.0,
            ),
            Column(
              children: [
                Image.asset(
                  'assets/diamond.png',
                  color: kShrineBlack,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'SHRINE',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            SizedBox(
              height: 120.0,
            ),
            TextField(
              controller: _usernameController,
              focusNode: _usernameFocusNode,
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: _usernameFocusNode.hasFocus
                      ? Theme.of(context).accentColor
                      : _unfocusedColor,
                ),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: _passwordFocusNode.hasFocus
                      ? Theme.of(context).accentColor
                      : _unfocusedColor,
                ),
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: [
                TextButton(
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7.0),
                        ),
                      ),
                    ),
                  ),
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7.0),
                        ),
                      ),
                    ),
                  ),
                  child: Text('Next'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
