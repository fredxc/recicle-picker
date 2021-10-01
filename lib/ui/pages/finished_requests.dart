import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:picker/ui/pages/tabs/request_list.dart';
import 'package:picker/util/state_widget.dart';
import 'package:picker/models/state.dart';
import 'package:flutter/material.dart';

class RequestHistoryPage extends StatefulWidget {
  _RequestHistoryPageState createState() => _RequestHistoryPageState();
}

class _RequestHistoryPageState extends State<RequestHistoryPage> {
  PanelController panel;
  StateModel appState;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    final userId = appState?.user?.userId ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Text("Coletas Finalizadas"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: RequestList(panel, 3, userId: userId),
      ),
    );
  }
}
