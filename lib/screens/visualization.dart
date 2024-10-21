import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:healthviz/models/pain_log.dart';

class VisualizationScreen extends StatefulWidget {
  const VisualizationScreen({super.key});

  @override
  State<VisualizationScreen> createState() => _VisualizationScreenState();
}

class _VisualizationScreenState extends State<VisualizationScreen> {
  String selectedTimeFrame = 'Month';
  String selectedDataType = 'Pain';
  List<PainLog> painLogs = [];
  List<String> timeFrames = ['Week', 'Month', 'Year'];
  List<String> dataTypes = ['Pain', 'Habit'];

  // Dummy data for example
  void _loadDummyData() {
    painLogs = [
      PainLog(
          date: DateTime.now().subtract(const Duration(days: 30)),
          painLevel: 5,
          painLocation: 'Back',
          painType: 'Dull',
          painDuration: "19",
          notes: 'Some notes'),
      PainLog(
          date: DateTime.now().subtract(const Duration(days: 15)),
          painLevel: 3,
          painLocation: 'Head',
          painDuration: "10",
          painType: 'Sharp',
          notes: 'Some other notes'),
      // Add more logs
    ];
  }

  @override
  void initState() {
    super.initState();
    _loadDummyData(); // Load your dummy data
  }

  // This function generates the BarChartData dynamically based on selected timeframe and type
  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: Colors.purple,
          width: 20,
          borderRadius: BorderRadius.circular(5),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 10,
            color: Colors.grey.shade200,
          ),
        ),
      ],
    );
  }

  // Adjust the data for Day, Week, or Month
  List<BarChartGroupData> _getBarChartData() {
    List<BarChartGroupData> barChartData = [];
    if (selectedDataType == 'Pain') {
      if (selectedTimeFrame == 'Week') {
        barChartData = [
          makeGroupData(0, 5),
          makeGroupData(1, 7),
          makeGroupData(2, 3),
          makeGroupData(3, 8),
        ];
      } else if (selectedTimeFrame == 'Month') {
        barChartData = [
          makeGroupData(0, 6),
          makeGroupData(1, 4),
          makeGroupData(2, 7),
        ];
      } else if (selectedTimeFrame == 'Year') {
        barChartData = [
          makeGroupData(0, 4),
          makeGroupData(1, 8),
          makeGroupData(2, 5),
        ];
      }
    } else {
      // Habit data: Add different logic or dummy values here
      if (selectedTimeFrame == 'Week') {
        barChartData = [
          makeGroupData(0, 2),
          makeGroupData(1, 4),
          makeGroupData(2, 1),
          makeGroupData(3, 5),
        ];
      } else if (selectedTimeFrame == 'Month') {
        barChartData = [
          makeGroupData(0, 1),
          makeGroupData(1, 3),
          makeGroupData(2, 2),
        ];
      } else if (selectedTimeFrame == 'Year') {
        barChartData = [
          makeGroupData(0, 3),
          makeGroupData(1, 4),
          makeGroupData(2, 2),
        ];
      }
    }
    return barChartData;
  }

  // This generates the labels for the X-axis depending on Day, Week, or Month
  List<String> _getXLabels() {
    if (selectedTimeFrame == 'Week') {
      return ['Tuesday', 'Wednesday', 'Thursday', 'Friday'];
    } else if (selectedTimeFrame == 'Month') {
      return ['Week 1', 'Week 2', 'Week 3', 'Week 4'];
    } else {
      return ['August', 'September', 'October', 'November'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown to select Pain or Habit
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: selectedDataType,
                  items: dataTypes.map((String dataType) {
                    return DropdownMenuItem<String>(
                      value: dataType,
                      child: Text(dataType),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedDataType = newValue!;
                    });
                  },
                ),
                // Dropdown to select Timeframe (Day, Week, Month)
                DropdownButton<String>(
                  value: selectedTimeFrame,
                  items: timeFrames.map((String timeFrame) {
                    return DropdownMenuItem<String>(
                      value: timeFrame,
                      child: Text(timeFrame),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedTimeFrame = newValue!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              selectedDataType == 'Pain' ? 'Pain Level' : 'Habit Frequency',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups: _getBarChartData(),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          return Text(
                            value.toInt().toString(),
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          const style = TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          );
                          List<String> xLabels = _getXLabels();
                          return Text(xLabels[value.toInt()], style: style);
                        },
                      ),
                    ),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: false),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          '${rod.toY}',
                          const TextStyle(
                            color: Colors.purpleAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
