import 'package:flutter/material.dart';
import 'package:flutter1/Componant/ButtonWidget.dart';
import 'package:flutter1/routes/router_names.dart';

import '../../routes/router.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SuccessFirstModeWidget(),
    );
  }
}

class SuccessFirstModeWidget extends StatelessWidget {
  const SuccessFirstModeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/images/success.png', fit: BoxFit.cover),
        Positioned(
          top: 121.0,
          left: MediaQuery.of(context).size.width / 5,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Success!',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  textAlign: TextAlign.justify,
                  '''Your order will be delivered soon.\nThank you for choosing our app!''',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                ButtonWidget(
                  height: 36.0,
                  width: 160,
                  title: 'Continue shopping',
                  ontap: () => Navigator.push(
                      context,
                      onGenerateRoute(
                          const RouteSettings(name: mainPageRoute))),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class SuccessSecondModeWidget extends StatelessWidget {
  const SuccessSecondModeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 192.0,
          left: 70.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/bags.png',
                fit: BoxFit.contain,
                height: 213,
                width: 208,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Success!',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 34.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              const Text(
                textAlign: TextAlign.justify,
                '''Your order will be delivered soon.\nThank you for choosing our app!''',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              ButtonWidget(
                height: 36.0,
                width: 160,
                title: 'Continue shopping',
                ontap: () => Navigator.push(context,
                    onGenerateRoute(const RouteSettings(name: mainPageRoute))),
              )
            ],
          ),
        )
      ],
    );
  }
}
