#!/bin/bash

##########
# Config #
##########
testTimes=30 # Quantas vezes testar?
testTimeout=3 # Resposta em até quantos segundos?
testSleep=0.1 # Quanto tempo esperar entre cada tentativa?
testURL="http://app-test.lowbit.com.br" # Qual URL será testada?

echo "Ultimate Performance Test !!!"
echo "  (hint: Don't use it for real ^^)"
echo
echo "Test Parameters:"
echo "  Number of tests:    ${testTimes} test(s)"
echo "  Maximum timeout:    ${testTimeout} second(s)"
echo "  Time between tests: ${testSleep} second(s)"
echo "  URL to be tested:   ${testURL}"
echo
echo "Starting tests..."

for testRun in $(seq 1 1 ${testTimes})
do
  echo -n "  -> Attempt ${testRun} of ${testTimes}: "
  timeout ${testTimeout} curl -s ${testURL} > /dev/null 2>&1
  curlRC=$?

  if [[ $curlRC -eq 0 ]]; then
    echo "OK"
  else
    echo "ERROR!"
    exit 1
  fi

  sleep ${testSleep}
done

