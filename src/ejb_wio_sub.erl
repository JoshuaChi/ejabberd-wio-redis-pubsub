-module(ejb_wio_sub).

-export([receiver/1, start/1]).


receiver(Sub) ->
  receive
    Msg ->
      io:format("received ~p~n", [Msg]),
      eredis_sub:ack_message(Sub),
      ?MODULE:receiver(Sub)
  end.

start(Sub) ->
  spawn_link(
    fun()-> 
      eredis_sub:controlling_process(Sub), 
      eredis_sub:psubscribe(Sub, [<<"708*">>]), 
      receiver(Sub) 
    end).
