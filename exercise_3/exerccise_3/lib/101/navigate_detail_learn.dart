import 'package:flutter/material.dart';

class NavigateDetailLearnView extends StatefulWidget {
  const NavigateDetailLearnView({super.key, this.isOkey = false});
  final bool isOkey;
  @override
  State<NavigateDetailLearnView> createState() =>
      _NavigateDetailLearnViewState();
}

class _NavigateDetailLearnViewState extends State<NavigateDetailLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton.icon(
            onPressed: () {
              Navigator.of(context).pop(!widget.isOkey);
            },
            label: Text(
              widget.isOkey ? 'Red' : 'Onayla',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color:
                        widget.isOkey ? Colors.red : Colors.green,
                  ),
            )),
      ),
    );
  }
}
