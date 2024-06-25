#!/bin/sh

# Ensure NTFY_TOPICS is set
if [ -z "$NTFY_TOPICS" ]; then
  echo "The NTFY_TOPICS environment variable is not set."
  exit 1
fi

# Split the NTFY_TOPICS by commas and loop through each value
OLD_IFS="$IFS"
IFS=','
set -- $NTFY_TOPICS
IFS="$OLD_IFS"

for TOPIC in "$@"; do
  # Trim any leading or trailing whitespace from the topic
  TOPIC=`echo "$TOPIC" | sed 's/^ *//; s/ *$//'`

  # Subscribe to each topic and run in the background
  ntfy sub "$TOPIC" line-notify.sh &

  echo "Subscribed to topic: $TOPIC"
done

# Wait for any process to exit
wait -n

# Exit with status of process that exited first
exit $?
