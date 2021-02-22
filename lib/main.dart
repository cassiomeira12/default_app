import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

import 'app/app_widget.dart';
import 'environment_config.dart';

void main() async {
  GlobalConfiguration().loadFromMap(kReleaseMode ? RELEASE : DEBUG);
  runApp(AppWidget());
}
