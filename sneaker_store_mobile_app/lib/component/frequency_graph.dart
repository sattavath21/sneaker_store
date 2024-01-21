import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FrequencyGraph extends StatelessWidget {
  const FrequencyGraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Adjust height as needed
      padding: EdgeInsets.all(16.0),
      color: Colors.grey[200], // Adjust color as needed
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 5),
                FlSpot(1, 8),
                FlSpot(2, 12),
                // Add more FlSpot as needed
              ],
              isCurved: true, // Add this line to make the line curved
              color: Colors.blue, // Color of the line
              belowBarData: BarAreaData(show: false), // Hide below bar data
            ),
          ],
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.blueAccent,
            ),
            touchCallback:
                (FlTouchEvent touchEvent, LineTouchResponse? touchResponse) {
              // Handle touch response
            },
            handleBuiltInTouches: true,
          ),
        ),
      ),
    );
  }
}