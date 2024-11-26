import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/layouts/headers/header.dart';

class DesktopLayout extends StatelessWidget {
  DesktopLayout({
    super.key,
    this.body,
  });

  final Widget? body;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(child: Drawer()),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                // Header
                const CustomHeader(),

                // Body
                body ?? const SizedBox()
              
              ],
            ),
            // Header
          )
        ],
      ),
    );
  }
}