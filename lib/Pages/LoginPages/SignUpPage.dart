import 'package:flutter/material.dart';

import '../../Componant/BackArrowWidget.dart';
import '../../Componant/ButtonWidget.dart';
import '../../Componant/textFormFieldWidget.dart';
import '../../routes/router.dart';
import '../../routes/router_names.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

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
          child: SignUpHeaderWidget(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFieldWidget(hint: 'Name'),
              TextFieldWidget(hint: 'Email'),
              TextFieldWidget(hint: 'Password'),
              const TextButtonWidget(),
              const SizedBox(height: 30.0),
              ButtonWidget(
                title: 'SIGNUP',
                buttonBorder: false,
                ontap: () => Navigator.push(
                    context,
                    onGenerateRoute(
                        const RouteSettings(name: signInPageRoute))),
              ),
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
        onPressed: () => Navigator.push(context,
            onGenerateRoute(const RouteSettings(name: signInPageRoute))),
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
