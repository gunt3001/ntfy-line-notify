#!/bin/sh

# This script is responsbile for sending webhook request to LINE Notify API

# Construct the message
if [ -z "$NTFY_TITLE" ]; then
  MESSAGE="[$NTFY_TOPIC] $NTFY_MESSAGE"
else
  MESSAGE="[$NTFY_TOPIC] $NTFY_TITLE: $NTFY_MESSAGE"
fi

curl --silent --output /dev/null --show-error --fail -X POST -H "Authorization: Bearer $LINE_NOTIFY_TOKEN" -F "message=$MESSAGE" https://notify-api.line.me/api/notify

# Check the exit status of the curl command
if [ $? -ne 0 ]; then
  echo "Error: Failed to send notification ID $NTFY_ID."
  exit 1
fi

echo "Notification sent: $MESSAGE"

