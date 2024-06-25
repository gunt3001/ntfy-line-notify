# ntfy-line-notify

Forward ntfy push notifications to LINE Notify service using tokens.

## How to use

1. Create a LINE Notify service and get a token from [LINE Notify](https://notify-bot.line.me/my/).
2. Run the Docker image

```bash
docker run \
    -e LINE_NOTIFY_TOKEN='Your token here' \
    -e NTFY_TOPICS='comma-separated ntfy topics' \
    ghcr.io/gunt3001/ntfy-line-notify
```

Configuration are done via the following **environment variables**:

- `LINE_NOTIFY_TOKEN`: LINE Notify token
- `NTFY_TOPICS`: comma-separated ntfy topics to forward to LINE Notify. If you are using the self-hosted version, please enter the full URL to the topic i.e. `http(s)://your-ntfy-server.com/topic`.
