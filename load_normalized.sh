#!/bin/sh

python3 load_tweets.py --db 'postgresql://postgres:pass@localhost:12401' --inputs "$1"

