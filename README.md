# TelegraphSocket
This project is here just to present `Websocket` issue in
[Telegraph library](https://github.com/Building42/Telegraph).

Steps to reproduce:

- Server is running on port `8080`.
- Try to connect with a websocket client to: `ws://localhost:8080/`
- Server will load `output1.json` file, on `webSocketDidConnect` will try to
send `Data` to websocket using `webSocket.send(data: data)`.
- For `output1.json` connection will be closed with:
`(1002) WebSocket Protocol Error`
- For `output2.json` all data will be sent.

File `output1.json` is around `1.2`MB in size.

File `output2.json` is around `49`KB in size.
