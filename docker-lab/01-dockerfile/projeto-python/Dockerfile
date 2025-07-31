FROM python:3.11-alpine

WORKDIR /app

COPY . .

RUN  pip install --no-cache-dir flask

EXPOSE 5000

CMD ["python3", "app.py"]