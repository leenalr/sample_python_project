FROM python
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
RUN docker pull bitnami/trivy:latest
EXPOSE 5000
CMD ["python","app.py"]
