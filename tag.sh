#!/bin/bash
sed -e 's/latest/'${1}'/g' deployment.yaml > ks_deployment.yaml