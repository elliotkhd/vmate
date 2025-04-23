import 'package:flutter/material.dart';
import 'package:vmate/src/view_model.dart';
import 'package:vmate/src/vm_state.dart';

abstract class VmateWidget<VM extends ViewModel> extends StatefulWidget {
  const VmateWidget({super.key});

  VM createViewModel();

  Widget build(BuildContext context, VM vm);

  @override
  State<VmateWidget> createState() => _VmateWidgetState<VM>();
}

class _VmateWidgetState<VM extends ViewModel>
    extends VMState<VmateWidget<VM>, VM> {
  @override
  Widget build(BuildContext context) => widget.build(context, vm);

  @override
  VM createViewModel() => widget.createViewModel();
}
