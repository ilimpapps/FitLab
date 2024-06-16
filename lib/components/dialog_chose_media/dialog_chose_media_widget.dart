import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'dialog_chose_media_model.dart';
export 'dialog_chose_media_model.dart';

class DialogChoseMediaWidget extends StatefulWidget {
  const DialogChoseMediaWidget({
    super.key,
    required this.rlChat,
  });

  final int? rlChat;

  @override
  State<DialogChoseMediaWidget> createState() => _DialogChoseMediaWidgetState();
}

class _DialogChoseMediaWidgetState extends State<DialogChoseMediaWidget> {
  late DialogChoseMediaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DialogChoseMediaModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 160.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  final selectedMedia = await selectMediaWithSourceBottomSheet(
                    context: context,
                    storageFolderPath: 'messages',
                    maxWidth: 400.00,
                    maxHeight: 400.00,
                    imageQuality: 95,
                    allowPhoto: true,
                  );
                  if (selectedMedia != null &&
                      selectedMedia.every(
                          (m) => validateFileFormat(m.storagePath, context))) {
                    setState(() => _model.isDataUploading1 = true);
                    var selectedUploadedFiles = <FFUploadedFile>[];

                    var downloadUrls = <String>[];
                    try {
                      showUploadMessage(
                        context,
                        'Файл заргужается',
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
                        bucketName: 'media',
                        selectedFiles: selectedMedia,
                      );
                    } finally {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      _model.isDataUploading1 = false;
                    }
                    if (selectedUploadedFiles.length == selectedMedia.length &&
                        downloadUrls.length == selectedMedia.length) {
                      setState(() {
                        _model.uploadedLocalFile1 = selectedUploadedFiles.first;
                        _model.uploadedFileUrl1 = downloadUrls.first;
                      });
                      showUploadMessage(context, 'Успешно!');
                    } else {
                      setState(() {});
                      showUploadMessage(context, 'Ошибка загрузки данных');
                      return;
                    }
                  }

                  if (_model.uploadedFileUrl1 != '') {
                    await ChatsMessagesTable().insert({
                      'rl_users': currentUserUid,
                      'rl_chats': widget.rlChat,
                      'photo': _model.uploadedFileUrl1,
                    });
                  }
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                      'Добавить фото',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'NTSomic',
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).white8,
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  final selectedMedia = await selectMediaWithSourceBottomSheet(
                    context: context,
                    storageFolderPath: 'messages',
                    allowPhoto: false,
                    allowVideo: true,
                  );
                  if (selectedMedia != null &&
                      selectedMedia.every(
                          (m) => validateFileFormat(m.storagePath, context))) {
                    setState(() => _model.isDataUploading2 = true);
                    var selectedUploadedFiles = <FFUploadedFile>[];

                    var downloadUrls = <String>[];
                    try {
                      showUploadMessage(
                        context,
                        'Файл заргужается',
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
                        bucketName: 'media',
                        selectedFiles: selectedMedia,
                      );
                    } finally {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      _model.isDataUploading2 = false;
                    }
                    if (selectedUploadedFiles.length == selectedMedia.length &&
                        downloadUrls.length == selectedMedia.length) {
                      setState(() {
                        _model.uploadedLocalFile2 = selectedUploadedFiles.first;
                        _model.uploadedFileUrl2 = downloadUrls.first;
                      });
                      showUploadMessage(context, 'Успешно!');
                    } else {
                      setState(() {});
                      showUploadMessage(context, 'Ошибка загрузки данных');
                      return;
                    }
                  }

                  if (_model.uploadedFileUrl2 != '') {
                    await ChatsMessagesTable().insert({
                      'rl_users': currentUserUid,
                      'rl_chats': widget.rlChat,
                      'video': _model.uploadedFileUrl2,
                    });
                  }
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                      'Добавить видео',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'NTSomic',
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
