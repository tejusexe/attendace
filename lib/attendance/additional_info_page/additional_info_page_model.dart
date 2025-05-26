import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'additional_info_page_widget.dart' show AdditionalInfoPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdditionalInfoPageModel
    extends FlutterFlowModel<AdditionalInfoPageWidget> {
  ///  Local state fields for this page.

  DateTime? selectedDate;

  bool isSelected = true;

  List<EmpAttendanceTableRow> rowForDate = [];
  void addToRowForDate(EmpAttendanceTableRow item) => rowForDate.add(item);
  void removeFromRowForDate(EmpAttendanceTableRow item) =>
      rowForDate.remove(item);
  void removeAtIndexFromRowForDate(int index) => rowForDate.removeAt(index);
  void insertAtIndexInRowForDate(int index, EmpAttendanceTableRow item) =>
      rowForDate.insert(index, item);
  void updateRowForDateAtIndex(
          int index, Function(EmpAttendanceTableRow) updateFn) =>
      rowForDate[index] = updateFn(rowForDate[index]);

  DebugVariableStruct? debugDate;
  void updateDebugDateStruct(Function(DebugVariableStruct) updateFn) {
    updateFn(debugDate ??= DebugVariableStruct());
  }

  double? presentDyas = 0.0;

  List<DateTime> workingDays = [];
  void addToWorkingDays(DateTime item) => workingDays.add(item);
  void removeFromWorkingDays(DateTime item) => workingDays.remove(item);
  void removeAtIndexFromWorkingDays(int index) => workingDays.removeAt(index);
  void insertAtIndexInWorkingDays(int index, DateTime item) =>
      workingDays.insert(index, item);
  void updateWorkingDaysAtIndex(int index, Function(DateTime) updateFn) =>
      workingDays[index] = updateFn(workingDays[index]);

  double? leaveDays;

  double? absentDyas;

  List<DateTime> leavedates = [];
  void addToLeavedates(DateTime item) => leavedates.add(item);
  void removeFromLeavedates(DateTime item) => leavedates.remove(item);
  void removeAtIndexFromLeavedates(int index) => leavedates.removeAt(index);
  void insertAtIndexInLeavedates(int index, DateTime item) =>
      leavedates.insert(index, item);
  void updateLeavedatesAtIndex(int index, Function(DateTime) updateFn) =>
      leavedates[index] = updateFn(leavedates[index]);

  List<DateTime> absentDtaes = [];
  void addToAbsentDtaes(DateTime item) => absentDtaes.add(item);
  void removeFromAbsentDtaes(DateTime item) => absentDtaes.remove(item);
  void removeAtIndexFromAbsentDtaes(int index) => absentDtaes.removeAt(index);
  void insertAtIndexInAbsentDtaes(int index, DateTime item) =>
      absentDtaes.insert(index, item);
  void updateAbsentDtaesAtIndex(int index, Function(DateTime) updateFn) =>
      absentDtaes[index] = updateFn(absentDtaes[index]);

  ///  State fields for stateful widgets in this page.

  Stream<List<EmpAttendanceTableRow>>? additionalInfoPageSupabaseStream;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {}
}
