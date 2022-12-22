import 'package:flutter/material.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        'TV Screen',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
