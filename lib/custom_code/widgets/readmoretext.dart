// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:readmore/readmore.dart';

class Readmoretext extends StatefulWidget {
  const Readmoretext({
    super.key,
    this.width,
    this.height,
    this.text,
  });

  final double? width;
  final double? height;
  final String? text;

  @override
  State<Readmoretext> createState() => _ReadmoretextState();
}

class _ReadmoretextState extends State<Readmoretext> {
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      widget.text!,
      // 'The biggest persuader for buying an Adirondack chairs is their ability to deliver a heavy dose of comfort and support. The Adirondack chair was designed for comfort,',
      style: TextStyle(
          color: Color(0xff696969), fontSize: 17, fontWeight: FontWeight.w400),
      trimMode: TrimMode.Line,
      trimLines: 3,
      colorClickableText: Color(0xff5E9400),
      trimCollapsedText: 'Read more',
      trimExpandedText: 'Show less',
      lessStyle: TextStyle(
          fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xff5E9400)),
      moreStyle: TextStyle(
          fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xff5E9400)),
    );
  }
}
