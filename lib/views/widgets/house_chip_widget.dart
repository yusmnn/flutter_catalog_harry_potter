import 'package:flutter/material.dart';

import '../theme/colors_theme.dart';
import '../utils/const.dart';

class HouseChipWidget extends StatelessWidget {
  const HouseChipWidget({super.key, this.house});

  final String? house;

  Color getHouseColor(String? house) {
    switch (house) {
      case House.gryffindor:
        return ColorsTheme.red;
      case House.hufflepuff:
        return ColorsTheme.yellow;
      case House.ravenclaw:
        return ColorsTheme.lighBlue;
      case House.slytherin:
        return ColorsTheme.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: getHouseColor(house),
      ),
      child: Text(
        house == "" ? "Unknown" : house ?? "Unknown",
        maxLines: 1,
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
