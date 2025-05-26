import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'employee_list_page_model.dart';
export 'employee_list_page_model.dart';

class EmployeeListPageWidget extends StatefulWidget {
  const EmployeeListPageWidget({super.key});

  @override
  State<EmployeeListPageWidget> createState() => _EmployeeListPageWidgetState();
}

class _EmployeeListPageWidgetState extends State<EmployeeListPageWidget> {
  late EmployeeListPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmployeeListPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
