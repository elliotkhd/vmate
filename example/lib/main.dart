import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:vmate/vmate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(initialValue: 10),
    );
  }
}

class HomePage extends VmateWidget<HomeViewModel> {
  const HomePage({super.key, this.initialValue = 0});
  final int initialValue;

  @override
  HomeViewModel createViewModel() => HomeViewModel();

  @override
  Widget build(context, vm) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          vm.counter.value = vm.counter.value + 1;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: Watch((context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              Text(
                '${vm.counter.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              const Text('isEven from computed: '),
              Text(
                '${vm.isEven.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 190,
                child: ListView.builder(
                  reverse: true,
                  itemCount: vm.textFromEffect.length,
                  itemBuilder: (context, index) {
                    final item = vm.textFromEffect.reversed.toList()[index];
                    return Center(child: Text(item));
                  },
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class HomeViewModel extends ViewModel<HomePage> {
  final counter = signal(0);
  late final isEven = computed(() => counter.value.isEven);
  final textFromEffect = listSignal<String>([]);

  @override
  void onInit() {
    super.onInit();
    counter.value = widget.initialValue;
    effect(() {
      textFromEffect.value = [
        ...textFromEffect.peek(),
        'Text from effect: ${counter.value}'
      ];
    });
  }
}
