import 'package:flutter/material.dart';

/// A [ViewModel] for managing business logic tied to a specific widget.
///
/// Subclasses should override [onInit], [onReady], and [onClose] for lifecycle.
abstract class ViewModel<T extends Widget> {
  /// The widget associated with this ViewModel.
  late T widget;
  bool _initiated = false;
  bool _closed = false;

  /// Called once when the ViewModel is initialized.
  @protected
  @mustCallSuper
  void onInit() {
    assert(_initiated == false, 'ViewModel already initiated');
    _initiated = true;
  }

  /// Called once after the first frame.
  void onReady() {}

  /// Called when the ViewModel is disposed.
  @protected
  @mustCallSuper
  void onClose() {
    assert(_closed == false, 'ViewModel already closed');
    assert(_initiated == true, 'ViewModel not initiated before close');
    _closed = true;
  }
}
