#!/bin/bash

echo "Start commiting code"
git add /Users/viettq/work/dev/demo/eks/tutorials/.
git commit -m "update k8s & eks training content"
git push
echo "✅ Completed!"