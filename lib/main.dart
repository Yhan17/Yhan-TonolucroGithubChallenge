import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app_widget.dart';
import 'core/app/locator.dart';

void main() {
  setupLocator();
  runApp(const ProviderScope(child: AppWidget()));
}
