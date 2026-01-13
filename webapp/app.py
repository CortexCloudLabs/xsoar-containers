from flask import Flask
import os

app = Flask(__name__)

@app.get("/")
def hello():
    return f"Hello, Kubernetes! Served from: {os.uname()[1]}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)