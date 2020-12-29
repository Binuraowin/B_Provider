import 'package:b_provider/screens/authenticate/inputdeco.dart';
import 'package:b_provider/services/auth.dart';
import 'package:b_provider/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override

    final Function toggleView;

  const SignIn({Key key, this.toggleView}) : super(key: key);
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
    final _formKey =GlobalKey<FormState>();
    bool loading = false;

  String email = '';
  String password = '';
   String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Sign In'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: (){
              widget.toggleView();
            }, 
            icon: Icon(Icons.person , color: Colors.white,), 
            label: Text('Register',
            style: TextStyle(color: Colors.white),
            ))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.only(topLeft: Radius.circular(200.0), topRight: Radius.circular(200.0))
              ),
              child: ListView(
                  primary: false,
                 padding: EdgeInsets.only(left: 25.0, right: 20.0),
                 children: <Widget>[
                   Form(
           key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 140.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration:buildInputDecoration(Icons.email,"Email"),
                  validator: (String value){
                    if(value.isEmpty)
                    {
                      return 'Please a Enter';
                    }
                    if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                      return 'Please a valid Email';
                    }
                    return null;
                  },
                  onChanged: (val){
                    setState(() {
                      email= val;
                    });
                  },
                ),
              ),
//              TextFormField(
//                decoration: InputDecoration(
//                  hintText: 'Email',
//                ),
//                 validator: (val) => val.isEmpty  ? 'enter an email' :null,
//                onChanged: (val){
//                    setState(() {
//                      email= val;
//                    });
//                },
//              ),
                SizedBox(height: 20.0),
//              TextFormField(
//                obscureText: true,
//                 decoration: InputDecoration(
//                  hintText: 'password',
//                ),
//                validator: (val) => val.length <6 ? 'enter 6+ cratecctors password' :null,
//                onChanged: (val){
//                    setState(() {
//                      password= val;
//                    });
//                },
//              ),
               SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                child: TextFormField(
//                  controller: password,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration:buildInputDecoration(Icons.lock,"Password"),
                  validator: (String value){
                    if(value.isEmpty)
                    {
                      return 'Please a Enter Password';
                    }
                    return null;
                  },
                  onChanged: (val){
                    setState(() {
                      password= val;
                    });
                  },

                ),
              ),
               RaisedButton(
                 color: Colors.blue[700],
                 child: Text(
                   'Sign In',
                   style: TextStyle(
                     color: Colors.white
                   ),
                 ),
                 onPressed: () async{
                     if (_formKey.currentState.validate()) {
//                       setState(() {
//                         loading= true;
//                       });
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if(result == null){
                          setState(() {
                            error='enter valid email';
                             loading= true;
                          });
                        }
                        print('valid');
                   }
                 }
                 ),
                 SizedBox(height: 12.0),
                 Text(
                   error,
                   style: TextStyle(color: Colors.red,fontSize: 14.0),
                 )
            ],
          )
          )
                 ],
              ),
        // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        // child: 
    
      ),
    );
  }
}