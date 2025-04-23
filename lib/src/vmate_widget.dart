import 'package:flutter/material.dart';
import 'package:vmate/src/view_model.dart';
import 'package:vmate/src/vm_state.dart';

abstract class VMateWidget<VM extends ViewModel> extends StatefulWidget {
  const VMateWidget({super.key});

  VM createViewModel();

  Widget build(BuildContext context, VM vm);

  @override
  State<VMateWidget> createState() => _VMateWidgetState<VM>();
}

class _VMateWidgetState<VM extends ViewModel>
    extends VMState<VMateWidget<VM>, VM> {
  @override
  Widget build(BuildContext context) => widget.build(context, vm);

  @override
  VM createViewModel() => widget.createViewModel();
}
