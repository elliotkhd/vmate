// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../vmate.dart';

abstract class VMState<T extends StatefulWidget, VM extends ViewModel>
    extends State<T> {
  /// [vm] instance.
  late final VM vm = createViewModel();

  /// create [vm] instance.
  ///
  /// must be override.
  VM createViewModel();

  @override
  void initState() {
    super.initState();
    vm.widget = widget;
    vm.onInit();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) vm.onReady();
    });
  }

  @override
  void dispose() {
    super.dispose();
    vm.onClose();
  }
}
