FROM python
WORKDIR /app
COPY . /app
RUN python -m venv venv
RUN pip install flask
EXPOSE 5000
CMD ["python","app.py"]
