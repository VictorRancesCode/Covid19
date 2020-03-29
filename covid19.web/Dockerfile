FROM vevende/python3:latest
COPY requirements.txt /requirements.txt
RUN gosu app pip install --no-cache-dir -r /requirements.txt
COPY . /app

CMD ["python","manage.py","runserver","0.0.0.0:8000","--insecure"]

EXPOSE 8000