#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <command_name>"
    exit 1
fi

COMMAND="$1"
MAN_DIR="/usr/share/man/man1"
MAN_FILE="$MAN_DIR/$COMMAND.1.gz"

if [ -f "$MAN_FILE" ]; then
    echo " Справка по команде $COMMAND "
    zless "$MAN_FILE"
elif [ -f "$MAN_FILE.gz" ]; then
    zless "$MAN_FILE.gz"
elif [ -f "$MAN_DIR/$COMMAND.1.bz2" ]; then
    bzless "$MAN_DIR/$COMMAND.1.bz2"
else
    echo "Ошибка: Справка для команды '$COMMAND' не найдена."
    echo "Поиск в $MAN_DIR"
    ls -la "$MAN_DIR" | grep -i "$COMMAND"
    exit 1
fi
