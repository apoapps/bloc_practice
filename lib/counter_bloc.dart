import 'dart:async';

enum CounterAction {
  increment,
  decrement,
  reset,
}

class CounterBloc {
  late int _counter;
  //Controller of the whole flow of data
  final _stateStreamController = StreamController<int>();
  //Input Property
  StreamSink<int> get _counterSink => _stateStreamController.sink;
  //Output Property
  Stream<int> get counterStream => _stateStreamController.stream;

  //event stream controller

  final _eventStreamController = StreamController<CounterAction>();
  //Input Property
  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;
  //Output Property
  Stream<CounterAction> get _eventStream => _eventStreamController.stream;

  CounterBloc() {
    _counter = 0;
    _eventStream.listen((event) {
      if (event == CounterAction.increment) {
        _counter++;
      } else if (event == CounterAction.decrement) {
        _counter--;
      } else if (event == CounterAction.reset) {
        _counter = 0;
      }
      _counterSink.add(_counter);
    });
  }
}
