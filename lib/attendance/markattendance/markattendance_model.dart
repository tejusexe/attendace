import '/flutter_flow/flutter_flow_util.dart';
import 'markattendance_widget.dart' show MarkattendanceWidget;
import 'package:flutter/material.dart';

class MarkattendanceModel extends FlutterFlowModel<MarkattendanceWidget> {
  ///  Local state fields for this component.

  bool isMarkedOut = true;

  bool isMarkedIn = true;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
