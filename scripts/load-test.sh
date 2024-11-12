#!/bin/bash

# URL for foo and bar services
FOO_URL="http://foo.localhost"
BAR_URL="http://bar.localhost"

# Number of requests to send to each service
NUM_REQUESTS=1000

# Function to test the load for a specific URL
test_load() {
    local url=$1
    local service_name=$2

    echo "Starting load test for $service_name at $url..."

    # Use curl to generate requests and capture response times
    # We're using `ab` (Apache Bench) here for simplicity, but other tools like `wrk` or `hey` can be used
    ab -n $NUM_REQUESTS -c 10 $url > ${service_name}-load-test-result.txt

    echo "Load test for $service_name completed. Results stored in ${service_name}-load-test-result.txt"
}

# Perform load tests for both foo and bar services
test_load $FOO_URL "foo"
test_load $BAR_URL "bar"

# Combine the results and output them
echo "Load test results for foo and bar services:"

# Display the results for both foo and bar
cat foo-load-test-result.txt
cat bar-load-test-result.txt

# Optionally, save the results in a file to later post as a GitHub comment
echo "Posting load test results..."
echo "Foo service load test results:" > load-test-result.txt
cat foo-load-test-result.txt >> load-test-result.txt
echo "Bar service load test results:" >> load-test-result.txt
cat bar-load-test-result.txt >> load-test-result.txt
