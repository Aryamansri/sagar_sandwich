import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: const SizedBox(
            height: 250,
            child: Image(
              image: AssetImage('assets/y.avif'),
              height: 200,
              width: 400,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
