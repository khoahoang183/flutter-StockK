import 'package:flutter/material.dart';

import 'CusSizeReportingWidget.dart';
class CusExpandablePageView extends StatefulWidget {
  final List<Widget> children;

  const CusExpandablePageView({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CusExpandablePageViewState createState() => _CusExpandablePageViewState();
}

class _CusExpandablePageViewState extends State<CusExpandablePageView> with TickerProviderStateMixin {
  late PageController _pageController;
  late List<double> _heights;
  int _currentPage = 0;

  double get _currentHeight => _heights[_currentPage];

  @override
  void initState() {
    _heights = widget.children.map((e) => 100.0).toList();
    super.initState();
    _pageController = PageController() //
      ..addListener(() {
        final _newPage = _pageController.page?.round();
        if (_currentPage != _newPage) {
          setState(() => _currentPage = _newPage!);
        }
      });
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      curve: Curves.easeInOutCubic,
      duration: const Duration(milliseconds: 100),
      tween: Tween<double>(begin: _heights[0], end: _currentHeight),
      builder: (context, value, child) => SizedBox(height: value, child: child),
      child: PageView(
        controller: _pageController,
        children: _sizeReportingChildren
            .asMap() //
            .map((index, child) => MapEntry(index, child))
            .values
            .toList(),
      ),
    );
  }

  List<Widget> get _sizeReportingChildren => widget.children
      .asMap() //
      .map(
        (index, child) => MapEntry(
      index,
      OverflowBox(
        //needed, so that parent won't impose its constraints on the children, thus skewing the measurement results.
        minHeight: 0,
        maxHeight: double.infinity,
        alignment: Alignment.topCenter,
        child: CusSizeReportingWidget(
          onSizeChange: (size) => setState(() => _heights[index] = size?.height ?? 0),
          child: Align(child: child),
        ),
      ),
    ),
  )
      .values
      .toList();
}
