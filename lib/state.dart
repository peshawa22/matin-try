abstract class CounterState{}
class Initial extends CounterState{}
class Increment extends CounterState{
  final int count;

  Increment(this.count);
}
class Error extends CounterState{
  final String error;

  Error(this.error);
}
