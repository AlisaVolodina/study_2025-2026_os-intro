#!/bin/bash

SEMAPHORE_FILE="/tmp/semaphore.lock"

t1=5   
t2=3   

random_int() {
    echo $((RANDOM % 10 + 1))
}

while true; do
    if mkdir "$SEMAPHORE_FILE" 2>/dev/null; then
        echo "[$$] Ресурс захвачен. Использую в течение $t2 сек."

        for ((i=1; i<=t2; i++)); do
            echo "[$$] Использую ресурс... $i сек."
            sleep 1
        done

        rmdir "$SEMAPHORE_FILE"
        echo "[$$] Ресурс освобождён."

        sleep $(random_int)
    else
        echo "[$$] Ресурс занят. Ожидаю освобождения в течение $t1 сек."
        
        for ((i=1; i<=t1; i++)); do
            sleep 1
            if mkdir "$SEMAPHORE_FILE" 2>/dev/null; then
                rmdir "$SEMAPHORE_FILE"
                echo "[$$] Ресурс освободился!"
                break
            fi
            echo "[$$] Ожидание... $i сек."
        done
    fi
done
