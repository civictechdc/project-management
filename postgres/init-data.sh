#!/bin/bash
set -e


pg_restore --no-owner --role=codefordc -d codefordc /home/data/data.dump