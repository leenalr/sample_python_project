FROM trivy:0.24.4 as trivy
FROM alpine:3.15
FROM python

WORKDIR /app
COPY . /app
COPY --from=trivy /usr/local/bin/trivy /usr/local/bin/trivy

RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python","app.py"]
