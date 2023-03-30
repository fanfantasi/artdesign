import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ImagesView extends StatefulWidget {
  const ImagesView({Key? key, required this.images, required this.title})
      : super(key: key);
  final List<String> images;
  final String title;
  @override
  State<ImagesView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImagesView>
    with SingleTickerProviderStateMixin {
  String path = '';
  ExtendedPageController get pageController => _pageController;
  bool loadtext = false;
  String desc = '';

  late final ExtendedPageController _pageController = ExtendedPageController(
    initialPage: currentIndex,
  );
  late AnimationController _doubleTapAnimationController;
  late Animation<double> _doubleTapCurveAnimation;
  Animation<double>? _doubleTapAnimation;
  late VoidCallback _doubleTapListener;

  final _pageStreamController = StreamController<int>.broadcast();
  final _showAppBar = ValueNotifier<bool>(true);
  late int _currentIndex;
  int get currentIndex => _currentIndex;
  int get total => widget.images.length;

  set currentIndex(int value) {
    if (_currentIndex == value) {
      return;
    }
    _currentIndex = value;
  }

  @override
  void initState() {
    path = Get.arguments;
    _doubleTapAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _doubleTapCurveAnimation = CurvedAnimation(
      parent: _doubleTapAnimationController,
      curve: Curves.easeInOut,
    );
    _currentIndex = widget.images.indexWhere((element) => element == path);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    _doubleTapAnimationController
      ..stop()
      ..reset()
      ..dispose();
    _showAppBar.dispose();
    _pageStreamController.close();
    super.dispose();
  }

  void updateAnimation(ExtendedImageGestureState? state) {
    final double? begin = state?.gestureDetails?.totalScale;
    final double end = state?.gestureDetails?.totalScale == 1.0 ? 3.0 : 1.0;
    final Offset? pointerDownPosition = state?.pointerDownPosition;

    _doubleTapAnimation?.removeListener(_doubleTapListener);
    _doubleTapAnimationController
      ..stop()
      ..reset();
    _doubleTapListener = () {
      state?.handleDoubleTap(
        scale: _doubleTapAnimation!.value,
        doubleTapPosition: pointerDownPosition,
      );
    };
    _doubleTapAnimation = Tween<double>(
      begin: begin,
      end: end,
    ).animate(_doubleTapCurveAnimation)
      ..addListener(_doubleTapListener);

    _doubleTapAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.black12,
          statusBarIconBrightness: Brightness.light,
        ),
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: Stack(
            children: [
              Positioned.fill(
                child: ExtendedImageGesturePageView.builder(
                  canScrollPage: (val) {
                    return val?.totalScale == 1.0 || val?.totalScale == null;
                  },
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: pageController,
                  itemCount: total,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: RepaintBoundary(
                        child: ExtendedImage(
                          image: NetworkImage(widget.images[index]),
                          fit: BoxFit.contain,
                          mode: ExtendedImageMode.gesture,
                          initGestureConfigHandler: (ExtendedImageState state) {
                            return GestureConfig(
                              initialScale: 1.0,
                              minScale: 1.0,
                              maxScale: 3.0,
                              animationMinScale: 0.6,
                              animationMaxScale: 4.0,
                              cacheGesture: false,
                              inPageView: true,
                            );
                          },
                          onDoubleTap: updateAnimation,
                          loadStateChanged: (ExtendedImageState state) {
                            Widget loader = const SizedBox.shrink();
                            switch (state.extendedImageLoadState) {
                              case LoadState.loading:
                                loader =
                                    const ColoredBox(color: Color(0x10ffffff));
                                break;
                              case LoadState.completed:
                                loader = RepaintBoundary(
                                  child: Hero(
                                      tag: widget.images[index],
                                      child: state.completedWidget),
                                );
                                break;
                              case LoadState.failed:
                                loader = failedItemBuilder(context);
                                break;
                            }
                            return loader;
                          },
                        ),
                      ),
                    );
                  },
                  onPageChanged: (int index) {
                    currentIndex = index;
                    _pageStreamController.add(index);
                    _showAppBar.value = true;
                  },
                ),
              ),
              appBar(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _showAppBar,
      builder: (_, bool value, Widget? child) {
        return AnimatedPositioned(
          duration: kThemeAnimationDuration,
          curve: Curves.easeInOut,
          top: value ? 0.0 : -(kToolbarHeight),
          left: 0.0,
          right: 0.0,
          height: kToolbarHeight,
          child: child!,
        );
      },
      child: Container(
        color: Colors.black.withOpacity(.7),
        padding: const EdgeInsets.only(
          right: 12.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CloseButton(color: Colors.white),
            StreamBuilder<int>(
              initialData: currentIndex,
              stream: _pageStreamController.stream,
              builder: (_, AsyncSnapshot<int> snapshot) {
                return SizedBox(
                  height: kToolbarHeight,
                  width: Get.width - 62,
                  child: Center(
                    child: AutoSizeText(
                      widget.title,
                      maxLines: 2,
                      maxFontSize: 18,
                      minFontSize: 14,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget failedItemBuilder(BuildContext context) {
    return const Center(
      child: Text(
        'Not load image',
        textAlign: TextAlign.center,
      ),
    );
  }
}
