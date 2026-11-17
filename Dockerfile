FROM python:3.9-slim

WORKDIR /app

RUN groupadd -r appgroup && useradd -r -g appgroup appuser

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=appuser:appgroup . /app

USER appuser

EXPOSE 4000

CMD ["python", "main.py"]
