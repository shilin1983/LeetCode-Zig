#!/bin/bash

echo "测试开始..."

for file in src/solutions/**/*_test.zig; do
    zig test "$file"
done

echo "测试结束！"
