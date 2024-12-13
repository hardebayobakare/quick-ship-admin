import 'package:flutter/material.dart';
import 'package:quick_shop_admin/common/widgets/circluar_container.dart';
import 'package:quick_shop_admin/utils/helpers/helper_functions.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        avatar: CustomHelperFunctions.getColor(text) != null
          ? CustomCircularContainer(
            width: 50,
            height: 50,
            backgroundColor: CustomHelperFunctions.getColor(text)!,
          )
          : null,
        selected: selected,
        onSelected: onSelected,
        backgroundColor: CustomHelperFunctions.getColor(text),
        labelStyle: TextStyle(color: selected ? Colors.white : null),
        shape: CustomHelperFunctions.getColor(text) != null
          ? const CircleBorder()
          : null, 
        label: CustomHelperFunctions.getColor(text) == null
          ? Text(text)
          : const SizedBox(),
        padding: CustomHelperFunctions.getColor(text) != null
          ? const EdgeInsets.all(0)
          : null,
        labelPadding: CustomHelperFunctions.getColor(text) != null
          ? const EdgeInsets.all(0)
          : null,
      ),
    );
  }
}