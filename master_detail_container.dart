import 'package:flutter/material.dart';
import 'package:kontragent_flutter/master_detail/detail_widget.dart';
import 'master_widget.dart';

//  ---------------------
//  |  M  |    D        |
//  |  A  |     E       |
//  |  S  |      T      |
//  |  T  ->      A     |
//  |  E  |        I    |
//  |  R  |         L   |
//  ---------------------
class MasterDetailContainer extends StatefulWidget {

  final MasterWidget master;
  final DetailWidget detail;

  MasterDetailContainer({@required this.master, @required this.detail});

  @override
  _MasterDetailContainerState createState() => _MasterDetailContainerState(master, detail);
}

class _MasterDetailContainerState extends State<MasterDetailContainer> {
  static const int kTabletBreakpoint = 600;

  _MasterDetailContainerState(this.masterWidget, this.detailWidget);
  final MasterWidget masterWidget;
  final DetailWidget detailWidget;

  /// In mobile version Master and Detail controllers is two different screens
  /// After click in Master screen app pushed on Detail controller
  Widget _buildMobile() {
    masterWidget.itemSelectedCallback = _selectRowOnMobile;
    return masterWidget;
  }

  _selectRowOnMobile(int id)
  {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return detailWidget;
          },
        ),
    );

    // TODO: do it better
    detailWidget.selectRow(id);
  }

  /// In tablet version, Master and Detail widgets are located
  /// on screen, how it pictured on scheme drawn at the top
  /// this class
  Widget _buildTablet() {
    masterWidget.itemSelectedCallback = _selectRowOnTablet;

    return Row(
      children: <Widget>[
        Flexible(
          flex: 3,
          child: Row(
            children: <Widget>[
              Flexible(child: masterWidget),
              Container(
                width: 1,
                color: Colors.grey,
              )
            ],
          ) ,
        ),
        Flexible(
          flex: 7,
          child: detailWidget,
        )
      ],
    );
  }

  _selectRowOnTablet(int id) {
    detailWidget.selectRow(id);
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    var shortestSide = MediaQuery.of(context).size.shortestSide;

    // check size of screen
    if (shortestSide < kTabletBreakpoint) {
      content = _buildMobile();
    } else {
      content = _buildTablet();
    }

    return content;
  }
}
