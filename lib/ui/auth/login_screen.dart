import 'package:firebasewithfullterlogin/widgets/round_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login')),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller:emailController ,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          helperText: 'enter email e.g john@gmail.com',
                          prefixIcon: Icon(Icons.email)
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter Email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'password',
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter password';
                        }
                        return null;
                      },
                    ),
                  ],
                )
            ),
            SizedBox(
              height: 50,
            ),
            RoundButton(title: 'Login' , onTap: (){
              formKey.currentState?.validate();
            },)
          ],
        ),
      ),
    );
  }
}
