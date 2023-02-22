import 'package:flutter/material.dart';
import 'package:story_indicator/src/story_item.dart';

class StoryIndicator extends StatefulWidget {
  const StoryIndicator(
      {super.key,
      required this.itemCount,
      required this.currentIndex,
      this.highlightColor = Colors.blue,
      this.defaultColor = Colors.white,
      this.indicatorSpacing = 4,
      this.interval = const Duration(seconds: 4)});

  final int itemCount;
  final ValueNotifier<int> currentIndex;
  final Duration interval;
  final Color highlightColor;
  final Color defaultColor;
  final double indicatorSpacing;

  @override
  State<StatefulWidget> createState() => _StoryIndicatorState();
}

class _StoryIndicatorState extends State<StoryIndicator> {
  List<Widget> getListIndicator() {
    List<Widget> listWidget = [];
    for (var i = 0; i < widget.itemCount; i++) {
      listWidget.add(Expanded(
          child: StoryItem(
        interval: widget.interval,
        isSelected: i == widget.currentIndex.value,
        highlightColor: widget.highlightColor,
        defaultColor: widget.defaultColor,
        onComplete: _next,
        isFill: i < widget.currentIndex.value,
      )));
      if (i < widget.itemCount - 1) {
        listWidget.add(SizedBox(width: widget.indicatorSpacing));
      }
    }
    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.currentIndex,
        builder: (_, child) => Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: getListIndicator(),
            ));
  }

  void _next() {
    if (widget.currentIndex.value == widget.itemCount - 1) {
      widget.currentIndex.value = 0;
    } else {
      widget.currentIndex.value += 1;
    }
  }
}
