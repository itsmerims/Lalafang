import '/flutter_flow/flutter_flow_util.dart';
import 'address_selector_r_p_c_b_widget.dart' show AddressSelectorRPCBWidget;
import 'package:flutter/material.dart';

class AddressSelectorRPCBModel
    extends FlutterFlowModel<AddressSelectorRPCBWidget> {
  ///  State fields for stateful widgets in this page.

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
