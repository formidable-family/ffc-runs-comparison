#!/bin/bash

# OLD PREDICTIONS: 1 vs 2
diff -qr -x '*.zip' -x '*.R' ffc-test-run-1/ffc-humans-in-the-loop/output/predictions ffc-test-run-2/ffc-humans-in-the-loop/output/predictions

# NEW PREDICTIONS: 3 vs 4
diff -qr -x '*.zip' -x '*.R' ffc-test-run-3/ffc-humans-in-the-loop/output/predictions ffc-test-run-4/ffc-humans-in-the-loop/output/predictions

# OLD VS NEW PREDICTIONS: 1 vs 4
diff -qr -x '*.zip' -x '*.R' ffc-test-run-1/ffc-humans-in-the-loop/output/predictions ffc-test-run-4/ffc-humans-in-the-loop/output/predictions

# NUMBER OF DIFFERING PREDICTIONS IN EACH CASE
echo "NUMBER OF DIFFERING PREDICTIONS:"

echo "OLD PREDICTIONS: 1 vs 2"
diff -qr -x '*.zip' -x '*.R' ffc-test-run-1/ffc-humans-in-the-loop/output/predictions ffc-test-run-2/ffc-humans-in-the-loop/output/predictions | wc -l

echo "NEW PREDICTIONS: 3 vs 4"
diff -qr -x '*.zip' -x '*.R' ffc-test-run-3/ffc-humans-in-the-loop/output/predictions ffc-test-run-4/ffc-humans-in-the-loop/output/predictions | wc -l

echo "OLD VS NEW: 1 vs 4"
diff -qr -x '*.zip' -x '*.R' ffc-test-run-1/ffc-humans-in-the-loop/output/predictions ffc-test-run-4/ffc-humans-in-the-loop/output/predictions | wc -l
