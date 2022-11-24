import 'package:flutter/material.dart';

class StaggeredGridView extends StatelessWidget {
  const StaggeredGridView({
    Key? key,
    required this.crossAxisCount,
    required this.childAspectRatio,
    required this.itemCount,
    required this.itemBuilder,
    this.spacing = 0.0,
    this.clipBehavior = Clip.hardEdge,
  }) : super(key: key);

  final double spacing;
  final int crossAxisCount;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double childAspectRatio;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth && constraints.hasBoundedHeight);
        final width = constraints.maxWidth;
        final childHeight = ((width / crossAxisCount) * childAspectRatio);
        final height = constraints.maxHeight + childHeight + spacing;
        final content = OverflowBox(
          alignment: Alignment.bottomLeft,
          minWidth: width,
          maxWidth: width,
          minHeight: height,
          maxHeight: height,
          child: GridView.builder(
            padding: EdgeInsets.fromLTRB(
              spacing,
              spacing + childHeight + spacing,
              spacing,
              itemCount.isEven ? childHeight + spacing * 2 : spacing,
            ),
            cacheExtent: height * 1.5,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: childAspectRatio,
              mainAxisSpacing: spacing,
              crossAxisSpacing: spacing,
            ),
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index) {
              return Transform.translate(
                offset: Offset(
                    0.0, index.isOdd ? childHeight + (spacing * 0.5) : 0.0),
                child: itemBuilder(context, index),
              );
            },
          ),
        );
        if (clipBehavior == Clip.none) {
          return content;
        } else {
          return ClipRect(
            clipBehavior: clipBehavior,
            child: content,
          );
        }
      },
    );
  }
}
