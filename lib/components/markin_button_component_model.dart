import '/flutter_flow/flutter_flow_util.dart';
import 'markin_button_component_widget.dart' show MarkinButtonComponentWidget;
import 'package:flutter/material.dart';

class MarkinButtonComponentModel
    extends FlutterFlowModel<MarkinButtonComponentWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
