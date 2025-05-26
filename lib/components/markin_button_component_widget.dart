import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'markin_button_component_model.dart';
export 'markin_button_component_model.dart';

class MarkinButtonComponentWidget extends StatefulWidget {
  const MarkinButtonComponentWidget({super.key});

  @override
  State<MarkinButtonComponentWidget> createState() =>
      _MarkinButtonComponentWidgetState();
}

class _MarkinButtonComponentWidgetState
    extends State<MarkinButtonComponentWidget> {
  late MarkinButtonComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarkinButtonComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
      child: FFButtonWidget(
        onPressed: () async {
          final selectedMedia = await selectMediaWithSourceBottomSheet(
            context: context,
            storageFolderPath: 'markin',
            allowPhoto: true,
          );
          if (selectedMedia != null &&
              selectedMedia
                  .every((m) => validateFileFormat(m.storagePath, context))) {
            safeSetState(() => _model.isDataUploading = true);
            var selectedUploadedFiles = <FFUploadedFile>[];

            var downloadUrls = <String>[];
            try {
              showUploadMessage(
                context,
                'Uploading file...',
                showLoading: true,
              );
              selectedUploadedFiles = selectedMedia
                  .map((m) => FFUploadedFile(
                        name: m.storagePath.split('/').last,
                        bytes: m.bytes,
                        height: m.dimensions?.height,
                        width: m.dimensions?.width,
                        blurHash: m.blurHash,
                      ))
                  .toList();

              downloadUrls = await uploadSupabaseStorageFiles(
                bucketName: 'markinpics',
                selectedFiles: selectedMedia,
              );
            } finally {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              _model.isDataUploading = false;
            }
            if (selectedUploadedFiles.length == selectedMedia.length &&
                downloadUrls.length == selectedMedia.length) {
              safeSetState(() {
                _model.uploadedLocalFile = selectedUploadedFiles.first;
                _model.uploadedFileUrl = downloadUrls.first;
              });
              showUploadMessage(context, 'Success!');
            } else {
              safeSetState(() {});
              showUploadMessage(context, 'Failed to upload data');
              return;
            }
          }

          await EmpAttendanceTableTable().update(
            data: {
              'uinqPunchDate':
                  '${dateTimeFormat("d/M/y", getCurrentTimestamp)}_100',
              'id': 100,
              'markIn': supaSerialize<PostgresTime>(
                  PostgresTime(getCurrentTimestamp)),
              'markInPic': _model.uploadedFileUrl,
              'markOut': supaSerialize<PostgresTime>(
                  PostgresTime(getCurrentTimestamp)),
              'onLeave': false,
              'markOutPic': '12345',
              'date': supaSerialize<DateTime>(getCurrentTimestamp),
            },
            matchingRows: (rows) => rows,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'uploaded image successful',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
          FFAppState().markinpic = _model.uploadedFileUrl;
          safeSetState(() {});
        },
        text: 'Mark In',
        options: FFButtonOptions(
          height: 40.0,
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
          color: FlutterFlowTheme.of(context).primary,
          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                font: GoogleFonts.interTight(
                  fontWeight:
                      FlutterFlowTheme.of(context).titleSmall.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                ),
                color: Colors.white,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              ),
          elevation: 0.0,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
