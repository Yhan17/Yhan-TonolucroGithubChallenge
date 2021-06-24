import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app/app_widget.dart';
import 'core/app/locator.dart';

void main() {
  initializeDateFormatting('pt_Br');
  setupLocator();
  runApp(const ProviderScope(child: AppWidget()));
}
