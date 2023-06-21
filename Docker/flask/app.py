# Import the Flask module
from flask import Flask

# Import the os module to access environment variables
import os

# Import the socket module to get the hostname
import socket

# Create a Flask application instance
app = Flask(__name__)

# Define a route for the root URL "/"
@app.route("/")
def hello():
    # Define an HTML string with placeholders for name and hostname
    html = "<h3>Hello {name}!</h3> <b>Hostname:</b> {hostname}<br/>"
    
    # Use os.getenv to get the value of the "NAME" environment variable, or use "world" as a default value
    name = os.getenv("NAME", "world")
    
    # Get the hostname using the socket module
    hostname = socket.gethostname()
    
    # Replace the placeholders in the HTML string with actual values
    return html.format(name=name, hostname=hostname)

# Run the Flask application if the script is executed directly (not imported as a module)
if __name__ == "__main__":
    # Set the host to '0.0.0.0' to make the app accessible externally, and use port 4000
    app.run(host='0.0.0.0', port=4000)
