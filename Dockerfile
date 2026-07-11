FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Una única línea CMD sin la variable $PORT escrita a mano
CMD ["gunicorn", "--chdir", "api", "app:app"]
