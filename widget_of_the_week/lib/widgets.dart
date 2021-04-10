import 'package:flutter/widgets.dart';
import 'package:widget_of_the_week/widgets/01_safe_area.dart';
import 'package:widget_of_the_week/widgets/23_transform.dart';
import 'package:widget_of_the_week/widgets/38_aspect_ratio.dart';
import 'package:widget_of_the_week/widgets/39_limited_box.dart';
import 'package:widget_of_the_week/widgets/94_physical_model.dart';
import 'package:widget_of_the_week/widgets/97_rotated_box.dart';

Map<String, Widget Function(BuildContext)> get widgets => {
  '01 SafeArea': (_) => SafeAreaStudy(),
  '23 Transform': (_) => TransformStudy(),
  '38 AspectRatio': (_) => AspectRatioStudy(),
  '39 LimitedBox': (_) => LimitedBoxStudy(),
  '94 PhysicalModel': (_) => PhysicalModelStudy(),
  '97 RotatedBox': (_) => RotatedBoxStudy(),
};