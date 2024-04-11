#!/bin/sh

python3 load_tweets_batch.py --db 'postgresql://postgres:pass@localhost:12403' --inputs "$1"
