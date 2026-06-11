import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_bloc/controllers/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    print('build method called');
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              const Text('You have pushed the button this many times:'),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  print('builder method called');
                  return Text(
                    '${state.counterValue}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  print('increment button pressed');
                  context.read<CounterCubit>().incrementCounter();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () {
                  print('decrement button pressed');
                  context.read<CounterCubit>().decrementCounter();
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
