#!/bin/bash

LENGTH=${1:-20}

ALPHABET="abcdefghijklmnopqrstuvwxyz"
ALPH_LEN=26

SEQUENCE=""
for ((i=0; i<LENGTH; i++)); do
    RAND_IDX=$((RANDOM % ALPH_LEN))
    CHAR="${ALPHABET:$RAND_IDX:1}"
    SEQUENCE="${SEQUENCE}${CHAR}"
done

echo "Случайная последовательность (длина $LENGTH):"
echo "$SEQUENCE"

echo -e "\nС пробелами:"
echo "$SEQUENCE" | sed 's/\(.\)/\1 /g'
