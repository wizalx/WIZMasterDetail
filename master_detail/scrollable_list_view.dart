import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:math';

typedef scrollableListBuilder = Widget Function(int index, bool selected, ValueChanged<int> onTap);

class AutoScrollableListView extends StatefulWidget {

  AutoScrollableListView({this.builder, this.itemCount, this.selectRowAtIndex});
  final scrollableListBuilder builder;
  final int itemCount;
  final ValueChanged<int> selectRowAtIndex;

  @override
  _AutoScrollableListViewState createState() => _AutoScrollableListViewState(
      builder: this.builder,
      itemCount: this.itemCount,
      selectRowAtIndex: selectRowAtIndex
  );
}

class _AutoScrollableListViewState extends State<AutoScrollableListView> {

  _AutoScrollableListViewState({this.builder, this.itemCount, this.selectRowAtIndex});
  final scrollableListBuilder builder;
  final int itemCount;
  final ValueChanged<int> selectRowAtIndex;

  int _currentSelect = 0;

  ScrollController _scrollController = new ScrollController();
  bool isTablet;

  @override
  Widget build(BuildContext context) {
    isTablet = _isTablet();

    if (isTablet)
      SchedulerBinding.instance.addPostFrameCallback((_) {
//        _scrollController.animateTo(_currentSelect*60.0, duration: Duration(milliseconds: 400), curve: Curves.ease);
        _scrollController.jumpTo(_currentSelect*60.0);
      });

    return  Scrollbar(
      child: ListView.builder(
          key: isTablet ? Key(_randomString()) : Key("1"),
          itemCount: itemCount,
          controller: _scrollController,
          itemBuilder: (context, index) {
            return builder(index, _currentSelect == index, selectRow);
          }
      ),
    );
  }

  String _randomString()
  {
    var rng = new Random();
    return rng.nextInt(500000).toString();
  }

  selectRow(int i)
  {
    if (isTablet)
      setState(() {
        _currentSelect = i;
      });

    selectRowAtIndex(i);
  }

  /// Check Tablet
  bool _isTablet() {
    return MediaQuery.of(context).size.shortestSide > 600;
  }
}