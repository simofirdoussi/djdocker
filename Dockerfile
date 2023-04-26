# Pull base image
FROM python

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Create and set work directory called `app`
RUN mkdir -p /app
WORKDIR /app

# Install dependencies
COPY requirements.txt /tmp/requirements.txt

RUN set -ex && \
    pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt && \
    rm -rf /root/.cache/

# Copy local project
COPY . .

# Expose port 8000
EXPOSE 8000

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000"]
