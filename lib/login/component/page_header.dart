import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset('assets/logo/logo.png',
      height: 80,
      width: 80,
      ),
    );
  }
}
