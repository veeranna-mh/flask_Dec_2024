FROM python:3.9-slim 
WORKDIR /flask-docker
RUN apt-get update && apt-get install -y \
    build-essential \
    libatlas-base-dev \
    gfortran \
    && apt-get clean

RUN python -m pip install --upgrade pip

COPY requirements.txt .
RUN pip install --no-cache-dir --prefer-binary -r requirements.txt

COPY . .
ENV FLASK_APP=app.py
EXPOSE 5000

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]
