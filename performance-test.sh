#!/bin/bash

##########
# Config #
##########
testTimes=10 # Quantas vezes testar?
testTimeout=5 # Resposta em até quantos segundos?
testSleep=1 # Quanto tempo esperar entre cada tentativa?

echo "Ultimate Performance Test !!!"
echo "  (hint: Don't use it for real ^^)"
echo
echo "Test Parameters:"
echo "  Number of tests:    ${testTimes} tests"
echo "  Maximum timeout:    ${testTimeout} seconds"
echo "  Time between tests: ${testSleep} seconds"
echo
echo "Starting tests..."

for testRun in $(seq 1 1 ${testTimes})
do
  echo -n "  -> Attempt ${testRun} of ${testTimes}: "
  timeout ${testTimeout} curl -s http://meetup-test.lowbit.com.br > /dev/null 2>&1
  curlRC=$?

  if [[ $curlRC -eq 0 ]]; then
    echo "OK"
  else
    echo "ERROR!"
    exit 1
  fi

  sleep ${testSleep}
done

