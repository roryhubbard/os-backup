#!/bin/bash

build/_deps/ext_serf_dep-src/serf agent -node agent0 -bind 0.0.0.0:8001 -rpc-addr 127.0.0.1:7501
