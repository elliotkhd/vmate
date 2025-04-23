# VMate
VMate is a lightweight and intuitive Flutter package that brings ViewModel lifecycle management to your widgets with minimal boilerplate. Inspired by MVVM architecture patterns, VMate separates business logic from UI code in a clean and reusable way.

### ✨ Features
- Simple ViewModel abstraction

- Lifecycle hooks: onInit, onReady, and onClose

- Access to widget parameters inside ViewModel

- Auto-managed ViewModel binding with VMateWidget

- Familiar StatefulWidget-like development with added structure

### 🛠️ Installation
Add this to your pubspec.yaml:

```yaml
dependencies:
  vmate: <latest_version>
```
Then run:
```bash
flutter pub get
```
### 🚀 Getting Started
1. Create your ViewModel
```dart
class CounterViewModel extends ViewModel<CounterPage> {
  late int count;

  @override
  void onInit() {
    super.onInit();
    count = widget.initialValue; // Accessing widget parameters here
    debugPrint('CounterViewModel initialized with value: $count');
  }

  void increment() {
    count++;
  }

  @override
  void onClose() {
    debugPrint('CounterViewModel disposed');
    super.onClose();
  }
}

```
2. Create your Widget
```dart
class CounterPage extends VmateWidget<CounterViewModel> {
  final int initialValue;

  const CounterPage({super.key, this.initialValue = 0});

  @override
  CounterViewModel createViewModel() => CounterViewModel();

  @override
  Widget build(BuildContext context, CounterViewModel vm) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(child: Text('Count: ${vm.count}')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         //replace with your own state management way
         setState(() => vm.increment());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
```


### 🔁 Lifecycle Hooks
- **onInit()** - Called during initState, safe for initializations.

- **onReady()** - Called after the first frame is rendered.

- **onClose()** - Called in dispose, good for cleanups.
 
### 📦 Architecture
- **ViewModel**: Base class with lifecycle support and access to the widget.

- **VMState**: A custom State subclass that manages the ViewModel lifecycle and binds it to the widget.

- **VmateWidget**: An abstract StatefulWidget that wires everything together using VMState.

### 🧪 Best Practices
- Keep business logic in your ViewModel.

- Avoid storing UI state in ViewModel unless explicitly necessary.
