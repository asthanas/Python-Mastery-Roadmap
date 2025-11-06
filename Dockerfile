# Builder stage
FROM python:3.11-slim AS builder
WORKDIR /app
COPY pyproject.toml /app/
RUN pip install --upgrade pip
RUN pip install poetry
# Runtime stage
FROM python:3.11-slim
WORKDIR /app
COPY . /app
RUN pip install --upgrade pip
RUN pip install -r requirements-dev.txt
CMD ["uvicorn", "src.app.main:app", "--host", "0.0.0.0", "--port", "8000"]