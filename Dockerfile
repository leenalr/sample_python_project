FROM python:3.9-alpine
WORKDIR /app
COPY . /app
Run apt-get install httpd24
RUN apt-get update -y \
    && apt install python3 -y \
    && apt install python3-pip -y \
    && apt install python3-venv -y \
    && python3 -m venv venv
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python","app.py"]
