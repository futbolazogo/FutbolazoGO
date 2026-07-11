FROM python:3.11-slim

WORKDIR /app

# Copiar e instalar dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto del código del proyecto
COPY . .

# Comando de inicio
# Usamos el formato Shell (sin [] ni sh -c) para que $PORT se expanda correctamente.
CMD env | sort && gunicorn --chdir api --bind 0.0.0.0:$PORT app:app
