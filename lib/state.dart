abstract class CounterState{}
class Initial extends CounterState{}
class Increment extends CounterState{
  final int count;

  Increment(this.count);
}
class Decrement extends CounterState{
 final int count;

 Decrement(this.count);
}
class Error extends CounterState{
  final String error;

  Error(this.error);
}
class Remove extends CounterState{
 final int count;

  Remove(this.count);
}
