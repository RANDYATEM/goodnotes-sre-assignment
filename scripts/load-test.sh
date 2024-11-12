#!/bin/bash

# Generate traffic for foo.localhost and bar.localhost
echo "Starting load test for foo.localhost..."
hey -z 30s -c 10 http://foo.localhost > load-test-result.txt

echo "Starting load test for bar.localhost..."
hey -z 30s -c 10 http://bar.localhost >> load-test-result.txt
