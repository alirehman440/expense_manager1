
import 'package:intl/intl.dart';

extension DateUtils on DateTime{
  String get formattedDate => DateFormat("yyyy-MM-dd").format(this);
}