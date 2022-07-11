FROM python
WORKDIR /app
COPY . /app
RUN apt-get update -y \
    && apt install python-pip --y \
    && apt install python-venv -y \
    && python -m venv venv
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python","app.py"]
