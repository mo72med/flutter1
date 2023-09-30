import 'package:flutter/material.dart';

class FindingPage extends StatelessWidget {
  const FindingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.search,
                  size: 48.5,
                  color: Color(0xffDB3022),
                ),
                SizedBox(height: 10.0),
                Text(
                  textAlign: TextAlign.center,
                  'Finding similar \n results...',
                  style: TextStyle(
                    fontSize: 32.0,
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
