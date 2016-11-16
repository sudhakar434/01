import websocket

ws = websocket.WebSocket()

ws.connect(
    "ws://0.0.0.0:8888/",
    http_proxy_port=8080
)
