FROM python
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
EXPOSE 5000


FROM build AS vulnscan
COPY --from=aquasec/trivy:latest /usr/local/bin/trivy /usr/local/bin/trivy 
RUN trivy rootfs --no-progress/

CMD ["python","app.py"]
