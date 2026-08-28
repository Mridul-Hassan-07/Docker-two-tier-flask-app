from python:3.12-slim

workdir /app 

copy requirements.txt .

run apt-get update && apt-get install -y \
	pkg-config \
	default-libmysqlclient-dev \
	build-essential \
	&& rm -rf /var/lib/apt/lists/*

run pip install -r requirements.txt

copy . .

expose 5000

cmd ["python", "app.py"]
