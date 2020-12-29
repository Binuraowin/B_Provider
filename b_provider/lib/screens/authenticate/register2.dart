import 'package:b_provider/screens/authenticate/inputdeco.dart';
import 'package:b_provider/services/auth.dart';
import 'package:b_provider/shared/loading.dart';
import 'package:flutter/material.dart';


class FormPage extends StatefulWidget {
  final Function toggleView;

  const FormPage({Key key, this.toggleView}) : super(key: key);
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final AuthService _auth = AuthService();
  String name,email,phone,pass;
  bool loading = false;
  String error = '';
  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  child: Image.network("https://protocoderspoint.com/wp-content/uploads/2020/10/PROTO-CODERS-POINT-LOGO-water-mark-.png"),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person,"Full Name"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      name = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
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
                    onSaved: (String value){
                      email = value;
                    },
                    onChanged: (val){
                      setState(() {
                        email= val;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration:buildInputDecoration(Icons.phone,"Phone No"),
                    validator: (String value){
                      if(value.isEmpty || value.length<10)
                      {
                        return 'Please enter phone no ';
                      }
                      return null;
                    },
                    onSaved: (String value){
                      phone = value;
                    },
                    onChanged: (val){
                      setState(() {
                        phone= val;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: password,
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
                        pass= val;
                      });
                    },

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    controller: confirmpassword,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration:buildInputDecoration(Icons.lock,"Confirm Password"),
                    validator: (String value){
                      if(value.isEmpty)
                      {
                        return 'Please re-enter password';
                      }
                      print(password.text);

                      print(confirmpassword.text);

                      if(password.text!=confirmpassword.text){
                        return "Password does not match";
                      }

                      return null;
                    },
                    onSaved: (String value){
                      pass = value;
                    },

                  ),
                ),

                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.redAccent,
                    onPressed: () async {

                      if(_formkey.currentState.validate())
                      {
                        print("successful");
                        dynamic result = await _auth.registerWithEmailAndPassword(email, pass);
                        if(result == null){
                          setState(() {
                            error='enter valid email';
//                            loading= true;
                          });
                        }
                        return;
                      }else{
                        print("UnSuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.blue,width: 2)
                    ),
                    textColor:Colors.white,child: Text("Register"),

                  ),

                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red,fontSize: 14.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
