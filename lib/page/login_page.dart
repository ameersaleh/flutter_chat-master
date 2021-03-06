import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterchat/component/custom_textField.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider<RememberMeCheckBoxState>(
      create: (context) => RememberMeCheckBoxState(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Card(
                color: Colors.grey[200],
                child: Container(
                  height: height * 1,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Form(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              height: 100,
                              margin: EdgeInsets.only(bottom: 30),
                              child: Image.asset('assets/images/logo.png'),
                            ),
                            CustomTextField('email', TextInputType.emailAddress,
                                false, Icon(Icons.email)),
                            CustomTextField(
                              'password',
                              TextInputType.text,
                              true,
                              Icon(Icons.lock),
                            ),
                            Consumer<RememberMeCheckBoxState>(
                              builder: (context, state, child) {
                                return CheckboxListTile(
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  title: Text('Remember Me!'),
                                  value: state.getCheckBoxState,
                                  onChanged: (pressState) {
                                    state.setCheckBoxState(pressState);
                                  },
                                );
                              },
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: FlatButton(
                                onPressed: () {
                                  // page to change password
                                },
                                child: Text('Forget password ?'),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 16,bottom: 10),
                              child: FlatButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                ),
                                color: Theme.of(context).primaryColor,
                                textColor: Colors.black,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 12),
                                onPressed: () {
                                  // save checkbox preference .
                                  Navigator.pushReplacementNamed(
                                      context, '/chat_room');
                                },
                                child: Text(
                                  "login".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            Text('OR',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: FlatButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                ),
                                color: Theme.of(context).primaryColor,
                                textColor: Colors.black,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                onPressed: () {
                                  // save checkbox preference .
                                  Navigator.pushReplacementNamed(
                                      context, '/sign_up');
                                },
                                child: Text(
                                  "sign up".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
//                            Container(
//                              alignment: Alignment.bottomRight,
//                              width: double.infinity,
//                              margin: EdgeInsets.only(top: 60,),
//                              child: FlatButton(
//                                  child: Text(
//                                    "Sign up",
//                                    style: TextStyle(color: Colors.deepOrangeAccent),
//                                  ),
//                                  onPressed: () =>
//                                      Navigator.pushReplacementNamed(
//                                          context, '/sign_up')),
//                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RememberMeCheckBoxState with ChangeNotifier {
  bool _state = false;

  get getCheckBoxState => _state;

  void setCheckBoxState(bool state) {
    _state = state;
    notifyListeners();
  }
}
