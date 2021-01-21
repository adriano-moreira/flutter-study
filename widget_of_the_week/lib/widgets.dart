import 'package:flutter/widgets.dart';
import 'package:widget_of_the_week/widgets/01_safe_area.dart';
import 'package:widget_of_the_week/widgets/32_aspct_ratio.dart';

Map<String, Widget Function(BuildContext)> get widgets => {
  '01 SafeArea': (_) => SafeAreaStudy(),
  '38 AspectRatio': (_) => AspectRatioStudy(),
};