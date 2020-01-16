import 'package:flutter/material.dart';

//  ---------------------
//  |  M  |    D        |
//  |  A  |     E       |
//  |  S  |      T      |
//  |  T  ->      A     |
//  |  E  |        I    |
//  |  R  |         L   |
//  ---------------------
abstract class DetailWidget extends StatelessWidget {

  /// override this method in new Widget
  /// extended of Detail Widget for
  /// get selected row in MasterWidget
  selectRow(int row){}

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
