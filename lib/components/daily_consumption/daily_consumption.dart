import 'package:flutter/material.dart';
import 'daily_consumption_style.dart';

class DailyConsumption extends StatelessWidget {
  final int cigaretteCount;
  final int cbdCount;

  const DailyConsumption({
    super.key,
    required this.cigaretteCount,
    required this.cbdCount,
  });

  Widget _stat(
    int count,
    Color countColor,
    BoxDecoration iconDecoration,
    Color iconColor,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$count',
          style: DailyConsumptionStyle.countStyle.copyWith(color: countColor),
        ),
        const SizedBox(width: DailyConsumptionStyle.countLabelGap),
        Container(
          width: DailyConsumptionStyle.iconButtonSize,
          height: DailyConsumptionStyle.iconButtonSize,
          decoration: iconDecoration,
          child: Icon(
            Icons.smoking_rooms,
            size: DailyConsumptionStyle.iconSize,
            color: iconColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: DailyConsumptionStyle.containerMargin,
      padding: DailyConsumptionStyle.padding,
      decoration: DailyConsumptionStyle.containerDecoration,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DailyConsumptionStyle.title,
            style: DailyConsumptionStyle.titleStyle,
          ),
          const SizedBox(height: DailyConsumptionStyle.titleBottomGap),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _stat(
                cigaretteCount,
                DailyConsumptionStyle.cigaretteColor,
                DailyConsumptionStyle.cigaretteIconDecoration,
                DailyConsumptionStyle.cigaretteIconColor,
              ),
              const SizedBox(width: DailyConsumptionStyle.statSpacing),
              _stat(
                cbdCount,
                DailyConsumptionStyle.cbdColor,
                DailyConsumptionStyle.cbdIconDecoration,
                DailyConsumptionStyle.cbdIconColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
