FROM python:latest
WORKDIR /app
ADD . /app
RUN pip install --trusted-host pypi.python.org Flask
ENV NAME World
CMD ["python", "app.py"]
