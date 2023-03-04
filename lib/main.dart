import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return Text(
                      '${state.counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: BlocBuilder<CounterBloc, CounterState>(
            builder: (counterContext, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () =>
                        BlocProvider.of<CounterBloc>(counterContext)
                            .add(CounterIncrease()),
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: () =>
                        BlocProvider.of<CounterBloc>(counterContext)
                            .add(CounterDecrease()),
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                ],
              );
            },
          )),
    );
  }
}
