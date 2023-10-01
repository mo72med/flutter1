import 'package:flutter/material.dart';
import '../../Componant/BackArrowWidget.dart';
import '../../Componant/ButtonWidget.dart';
import '../../Componant/textFormFieldWidget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5fefd),
      appBar: AppBar(
        backgroundColor: const Color(0xfff5fefd),
        leading: BackArrowWidget(ontap: () {}),
        elevation: 0.0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: SignInHeaderWidget(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFieldWidget(hint: 'Email'),
              TextFieldWidget(hint: 'Password'),
              const ForgotButtonWidget(),
              const SizedBox(height: 30.0),
              ButtonWidget(title: 'LOGIN', buttonBorder: false, ontap: () {}),
              const SizedBox(height: 50.0),
              const Text('Or sign up with social account'),
              const SocialSignInWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class SignInHeaderWidget extends StatelessWidget {
  const SignInHeaderWidget({
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
                'Login',
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

class ForgotButtonWidget extends StatelessWidget {
  const ForgotButtonWidget({
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
              'Forgot your Password ? ',
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

class SocialSignInWidget extends StatelessWidget {
  const SocialSignInWidget({
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
