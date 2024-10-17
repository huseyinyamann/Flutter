import 'package:exerccise_3/202/oop_learn.dart';
import 'package:flutter/material.dart';

class OopLearnView extends StatefulWidget {
  const OopLearnView({super.key});

  @override
  State<OopLearnView> createState() => _OopLearnViewState();
}

class _OopLearnViewState extends State<OopLearnView> {
  FileDownload? fileDownload;

  @override
  void initState() {
    // TODO: implement initState

    fileDownload = FileDownload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        fileDownload?.downloadItem(null);
      }),
    );
  }
}
