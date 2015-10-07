#!/bin/sh

exec 2>test_stderr.log

passed=0
failed=0

echo "Working - Test #1 - (n = 0)"
sudo sh load.sh
echo 0 > /dev/fibonacci_input
result=$(cat /dev/fibonacci_result)
if [ "$result" = "0" ]
then
  passed=$(($passed + 1))
  echo "\tPassed - Test #1 - (n = 0): $result"
else
  failed=$(($failed + 1))
  echo "\tFailed - Test #1 - (n = 0): $result"
fi
sudo sh unload.sh

echo "Working - Test #2 - (n = 2)"
sudo sh load.sh
echo 2 > /dev/fibonacci_input
result=$(cat /dev/fibonacci_result)
if [ "$result" = "1" ]
then
  passed=$(($passed + 1))
  echo "\tPassed - Test #2 - (n = 2): $result"
else
  failed=$(($failed + 1))
  echo "\tFailed - Test #2 - (n = 2): $result"
fi
sudo sh unload.sh

echo "Working - Test #3 - (n = 6)"
sudo sh load.sh
echo 6 > /dev/fibonacci_input
result=$(cat /dev/fibonacci_result)
if [ "$result" = "8" ]
then
  passed=$(($passed + 1))
  echo "\tPassed - Test #3 - (n = 6): $result"
else
  failed=$(($failed + 1))
  echo "\tFailed - Test #3 - (n = 6): $result"
fi
sudo sh unload.sh

echo "Working - Test #4 - (n = -1)"
sudo sh load.sh
echo -1 > /dev/fibonacci_input
result=$(cat /dev/fibonacci_result)
if [ "$result" = "Input number must be non-negative" ]
then
  passed=$(($passed + 1))
  echo "\tPassed - Test #4 - (n = -1): $result"
else
  failed=$(($failed + 1))
  echo "\tFailed - Test #4 - (n = -1): $result"
fi
sudo sh unload.sh

echo "Working - Test #5 - (n = 10000000)"
sudo sh load.sh
echo 10000000 > /dev/fibonacci_input
result=$(cat /dev/fibonacci_result)
if [ "$result" = "Too big input number" ]
then
  passed=$(($passed + 1))
  echo "\tPassed - Test #5 - (n = 10000000): $result"
else
  failed=$(($failed + 1))
  echo "\tFailed - Test #5 - (n = 10000000): $result"
fi
sudo sh unload.sh

echo "Working - Test #6 - (n = asd)"
sudo sh load.sh
echo asd > /dev/fibonacci_input
result=$(cat /dev/fibonacci_result)
if [ "$result" = "Input string is not the number" ]
then
  passed=$(($passed + 1))
  echo "\tPassed - Test #6 - (n = asd): $result"
else
  failed=$(($failed + 1))
  echo "\tFailed - Test #6 - (n = asd): $result"
fi
sudo sh unload.sh

echo "Working - Test #7 - (n = 111111111111111111111111111111111)"
sudo sh load.sh
echo 111111111111111111111111111111111 > /dev/fibonacci_input
result=$(cat /dev/fibonacci_result)
if [ "$result" = "Too long input string" ]
then
  passed=$(($passed + 1))
  echo "\tPassed - Test #7 - (n = 111111111111111111111111111111111): $result"
else
  failed=$(($failed + 1))
  echo "\tFailed - Test #7 - (n = 111111111111111111111111111111111): $result"
fi
sudo sh unload.sh

echo "Summary: $passed passed, $failed failed."
