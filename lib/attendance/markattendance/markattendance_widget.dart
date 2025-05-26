import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'markattendance_model.dart';
export 'markattendance_model.dart';

class MarkattendanceWidget extends StatefulWidget {
  const MarkattendanceWidget({
    super.key,
    this.employeeDayRow,
  });

  final List<EmpAttendanceTableRow>? employeeDayRow;

  @override
  State<MarkattendanceWidget> createState() => _MarkattendanceWidgetState();
}

class _MarkattendanceWidgetState extends State<MarkattendanceWidget> {
  late MarkattendanceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MarkattendanceModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today\'s Attendance',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                      ),
                      Text(
                        'Mark your attendance with photo verification',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Current Date:',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                  ),
                  Text(
                    '09:30 AM',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                  ),
                  Text(
                    dateTimeFormat("MMMEd", FFAppState().TimeAppState),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                        ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondary,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(60.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60.0),
                          child: Image.network(
                            widget!.employeeDayRow?.firstOrNull?.markInPic !=
                                        null &&
                                    widget!.employeeDayRow?.firstOrNull
                                            ?.markInPic !=
                                        ''
                                ? widget!
                                    .employeeDayRow!.firstOrNull!.markInPic!
                                : 'https://images.unsplash.com/photo-1711580391101-4f',
                            width: 120.0,
                            height: 79.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'Punch In Photo',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.login,
                            color: Color(0xFF336A4A),
                            size: 20.0,
                          ),
                          Text(
                            widget!.employeeDayRow != null &&
                                    (widget!.employeeDayRow)!.isNotEmpty
                                ? dateTimeFormat(
                                    "jm",
                                    widget!.employeeDayRow!.firstOrNull!.markIn!
                                        .time)
                                : '--:--',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                          ),
                        ],
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                  Icon(
                    Icons.directions_run_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(60.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60.0),
                          child: Image.network(
                            widget!.employeeDayRow?.firstOrNull?.markOutPic !=
                                        null &&
                                    widget!.employeeDayRow?.firstOrNull
                                            ?.markOutPic !=
                                        ''
                                ? widget!
                                    .employeeDayRow!.firstOrNull!.markOutPic!
                                : 'https://images.unsplash.com/photo-1711580391101-4f',
                            width: 120.0,
                            height: 120.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'Punch Out Photo',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                      Text(
                        widget!.employeeDayRow != null &&
                                (widget!.employeeDayRow)!.isNotEmpty
                            ? (_model.isMarkedOut
                                ? dateTimeFormat(
                                    "jm",
                                    widget!.employeeDayRow!.firstOrNull!
                                        .markOut!.time)
                                : '--:--')
                            : '--:--',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FFButtonWidget(
                    onPressed: (widget!.employeeDayRow != null &&
                            (widget!.employeeDayRow)!.isNotEmpty)
                        ? null
                        : () async {
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              storageFolderPath: 'markin',
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              safeSetState(
                                  () => _model.isDataUploading1 = true);
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
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isDataUploading1 = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile1 =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl1 = downloadUrls.first;
                                });
                                showUploadMessage(context, 'Success!');
                              } else {
                                safeSetState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload data');
                                return;
                              }
                            }

                            if (_model.uploadedFileUrl1 != null &&
                                _model.uploadedFileUrl1 != '') {
                              await EmpAttendanceTableTable().update(
                                data: {
                                  'uinqPunchDate':
                                      '${dateTimeFormat("d/M/y", getCurrentTimestamp)}_100',
                                  'id': 100,
                                  'markIn': supaSerialize<PostgresTime>(
                                      PostgresTime(getCurrentTimestamp)),
                                  'markInPic': _model.uploadedFileUrl1,
                                  'markOut': supaSerialize<PostgresTime>(
                                      PostgresTime(getCurrentTimestamp)),
                                  'onLeave': false,
                                  'markOutPic': 'NULL',
                                  'date': supaSerialize<DateTime>(
                                      getCurrentTimestamp),
                                },
                                matchingRows: (rows) => rows,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'upload successful',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              FFAppState().markinpic = _model.uploadedFileUrl1;
                              safeSetState(() {});
                              _model.isMarkedOut = false;
                              safeSetState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Upload cancelled !',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).warning,
                                ),
                              );
                            }
                          },
                    text: 'Punch In',
                    options: FFButtonOptions(
                      width: 150.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            font: GoogleFonts.interTight(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(25.0),
                      disabledColor: Color(0x7A4B39EF),
                      disabledTextColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: (widget!.employeeDayRow != null &&
                                (widget!.employeeDayRow)!.isNotEmpty
                            ? (_model.isMarkedOut ? true : false)
                            : true)
                        ? null
                        : () async {
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              storageFolderPath: 'markout',
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              safeSetState(
                                  () => _model.isDataUploading2 = true);
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
                                  bucketName: 'markoutpics',
                                  selectedFiles: selectedMedia,
                                );
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isDataUploading2 = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile2 =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl2 = downloadUrls.first;
                                });
                                showUploadMessage(context, 'Success!');
                              } else {
                                safeSetState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload data');
                                return;
                              }
                            }

                            if (_model.uploadedFileUrl2 != null &&
                                _model.uploadedFileUrl2 != '') {
                              await EmpAttendanceTableTable().update(
                                data: {
                                  'markOut': supaSerialize<PostgresTime>(
                                      PostgresTime(getCurrentTimestamp)),
                                  'markOutPic': _model.uploadedFileUrl2,
                                },
                                matchingRows: (rows) => rows.eqOrNull(
                                  'uinqPunchDate',
                                  '${dateTimeFormat("d/M/y", getCurrentTimestamp)}_100',
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'upload successful',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              _model.isMarkedOut = true;
                              safeSetState(() {});
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Upload cancelled !',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).warning,
                                ),
                              );
                            }
                          },
                    text: 'Punch Out',
                    options: FFButtonOptions(
                      width: 150.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ].divide(SizedBox(width: 16.0)),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
