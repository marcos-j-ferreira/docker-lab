FROM python:3.11-alpine 

WORKDIR /app

COPY . .

RUN mkdir -p data && chmod -R 777 data

#ENV PYTHONUNBUFFERED=1

CMD ["python3", "main.py"]