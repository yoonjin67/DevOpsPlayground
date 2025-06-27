#!/bin/bash
helm upgrade --install kibana elastic/kibana -n elk --create-namespace 

