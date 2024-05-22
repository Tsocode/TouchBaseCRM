from flask import Flask, request, jsonify
from pymongo import MongoClient
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

# MongoDB setup
client = MongoClient("mongodb://localhost:27017/")
db = client['connections_db']
collection = db['connections']

@app.route('/add_connection', methods=['POST'])
def add_connection():
    data = request.get_json()
    collection.insert_one(data)
    return jsonify({'message': 'Connection added successfully!'}), 201

@app.route('/get_connections', methods=['GET'])
def get_connections():
    connections = list(collection.find({}, {'_id': 0}))
    return jsonify(connections), 200

if __name__ == "__main__":
    app.run(debug=True)
