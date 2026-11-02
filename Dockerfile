FROM python:3.11-slim

# Install Node.js and npm for JavaScript hosting
RUN apt-get update && apt-get install -y --no-install-recommends \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Install Python dependencies
RUN pip install --no-cache-dir \
    Flask \
    psutil \
    requests \
    pyTelegramBotAPI

# Create non-root user
RUN useradd -m -u 10001 appuser \
    && mkdir -p /app/upload_bots /app/inf /app/python-packages \
    && chown -R appuser:appuser /app

# Allow runtime Python package installation
ENV HOME=/home/appuser
ENV PIP_TARGET=/app/python-packages
ENV PYTHONPATH=/app/python-packages
ENV PYTHONUNBUFFERED=1

# Copy bot source code
COPY --chown=appuser:appuser app.py /app/app.py

# Run as non-root user
USER appuser

# Render web service port
EXPOSE 8080

# Start Telegram bot
CMD ["python", "app.py"]
