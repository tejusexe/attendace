import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'mymark_attendancepage_widget.dart' show MymarkAttendancepageWidget;
import 'package:flutter/material.dart';

class MymarkAttendancepageModel
    extends FlutterFlowModel<MymarkAttendancepageWidget> {
  ///  Local state fields for this page.

  bool isworkStatusFilled = true;

  ///  State fields for stateful widgets in this page.

  Stream<List<EmpAttendanceTableRow>>? mymarkAttendancepageSupabaseStream;
  InstantTimer? instantTimer;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
