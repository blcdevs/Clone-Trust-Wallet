import 'package:flutter/material.dart';
import 'package:clone_trust/app/ui/buy_page.dart';
import 'package:clone_trust/app/ui/dashboard_page.dart';
import 'package:clone_trust/app/ui/receive_page.dart';
import 'package:clone_trust/app/ui/send_page.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/send':
        return MaterialPageRoute<dynamic>(builder: (context) => SendPage());

      case '/buy':
        return MaterialPageRoute<dynamic>(builder: (context) => BuyPage());

      case '/receive':
        return MaterialPageRoute<dynamic>(builder: (context) => ReceivePage());

      default:
        return MaterialPageRoute<dynamic>(
            builder: (context) => const DashboardPage());
    }
  }
}
