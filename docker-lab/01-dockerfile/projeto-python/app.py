from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/', methods=['GET'])
def hello():
    return jsonify(message="Hello, World!!\n")

@app.route('/api/flask', methods=['GET'])
def versao():
    return jsonify(versao="1.0.0.0\n")

@app.route('/api/flask/teste', methods=['GET'])
def versao():
    return jsonify(versao="foi\n")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
