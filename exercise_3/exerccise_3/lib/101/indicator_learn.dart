import 'package:flutter/material.dart';

class IndicatorLearnView extends StatelessWidget {
  const IndicatorLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [CenterCircularPorgresIndicator()],
      ),
      body: CenterCircularPorgresIndicator(),
    );
  }
}

class CenterCircularPorgresIndicator extends StatelessWidget {
  const CenterCircularPorgresIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
