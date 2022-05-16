
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:loginscreen/Home.dart';
import 'package:loginscreen/signUp.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {

 final formKey = GlobalKey<FormState>();

 String email ='';
 String password ='';
late bool _secureText = true;
bool isChecked = false;
  @override
  Widget build(BuildContext context) =>Scaffold(
   body: Form(
     autovalidateMode: AutovalidateMode.onUserInteraction,
     key: formKey,
     child: Container(
       decoration: BoxDecoration(
         gradient: LinearGradient(colors: [
         Color(0xFFa640ff),
         Colors.white,
         ],
           begin: Alignment.topLeft,
           end: Alignment.bottomRight,
         ),
       ),
       child: GestureDetector(
         onTap: ()=>FocusScope.of(context).unfocus(),
         child: SingleChildScrollView(
           child: Column(
             children: <Widget>[
               SizedBox(height: 100),
               Text('Sign in',
               style: TextStyle(
                 wordSpacing: 3,
                 fontSize: 35,
                 fontWeight: FontWeight.bold,
                 color: Colors.white,
               ),
               ),
               Text('Login to your account',
                 style: TextStyle(
                   letterSpacing: 2,
                   fontWeight: FontWeight.bold,
                   color: Colors.white,
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(18),
                 child: Container(
                   decoration: BoxDecoration(
                     color: Colors.white,
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(15),
                 child: Container(
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.all(Radius.circular(15),
                     ),
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(20),
                     child: Column(
                       children: <Widget>[
                         SizedBox(height: 40),
                         TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Username or e-mail',
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10),
                              ),
                            ),
                          ),
                         ),
                         SizedBox(height: 20),
                         TextFormField(
                           obscureText: _secureText,
                           validator: (value){
                             if(value!=null && value.length < 6){
                               return "Enter Min. 6 Characters";
                             }
                            else{
                              return null;
                             }
                           },
                           decoration: InputDecoration(
                             labelText: 'Password',
                             prefixIcon: Icon(Icons.vpn_key_outlined),
                             suffixIcon: IconButton(
                                 onPressed: () =>setState(() {
                                   _secureText = !_secureText;
                                 }),
                              icon: Icon(_secureText ? Icons.visibility_off : Icons.remove_red_eye),
                               ),
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(10),
                               ),
                             ),
                           ),
                         ),
                         Row(
                           children: [
                             TextButton(
                                 onPressed: (){},
                                 child: Text('Forgot password?',
                                 style: TextStyle(
                                   color: Colors.deepPurple,
                                 ),
                                 ),
                             ),
                             SizedBox(width: 40),
                             Checkbox(
                               value: isChecked,
                               onChanged: (value) {
                                 setState(() => isChecked = value!);
                               },
                              activeColor: Colors.deepPurple,
                             ),
                             Text('Keep me Signed',
                               style: TextStyle(
                                 color: Colors.deepPurple,
                               ),
                             ),
                           ],
                         ),
                         SizedBox(height: 30),
                         SizedBox(
                           width: 500,
                             height: 48,
                             child: RaisedButton(
                               onPressed: (){
                                 final isValideForm = formKey.currentState!.validate();

                                 if(isValideForm){
                                   Navigator.of(context).pushAndRemoveUntil(
                                       MaterialPageRoute(builder: (context)=>Home(
                                           email: email, password: password),
                                       ),
                                           (route) => false);
                                 }

                               },
                                 child: Text('SIGN IN',
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 20,
                                   fontWeight: FontWeight.bold,
                                 ),
                                 ),
                               color: Colors.deepPurple.withOpacity(0.7),
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.all(Radius.circular(8),
                                 ),
                               ),
                             ),
                         ),
                         TextButton(
                           onPressed: ()=>Navigator.push(context,
                             MaterialPageRoute(builder: (context)=>signUp(),
                             ),
                           ),
                           child: Text('Sign up ',
                             style: TextStyle(
                               color: Colors.deepPurple,
                             ),
                           ),
                         ),
                         SizedBox(height: 6),
                         Stack(

                             children:[
                               Divider(
                                 thickness: 2,
                                 indent: 15,
                                 endIndent: 180,
                               ),
                               Center(child: Text(' or ',
                                 style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   color: Colors.black54,
                                   letterSpacing: 1,
                                 ),
                               ),
                               ),
                               Divider(
                                 thickness: 2,
                                 indent: 180,
                                 endIndent: 15,
                               ),
                             ]
                         ),
                         SizedBox(height: 20),
                         SizedBox(
                           width: 500,
                           height: 48,
                           child: RaisedButton.icon(
                             onPressed: (){},
                             icon: Icon(Icons.facebook,
                             color: Colors.white,
                             ),
                             label: Text('LOGIN WITH FACEBOOK',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 18,
                               ),
                             ),
                             color: Colors.blueAccent[400],
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.all(Radius.circular(8),
                               ),
                             ),
                           ),
                         ),
                         SizedBox(height: 20),
                         SizedBox(
                           width: 500,
                           height: 48,
                           child: RaisedButton.icon(
                             onPressed: (){},
                             icon: Image.asset('images/google-logo-9825-64x64.ico',
                             scale: 3,
                               color: Colors.white,
                             ),
                             label: Text('LOGIN WITH GOOGLE',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 18,
                               ),
                             ),
                             color: Colors.redAccent,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.all(Radius.circular(8),
                               ),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
               TextButton(
                 onPressed: (){},
                 child: Text('Dont\'t you have an account? Sign up Now!',
                 style: TextStyle(
                   color: Colors.deepPurple,
                 ),
                 ),
               ),
               SizedBox(height: 40),

             ],
           ),
         ),
       ),
     ),
   ),
  );
}

