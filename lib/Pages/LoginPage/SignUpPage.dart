import 'package:flutter/material.dart';
import '../../Componant/textFormField.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5fefd),
      appBar: AppBar(
        backgroundColor: const Color(0xfff5fefd),
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(children: const [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 34.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFieldWidget(
                  controller: TextEditingController(), Hint: 'Name'),
              TextFieldWidget(
                  controller: TextEditingController(), Hint: 'Email'),
              TextFieldWidget(
                  controller: TextEditingController(), Hint: 'Password'),
              TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Already have an account ? ',
                        style: TextStyle(color: Color(0xff222222)),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color: Color(0xffDB3022),
                      )
                    ],
                  )),
              const SizedBox(height: 30.0),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xffDB3022)),
                width: Size.infinite.width,
                height: 48.0,
                child: const Center(
                    child: Text(
                  'SIGN UP',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
              const SizedBox(height: 30.0),
              const Text('Or sign up with social account'),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/facebook.png'),
                    Image.asset('assets/images/google.png'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
