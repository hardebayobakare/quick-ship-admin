
import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/layouts/headers/header.dart';
import 'package:quick_shop_admin/common/widgets/layouts/sidebars/sidebar.dart';

class MobileLayout extends StatelessWidget {
  MobileLayout({
    super.key,
    this.body,
  });

  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomSideBar(),
      appBar: CustomHeader(scaffoldKey: scaffoldKey),
      body: body ?? const SizedBox(),
    );
  }
}