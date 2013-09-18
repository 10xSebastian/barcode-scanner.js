#!/bin/bash
coffee --output . --compile ./src &&
coffee --output ./spec/javascripts --compile ./spec/javascripts/src
exit