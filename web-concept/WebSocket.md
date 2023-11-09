
https://javascript.info/websocket

WebSocket
> The WebSocket protocol, described in the specification RFC 6455, provides a way to exchange data between browser and server via a persistent connection. The data can be passed in both directions as “packets”, without breaking the connection and the need of additional HTTP-requests.
> Always prefer wss://

Example
- let socket = new WebSocket("ws://javascript.info");
- let socket = new WebSocket("wss://javascript.info/article/websocket/demo/hello");

Once the socket is created, we should listen to events on it. There are totally 4 events:
- open – connection established,
- message – data received,
- error – websocket error,
- close – connection closed.
And if we’d like to send something, then socket.send(data) will do that.