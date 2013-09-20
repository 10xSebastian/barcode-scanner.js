#!/bin/bash
coffee --output . --compile ./src &&
coffee --output ./spec --compile ./spec/src &&
coffee --output ./spec/helpers --compile ./spec/helpers
exit