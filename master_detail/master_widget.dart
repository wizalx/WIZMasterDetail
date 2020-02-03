import 'package:flutter/material.dart';
import 'scrollable_list_view.dart';

//  ---------------------
//  |  M  |    D        |
//  |  A  |     E       |
//  |  S  |      T      |
//  |  T  ->      A     |
//  |  E  |        I    |
//  |  R  |         L   |
//  ---------------------
abstract class MasterWidget extends StatelessWidget {

  MasterWidget({this.builder, this.itemCount, this.appBar});

  /// Call this action on your Widget
  /// extended of MasterWidget
  /// for send information of selection to DetailWidget
  ValueChanged<int> itemSelectedCallback;
  final scrollableListBuilder builder;
  final AppBar appBar;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: appBar
        ),
        body: AutoScrollableListView(
          itemCount: itemCount,
          builder: builder,
          selectRowAtIndex: itemSelectedCallback,
        )
    );
  }

}
