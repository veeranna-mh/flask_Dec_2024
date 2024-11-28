FROM python:3.11-slim
WORKDIR /flask-docker
RUN python -m pip install --upgrade pip
RUN apt-get update && apt-get install -y \
    build-essential \
    gfortran \
    libopenblas-dev \
    liblapack-dev \
    && apt-get clean

COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .

ENV FLASK_APP=app.py
EXPOSE 5000

CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
