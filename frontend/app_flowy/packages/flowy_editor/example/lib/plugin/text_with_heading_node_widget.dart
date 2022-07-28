import 'package:flowy_editor/flowy_editor.dart';
import 'package:flutter/material.dart';

class TextWithHeadingNodeBuilder extends NodeWidgetBuilder {
  TextWithHeadingNodeBuilder.create({
    required super.editorState,
    required super.node,
    required super.key,
  }) : super.create() {
    nodeValidator = (node) => node.attributes.containsKey('heading');
  }

  String get heading => node.attributes['heading'] as String;
  Widget buildPadding() {
    if (heading == 'h1') {
      return const Padding(
        padding: EdgeInsets.only(top: 10),
      );
    } else if (heading == 'h2') {
      return const Padding(
        padding: EdgeInsets.only(top: 5),
      );
    }
    return const Padding(
      padding: EdgeInsets.only(top: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildPadding(),
        renderPlugins.buildWidget(
          context: NodeWidgetContext(
            buildContext: context,
            node: node,
            editorState: editorState,
          ),
          withSubtype: false,
        ),
        buildPadding(),
      ],
    );
  }
}
