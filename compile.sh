#!/bin/bash
coffee --output . --compile ./src &&
coffee --output ./spec/javascripts --compile ./spec/javascripts/src &&
coffee --output ./spec/javascripts/helpers --compile ./spec/javascripts/helpers
exit