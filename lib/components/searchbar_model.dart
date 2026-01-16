import '/flutter_flow/flutter_flow_util.dart';
import 'searchbar_widget.dart' show SearchbarWidget;
import 'package:flutter/material.dart';

class SearchbarModel extends FlutterFlowModel<SearchbarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
