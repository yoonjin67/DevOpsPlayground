#!/bin/bash
helm repo add cowboysysop https://cowboysysop.github.io/charts/
kubectl create ns kroki
helm install my-kroki cowboysysop/kroki -n kroki
