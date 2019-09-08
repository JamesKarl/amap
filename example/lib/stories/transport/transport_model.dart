import 'package:amap_example/repository/transport/bean/RegionItemBean.dart';
import 'package:flutter/cupertino.dart';

class TransportModel extends ChangeNotifier {
  RegionBean _currentRegion;

  RegionBean get currentRegion => _currentRegion;

  set currentRegion(RegionBean value) {
    if (value != _currentRegion) {
      _currentRegion = value;
      _currentFlow = _currentRegion?.flowList?.first;
      notifyListeners();
    }
  }

  FlowBean _currentFlow;

  FlowBean get currentFlow => _currentFlow;

  set currentFlow(FlowBean value) {
    if (value != _currentFlow) {
      _currentFlow = value;
      notifyListeners();
    }
  }

  bool _expended = true;

  bool get expanded => _expended;

  set expanded(bool value) {
    if (value != _expended) {
      _expended = value;
      notifyListeners();
    }
  }

  void toggleExpanded() {
    _expended = !_expended;
    notifyListeners();
  }

  void onVerticalDragUpdate(DragUpdateDetails details) {
    if (details.delta.dy < -5) {
      expanded = true;
    } else if (details.delta.dy > 5) {
      expanded = false;
    }
  }
}
