#!/bin/sh

python3 load_tweets.py --db 'postgresql://postgres:pass@localhost:12402' --inputs "$1"

