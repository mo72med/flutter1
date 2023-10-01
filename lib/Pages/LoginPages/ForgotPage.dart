import 'package:flutter/material.dart';
import '../../Componant/BackArrowWidget.dart';
import '../../Componant/ButtonWidget.dart';
import '../../Componant/textFormFieldWidget.dart';

class ForgotPage extends StatelessWidget {
  const ForgotPage({super.key});

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
          child: ForgotHeaderWidget(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                  'Please, enter your email address. You will receive a link to create a new password via email.'),
              TextFieldWidget(hint: 'Email'),
              const SizedBox(height: 30.0),
              ButtonWidget(
                title: 'SEND',
                buttonBorder: false,
                ontap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotHeaderWidget extends StatelessWidget {
  const ForgotHeaderWidget({
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
                'Forgot password',
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
