import 'package:flutter/material.dart';

class CustomMaterialLocalizations extends DefaultMaterialLocalizations {
  @override
  List<String> get narrowWeekdays =>
      <String>["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
}
