import 'package:apartment_service/models/service_request.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardData {
  static List<PieChartSectionData> data = [
    PieChartSectionData(
      title: "10",
      color: Colors.blue,
      value: 10,
    ),
    PieChartSectionData(
      title: "5",
      color: Colors.orange,
      value: 5,
    ),
    PieChartSectionData(
      title: "20",
      color: Colors.red,
      value: 20,
    ),
    PieChartSectionData(
      title: "13",
      color: Colors.green,
      value: 13,
    ),
  ];

  static List<PieChartSectionData> getSectionData(int sectionIndex) {
    //return data;
    return data
        .asMap()
        .map(
          (index, data) {
            final isTouched = index == sectionIndex;
            final double secRadius = isTouched ? 90 : 70;
            final double fontSize = isTouched ? 18 : 16;
            final value = PieChartSectionData(
                color: data.color,
                value: data.value,
                title: data.title,
                radius: secRadius,
                titleStyle: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white));
            return MapEntry(index, value);
          },
        )
        .values
        .toList();
  }
}
