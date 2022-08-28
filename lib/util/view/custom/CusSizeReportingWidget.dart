import 'package:flutter/material.dart';
class CusSizeReportingWidget extends StatefulWidget {
  final Widget child;
  final ValueChanged<Size> onSizeChange;

  const CusSizeReportingWidget({
    Key? key,
    required this.child,
    required this.onSizeChange,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CusSizeReportingWidget createState() => _CusSizeReportingWidget();
}

class _CusSizeReportingWidget extends State<CusSizeReportingWidget> {
  late Size _oldSize;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());
    return widget.child;
  }

  void _notifySize() {
    if (!mounted) {
      return;
    }
    final size = context?.size;
    if (_oldSize != size) {
      _oldSize = size!;
      widget.onSizeChange(size);
    }
  }
}