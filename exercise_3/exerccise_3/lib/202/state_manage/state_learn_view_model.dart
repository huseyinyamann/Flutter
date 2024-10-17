import 'package:exerccise_3/202/state_manage/state_manage_learn_view.dart';
import 'package:flutter/material.dart';

abstract class StateLearnViewModel extends State<StateManageLearnView>{
    @override
  void initState() {
    super.initState();
  }

  bool isVisible = false;
  bool isOpacity = false;


  void changeVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void changeOpacity() {
    setState(() {
      isOpacity = !isOpacity;
    });
  }
}