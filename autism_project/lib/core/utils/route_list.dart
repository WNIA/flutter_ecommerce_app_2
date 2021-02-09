import 'package:autism_project/presentation/ui/change_password_page.dart';
import 'package:autism_project/presentation/ui/finished_deliveries_page.dart';
import 'package:autism_project/presentation/ui/home_page.dart';
import 'package:autism_project/presentation/ui/initialize_page.dart';
import 'package:autism_project/presentation/ui/notice_page.dart';
import 'package:autism_project/presentation/ui/pending_order_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routeList() {
  return {
    PendingOrderPage.routeName: (context) => PendingOrderPage(),
    HomePage.routeName: (context) => HomePage(),
    Initialize.routeName: (context) => Initialize(),
    FinishedDeliveriesPage.routeName: (context) => FinishedDeliveriesPage(),
    NoticePage.routeName: (context) => NoticePage(),
    ChangePasswordPage.routeName: (context) => ChangePasswordPage(),
  };
}
