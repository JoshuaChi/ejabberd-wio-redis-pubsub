#!/bin/bash

if [ ! -f "rebar" ]; then
  cd deps/rebar
  ./bootstrap
  mv rebar ../../
  cd ../../
fi
./rebar clean && ./rebar compile

