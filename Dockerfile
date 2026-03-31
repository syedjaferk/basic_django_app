FROM python:3.11-slim

WORKDIR /blog

RUN apt-get update

COPY blog/requirements.txt .
RUN pip install -r requirements.txt

COPY blog/ .

CMD ["gunicorn", "blog.wsgi:application", "--bind", "0.0.0.0:8000"]

