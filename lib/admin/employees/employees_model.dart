import '/flutter_flow/flutter_flow_util.dart';
import '/pages/drawer_1/drawer1_widget.dart';
import 'employees_widget.dart' show EmployeesWidget;
import 'package:flutter/material.dart';

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
