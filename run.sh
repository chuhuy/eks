#!/bin/bash

echo "Start commiting code"
git add .
git commit -m "update k8s & eks training content"
git push
echo "✅ Completed!"