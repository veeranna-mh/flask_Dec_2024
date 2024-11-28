FROM python:3.14-rc-bookworm
WORKDIR /flask-docker
RUN python -m pip install --upgrade pip
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . . 


ENV FLASK_APP=app.py
EXPOSE 5000
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]

