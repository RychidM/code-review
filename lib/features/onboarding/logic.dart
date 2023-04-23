import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stock_savvy/utils/routing/route_constants.dart';

class OnboardingLogic extends GetxController {
  var currentIndex = 0.obs;
  late ScrollController scrollController;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    pageController = PageController(viewportFraction: 0.95);
  }

  selectedIndexUpdated(int index) {
    switch (index) {
      case 0:
        currentIndex.value = index;
        scrollToStart(scrollController);
        break;
      case 3:
        currentIndex.value = index;
        scrollToEnd(scrollController);
        break;
      default:
        currentIndex.value = index;
        break;
    }
  }

  onNextBtnClicked() {
    if (currentIndex.value <= 2) {
      currentIndex.value += 1;
      animateToIndex(currentIndex.value);
    } else {
      // scrollToEnd(scrollController);
      Get.offNamed(RouteConstants.sAuthRoute);
    }
  }

  void animateToIndex(int index) {
    animateToPage.animateToPage(index,
        duration: const Duration(milliseconds: 250), curve: Curves.linear);
  }

  PageController get animateToPage => pageController;

  scrollToEnd(ScrollController controller) {
    final double end = controller.position.maxScrollExtent;

    controller.animateTo(end,
        duration: const Duration(milliseconds: 150), curve: Curves.linear);
  }

  scrollToStart(ScrollController controller) {
    final double start = controller.position.minScrollExtent;

    controller.animateTo(start,
        duration: const Duration(milliseconds: 150), curve: Curves.linear);
  }

  @override
  void onClose() {
    scrollController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
