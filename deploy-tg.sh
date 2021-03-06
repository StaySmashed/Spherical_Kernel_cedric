#!/bin/bash
source common
message="CI build completed with the latest commit -"

curl -s -X POST https://api.telegram.org/bot$BOT_API_KEY/sendMessage -d text="$message" -d chat_id=$CHAT_ID


curl -s -X POST https://api.telegram.org/bot$BOT_API_KEY/sendMessage -d text="$(git log --pretty=format:'%h : %s' -1)" -d chat_id=$CHAT_ID

curl -F chat_id=$CHAT_ID -F document=@"$PWD/$ZIP_NAME" https://api.telegram.org/bot$BOT_API_KEY/sendDocument
