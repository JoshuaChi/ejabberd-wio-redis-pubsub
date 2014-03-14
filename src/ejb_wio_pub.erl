-module(ejb_pub).

-export([pub/1]).

pub(Key) ->
  {ok, P} = eredis:start_link(),
  eredis:q(P, ["PUBLISH", Key, "hello world!"]),
  eredis_client:stop(P).
