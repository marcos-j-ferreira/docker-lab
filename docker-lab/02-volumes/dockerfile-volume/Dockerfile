FROM python:3.11-alpine

WORKDIR /app

COPY  . .

RUN pip install --no-cache-dir flask

#VOLUME ["/app/data"]

EXPOSE  5000

CMD ["python3", "app.py"]