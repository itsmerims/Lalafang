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

import 'package:flutter_slidable/flutter_slidable.dart';

class Swipablewidget extends StatefulWidget {
  const Swipablewidget({
    super.key,
    this.width,
    this.height,
    this.action,
    required this.data,
    this.ontapcontainer,
  });

  final double? width;
  final double? height;
  final Future Function()? action;
  final CategformodelStruct data;
  final Future Function()? ontapcontainer;

  @override
  State<Swipablewidget> createState() => _SwipablewidgetState();
}

class _SwipablewidgetState extends State<Swipablewidget> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 16.0,
        right: 16.0,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.15,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(16),
              onPressed: (context) async {
                setState(() async {
                  await widget.action?.call();
                });
              },
              //   setState(() {
              //     // FFAppState().update(() {
              //     //   FFAppState().removeAtIndexFromSwiplist(index);
              //   //   });
              //   });
              //   // await widget.action?.call();
              // },
              backgroundColor: Colors.red,
              icon: Icons.delete,
              padding: EdgeInsets.zero,
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            setState(() async {
              await widget.ontapcontainer?.call();
            });
          },
          child: Container(
            padding: EdgeInsets.only(right: 20, left: 20),
            height: 89,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    widget.data.image,
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.name,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        widget.data.price,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (count > 0) count--;
                        },
                        child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Color(0xffF8F8F8),
                            child: Icon(
                              color: Colors.black,
                              Icons.remove,
                              size: 15,
                            ))),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        '$count',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          count++;
                        },
                        child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Color(0xffF8F8F8),
                            child: Icon(
                              color: Colors.black,
                              Icons.add,
                              size: 15,
                            ))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
