import 'package:flutter/material.dart';

//  ---------------------
//  |  M  |    D        |
//  |  A  |     E       |
//  |  S  |      T      |
//  |  T  ->      A     |
//  |  E  |        I    |
//  |  R  |         L   |
//  ---------------------
abstract class MasterWidget extends StatelessWidget {

  MasterWidget({this.itemSelectedCallback});

  /// Call this action on your Widget
  /// extended of MasterWidget
  /// for send information of selection to DetailWidget
  ValueChanged<int> itemSelectedCallback;

  @override
  Widget build(BuildContext context) {
    return Container();
  }


}
