import 'package:flutter/material.dart';

class TabLearnView extends StatefulWidget {
  const TabLearnView({super.key});

  @override
  State<TabLearnView> createState() => _TabLearnViewState();
}

class _TabLearnViewState extends State<TabLearnView>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  final _notchedValue = 10.0;
  @override
  void initState() {
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _tabController.animateTo(_MyTabViews.home.index);
          },
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: _notchedValue,
          shape: CircularNotchedRectangle(),
          child: TabBar(
            padding: EdgeInsets.zero, // bazen crash olabilir engelle
            unselectedLabelColor: Colors.white,
            labelColor: Colors.green,
            controller: _tabController,
            tabs: _MyTabViews.values
                .map((e) => Tab(
                      text: '${e.name}',
                    ))
                .toList(),
          ),
        ),
        body: _myTabView(tabController: _tabController),
      ),
    );
  }
}

class _myTabView extends StatelessWidget {
  const _myTabView({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(controller: _tabController, children: [
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.amber,
      )
    ]);
  }
}

enum _MyTabViews { home, settings, favorite, profile }
