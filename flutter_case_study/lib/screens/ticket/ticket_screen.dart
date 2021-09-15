import 'package:flutter/material.dart';
import 'package:flutter_case_study/widgets/AppBarWidget.dart';

import 'ticket_body.dart';

class TicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Tickets"),
      body: TicketBody(),
    );
  }
}
