# Use the latest Python base image
FROM python:latest

# Set the working directory inside the container to /app
WORKDIR /app

# Add the contents of the current directory to the /app directory in the container
ADD . /app

# Install Flask package from PyPI (Python Package Index)
RUN pip install --trusted-host pypi.python.org Flask

# Set an environment variable named NAME with the value "World"
ENV NAME World

# Specify the command to be run when the container starts
CMD ["python", "app.py"]
