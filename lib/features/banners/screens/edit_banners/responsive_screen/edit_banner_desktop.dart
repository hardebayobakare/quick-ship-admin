import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/breadcrumbs/breadcrumbs_with_heading.dart';
import 'package:quick_shop_admin/features/banners/screens/edit_banners/widgets/edit_banner_form.dart';
import 'package:quick_shop_admin/routes/route.dart';
import 'package:quick_shop_admin/utils/constants/colors.dart';
import 'package:quick_shop_admin/utils/constants/sizes.dart';
import 'package:quick_shop_admin/utils/constants/text_strings.dart';

class EditBannerDesktopScreen extends StatelessWidget {
  const EditBannerDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: CustomColors.primaryBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CustomSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomBreadCrumbsWithHeading(returnToPreviousScreen:true, heading: CustomTextStrings.updateBanner, breadcrumbs: [CustomRoutes.banners, CustomTextStrings.updateBanner]),
                ],
              ),
              SizedBox(height: CustomSizes.spaceBtwSections),

              // Form Body
              EditBannerForm(),
            ],
          ),
        ),
      ),
    );
  }
}