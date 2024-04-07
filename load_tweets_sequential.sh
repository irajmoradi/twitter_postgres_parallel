#!/bin/bash

files=$(find data/*)
DATABASE_URL="postgresql://postgres:pass@localhost:12402"

echo '================================================================================'
echo 'load denormalized'
echo '================================================================================'
time for file in $files; do
    unzip -p "$file" | sed 's/\\u0000//g' | psql postgresql://postgres:pass@localhost:12401 -c "COPY tweets_jsonb (data) FROM STDIN csv quote e'\x01' delimiter e'\x02';"    # copy your solution to the twitter_postgres assignment here
done

echo '================================================================================'
echo 'load pg_normalized'
echo '================================================================================'
time for file in $files; do
    python3 load_tweets.py --db $DATABASE_URL --inputs "$file"
    
# copy your solution to the twitter_postgres assignment here
done

echo '================================================================================'
echo 'load pg_normalized_batch'
echo '================================================================================'
time for file in $files; do
    python3 -u load_tweets_batch.py --db=postgresql://postgres:pass@localhost:12403/ --inputs $file
done
