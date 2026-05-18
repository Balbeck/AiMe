import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'cigarette_chart_style.dart';

class _ChartLine {
  final List<FlSpot> spots;
  final Color color;
  final String label;
  final bool isCurved;

  const _ChartLine({
    required this.spots,
    required this.color,
    required this.label,
    required this.isCurved,
  });
}

class CigaretteChart extends StatelessWidget {
  final List<DateTime> cigaretteTimestamps;
  final List<DateTime> cbdTimestamps;

  const CigaretteChart({
    super.key,
    required this.cigaretteTimestamps,
    required this.cbdTimestamps,
  });

  Map<int, int> _groupByHour(List<DateTime> timestamps) {
    final map = <int, int>{};
    for (final t in timestamps) {
      map[t.hour] = (map[t.hour] ?? 0) + 1;
    }
    return map;
  }

  List<FlSpot> _hourlySpots(Map<int, int> byHour, int maxHour) {
    final spots = <FlSpot>[];
    for (int h = 0; h <= maxHour; h++) {
      final count = byHour[h] ?? 0;
      if (count > 0) spots.add(FlSpot(h.toDouble(), count.toDouble()));
    }
    return spots;
  }

  List<FlSpot> _cumulativeSpots(Map<int, int> byHour, int maxHour) {
    final spots = <FlSpot>[];
    int cumul = 0;
    for (int h = 0; h <= maxHour; h++) {
      cumul += byHour[h] ?? 0;
      if (cumul > 0) spots.add(FlSpot(h.toDouble(), cumul.toDouble()));
    }
    return spots;
  }

  Widget _legendItem(Color color, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: CigaretteChartStyle.legendItemSpacing,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: CigaretteChartStyle.legendDotSize,
            height: CigaretteChartStyle.legendDotSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
          const SizedBox(width: CigaretteChartStyle.legendDotLabelGap),
          Text(label, style: CigaretteChartStyle.legendTextStyle),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEmpty =
        cigaretteTimestamps.isEmpty && cbdTimestamps.isEmpty;

    final maxHour = DateTime.now().hour;
    final cigByHour = _groupByHour(cigaretteTimestamps);
    final cbdByHour = _groupByHour(cbdTimestamps);

    final lines = [
      _ChartLine(
        spots: _hourlySpots(cigByHour, maxHour),
        color: CigaretteChartStyle.cigHourlyColor,
        label: CigaretteChartStyle.labelCigPerHour,
        isCurved: false,
      ),
      _ChartLine(
        spots: _cumulativeSpots(cigByHour, maxHour),
        color: CigaretteChartStyle.cigCumulColor,
        label: CigaretteChartStyle.labelCigCumul,
        isCurved: false,
      ),
      _ChartLine(
        spots: _hourlySpots(cbdByHour, maxHour),
        color: CigaretteChartStyle.cbdHourlyColor,
        label: CigaretteChartStyle.labelCbdPerHour,
        isCurved: false,
      ),
      _ChartLine(
        spots: _cumulativeSpots(cbdByHour, maxHour),
        color: CigaretteChartStyle.cbdCumulColor,
        label: CigaretteChartStyle.labelCbdCumul,
        isCurved: false,
      ),
    ];

    final rawMax = isEmpty
        ? 4.0
        : lines
            .expand((l) => l.spots)
            .map((s) => s.y)
            .fold(0.0, (a, b) => a > b ? a : b);
    final maxY = rawMax < 1 ? 1.0 : rawMax.ceilToDouble();
    final yInterval = maxY <= 5
        ? 1.0
        : maxY <= 10
            ? 2.0
            : (maxY / 5).ceilToDouble();

    return Container(
      margin: CigaretteChartStyle.chartMargin,
      decoration: const BoxDecoration(
        color: CigaretteChartStyle.chartBackground,
        borderRadius: CigaretteChartStyle.chartRadius,
      ),
      child: Column(
        children: [
          Expanded(
            child: isEmpty
                ? const Center(
                    child: Text(
                      CigaretteChartStyle.emptyMessage,
                      style: CigaretteChartStyle.emptyMessageStyle,
                    ),
                  )
                : Padding(
                    padding: CigaretteChartStyle.chartPadding,
                    child: LineChart(
                      LineChartData(
                        minX: 0,
                        maxX: 23,
                        minY: 0,
                        maxY: maxY,
                        gridData: const FlGridData(show: true),
                        borderData: FlBorderData(show: false),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 28,
                              interval: yInterval,
                              getTitlesWidget: (v, m) => Text(
                                '${v.toInt()}',
                                style: CigaretteChartStyle.axisLabelStyle,
                              ),
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 22,
                              interval: 3,
                              getTitlesWidget: (v, m) => Text(
                                '${v.toInt()}h',
                                style: CigaretteChartStyle.axisLabelStyle,
                              ),
                            ),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        lineBarsData: lines
                            .map(
                              (l) => LineChartBarData(
                                spots: l.spots,
                                isCurved: l.isCurved,
                                color: l.color,
                                barWidth: CigaretteChartStyle.lineWidth,
                                dotData: FlDotData(
                                  show: true,
                                  getDotPainter: (s, x, bar, i) =>
                                      FlDotCirclePainter(
                                    radius: CigaretteChartStyle.dotRadius,
                                    color: l.color,
                                    strokeWidth: 0,
                                    strokeColor: Colors.transparent,
                                  ),
                                ),
                                belowBarData: BarAreaData(show: false),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: CigaretteChartStyle.legendPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: lines
                  .map((l) => _legendItem(l.color, l.label))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
