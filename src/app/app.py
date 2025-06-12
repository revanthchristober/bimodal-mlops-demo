from flask import Flask, request, jsonify

# Initialize the Flask application
app = Flask(__name__)

@app.route('/predict', methods=['POST'])
def predict():
    """
    A dummy prediction endpoint. In a real application, this is where the trained
    ML model would be loaded to perform inference on incoming data.
    
    We return a static response here to demonstrate the API structure.
    """
    return jsonify({'prediction_score': 0.85, 'model_version': '1.0.2'}), 200

@app.route('/health', methods=['GET'])
def health():
    """
    A simple health check endpoint. This is a crucial best practice for services
    running in Kubernetes, which uses this endpoint for liveness and readiness probes
    to know if the application is running correctly.
    """
    return jsonify({'status': 'ok'}), 200

# This block allows the script to be run directly.
# The host '0.0.0.0' makes the server accessible from outside the container.
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)