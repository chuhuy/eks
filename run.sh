#!/bin/bash
echo "🚀 Start commiting code"
# dt=`date '+%d/%m/%Y_%H:%M:%S'`
# echo $dt > /Users/viettq/work/dev/demo/eks/tutorials/logs.txt
git add .
git commit -m "update k8s & eks training content"
git push origin main
echo "✅ Completed!"