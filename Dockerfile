FROM tiangolo/uwsgi-nginx-flask:python3.10

WORKDIR /app
COPY ./app /app

# Create venv and install dependencies
RUN python3 -m venv venv \
    && ./venv/bin/pip install --upgrade pip \
    && ./venv/bin/pip install flask \
    && ./venv/bin/pip install prometheus-client

EXPOSE 8001

# Run Flask using the venv Python
CMD ["./venv/bin/python", "app.py"]
