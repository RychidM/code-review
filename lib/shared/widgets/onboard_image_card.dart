import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import '../resources/app_dimens.dart';

class OnBoardImagesWidget extends StatelessWidget {
  OnBoardImagesWidget(
      {super.key, required this.imgString, this.isSelected = false});

  final String imgString;
  final bool isSelected;
  final GlobalKey _imageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: double.infinity,
      margin: isSelected
          ? EdgeInsets.symmetric(
              vertical: Dimensions.getDynamicHeight(AppDimens.sPadding20),
              horizontal: Dimensions.getDynamicHeight(AppDimens.sPadding10))
          : EdgeInsets.symmetric(
              vertical: Dimensions.getDynamicHeight(AppDimens.sPadding40),
              horizontal: Dimensions.getDynamicHeight(AppDimens.sPadding30)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimensions.getDynamicHeight(AppDimens.sPadding30),
        ),
      ),
      duration: const Duration(microseconds: 250),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Flow(
          delegate: ParallaxFlowDelegate(
              scrollable: Scrollable.of(context)!,
              listItemContext: context,
              backgroundImageKey: _imageKey),
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  Dimensions.getDynamicHeight(AppDimens.sPadding30),
                ),
                child: Image.asset(
                  key: _imageKey,
                  imgString,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxHeight,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.topCenter(Offset.zero),
        ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dx / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final horizontalAlignment = Alignment(scrollFraction * 2 - 1, 0.0);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect = horizontalAlignment.inscribe(
        backgroundSize, Offset.zero & listItemSize);

    // Paint the background.
    context.paintChild(
      0,
      transform:
          Transform.translate(offset: Offset(childRect.left, 0.0)).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
