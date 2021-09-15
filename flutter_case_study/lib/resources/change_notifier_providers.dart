import 'package:flutter_case_study/providers/departure_providers.dart';
import 'package:flutter_case_study/providers/login_providers.dart';
import 'package:flutter_case_study/providers/ticket_providers.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider.value(
    value: LoginProviders(),
  ),
  ChangeNotifierProvider.value(
    value: DepartureProviders(),
  ),
  ChangeNotifierProvider.value(
    value: TicketProviders(),
  ),
];
