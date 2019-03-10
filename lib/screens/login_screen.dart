import 'package:flutter/material.dart';
import 'package:flutter_workshop/screens/home_screen.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{

  bool _nameError;
  bool _passwordError;

  String _nameErrorText;
  String _passwordErrorText;

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _nameError = false;
    _passwordError = false;

    _nameErrorText = "";
    _passwordErrorText = "";
  }

  validateInputs(){
    String name = _nameController.text;
    String pass = _passwordController.text;

    if(name.isEmpty){
      setState(() {
        _nameError = true;
        _nameErrorText = "Required!";
      });
      return;
    }

    if(pass.isEmpty){
      setState(() {
        _passwordError = true;
        _passwordErrorText = "Required!";
      });
      return;
    }

    if(name != "Shivamvk"){
      setState(() {
        _nameError = true;
        _nameErrorText = "Incorrect name!";
      });
      return;
    }

    if(pass != "shivam123"){
      setState(() {
        _passwordError = true;
        _passwordErrorText = "Incorrect password!";
      });
      return;
    }

    //inputs are fine proceed with login
    login();
  }

  login(){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Login",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 16.0)),
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.person),
                labelText: "Username",
                labelStyle: new TextStyle(
                  color: Colors.white
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                errorText: _nameError? _nameErrorText : null
              ),
              style: TextStyle(
                color: Colors.white,
              ),
              onChanged: (value) {
                setState(() {
                  _nameError = false;
                });
              },
              controller: _nameController,
            ),
            Padding(padding: EdgeInsets.only(top: 8.0)),
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.vpn_key),
                labelText: "Password",
                labelStyle: new TextStyle(
                  color: Colors.white
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                errorText: _passwordError? _passwordErrorText : null
              ),
              obscureText: true,
              style: TextStyle(
                color: Colors.white
              ),
              onChanged: (value){
                _passwordError = false;
              },
              controller: _passwordController,
            ),
            Padding(padding: EdgeInsets.only(top: 16.0)),
            Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: (){
                  validateInputs();
                },
                color: Colors.white,
                textColor: Colors.green,
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Proceed",
                    style: TextStyle(
                      fontSize: 22.0
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}