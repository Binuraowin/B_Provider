import 'package:b_provider/services/auth.dart';
import 'package:b_provider/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleView;

  const Register({Key key, this.toggleView}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: Text('Sign Up'),
          actions: <Widget>[
          FlatButton.icon(
            onPressed: (){
              widget.toggleView();
            }, 
            icon: Icon(Icons.person), 
            label: Text('Sign Up'))
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
              TextFormField(
                keyboardType: TextInputType.emailAddress ,
                 decoration: InputDecoration(
                  hintText: 'Email',
                ),
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
                SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                 decoration: InputDecoration(
                  hintText: 'Password',
                ),
                validator: (val) => val.length <6 ? 'enter 6+ cratecctors password' :null,
                onChanged: (val){
                    setState(() {
                      password= val;
                    });
                },
              ),
               SizedBox(height: 20.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress ,
                decoration: InputDecoration(
                  hintText: 'Shop Name',
                ),
                validator: (String value){
                  if(value.isEmpty)
                  {
                    return 'Please a Enter';
                  }
                  return null;
                },
                onChanged: (val){
                  setState(() {
                    email= val;
                  });
                },
              ),
               RaisedButton(
                 color: Colors.blue[700],
                 child: Text(
                   'Register',
                   style: TextStyle(
                     color: Colors.white
                   ),
                 ),
                 onPressed: () async{
                   if (_formKey.currentState.validate()) {
                       setState(() {
                         loading= true;
                       });
                        dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                        if(result == null){
                          setState(() {
                            error='enter valid email';
                            loading= true;
                          });
                        }
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
              )
        // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        // child: 
    
      ),
    );
  }
}