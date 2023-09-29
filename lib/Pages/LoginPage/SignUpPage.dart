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
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: SignUpHeaderWidget(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFieldWidget(
                  controller: TextEditingController(), hint: 'Name'),
              TextFieldWidget(
                  controller: TextEditingController(), hint: 'Email'),
              TextFieldWidget(
                  controller: TextEditingController(), hint: 'Password'),
              const TextButtonWidget(),
              const SizedBox(height: 30.0),
              const SignUpButtonWidget(),
              const SizedBox(height: 30.0),
              const Text('Or sign up with social account'),
              const SocialSignUpWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpHeaderWidget extends StatelessWidget {
  const SignUpHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
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
    );
  }
}

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
        ));
  }
}

class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0xffDB3022)),
      width: Size.infinite.width,
      height: 48.0,
      child: const Center(
          child: Text(
        'SIGN UP',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      )),
    );
  }
}

class SocialSignUpWidget extends StatelessWidget {
  const SocialSignUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/facebook.png'),
          Image.asset('assets/images/google.png'),
        ],
      ),
    );
  }
}
