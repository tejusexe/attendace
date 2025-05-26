import '/admin/employee_name/employee_name_widget.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/drawer_1/drawer1_widget.dart';
import 'dart:ui';
import 'employees_widget.dart' show EmployeesWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmployeesModel extends FlutterFlowModel<EmployeesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for drawer_1 component.
  late Drawer1Model drawer1Model;

  @override
  void initState(BuildContext context) {
    drawer1Model = createModel(context, () => Drawer1Model());
  }

  @override
  void dispose() {
    drawer1Model.dispose();
  }
}
