#!/bin/bash

echo "Starting load test for foo.localhost..."
hey -z 30s -c 10 http://localhost:8080 > load-test-result.txt

echo "Starting load test for bar.localhost..."
hey -z 30s -c 10 http://localhost:8081 >> load-test-result.txt
