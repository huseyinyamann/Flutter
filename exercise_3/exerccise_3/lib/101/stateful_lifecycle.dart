import 'package:flutter/material.dart';

class StatefulLifecycleLearnView extends StatefulWidget {
  const StatefulLifecycleLearnView({super.key, required this.message});
  final String message;

// mesaj tekse yanına tek ciftse cift yaz
  @override
  State<StatefulLifecycleLearnView> createState() =>
      _StatefulLifecycleLearnViewState();
}

class _StatefulLifecycleLearnViewState
    extends State<StatefulLifecycleLearnView> {
  String _message = '';
  late final bool _isOdd;

  @override
  void didChangeDependencies() {
    //initten sonra - cizimden once ve cizim tekrarlandıgında tetiklenir.
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant StatefulLifecycleLearnView oldWidget) {
    //eskiyle karsılastırma var
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != widget.message) {
      _message = widget.message;
      _computeName();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _message = widget.message;
    _isOdd = _message.length.isOdd;

    _computeName();
  }

  void _computeName() {
    if (_isOdd)
      _message += ' Çift';
    else
      _message += ' Tek';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_message),
      ),
    );
  }
}
