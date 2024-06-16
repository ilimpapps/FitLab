import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'app_bar_model.dart';
export 'app_bar_model.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({
    super.key,
    this.title,
    this.iconLeft,
    this.iconLeftAction,
    this.iconRight,
    this.iconRightAction,
    bool? leftEnable,
    bool? rightEnable,
  })  : leftEnable = leftEnable ?? false,
        rightEnable = rightEnable ?? false;

  final String? title;
  final Widget? iconLeft;
  final Future Function()? iconLeftAction;
  final Widget? iconRight;
  final Future Function()? iconRightAction;
  final bool leftEnable;
  final bool rightEnable;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  late AppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (widget.leftEnable) {
                await widget.iconLeftAction?.call();
              } else {
                return;
              }
            },
            child: Container(
              width: 56.0,
              height: 56.0,
              decoration: BoxDecoration(
                color: widget.leftEnable
                    ? FlutterFlowTheme.of(context).accent2
                    : const Color(0x001D1C1F),
                shape: BoxShape.circle,
              ),
              child: Visibility(
                visible: widget.leftEnable,
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: widget.iconLeft!,
                ),
              ),
            ),
          ),
          if (widget.title != null && widget.title != '')
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.title,
                    'null',
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'NTSomic',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (widget.rightEnable) {
                await widget.iconRightAction?.call();
              } else {
                return;
              }
            },
            child: Container(
              width: 56.0,
              height: 56.0,
              decoration: BoxDecoration(
                color: widget.rightEnable
                    ? FlutterFlowTheme.of(context).accent2
                    : const Color(0x001D1C1F),
                shape: BoxShape.circle,
              ),
              child: Visibility(
                visible: widget.rightEnable,
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: widget.iconRight!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
