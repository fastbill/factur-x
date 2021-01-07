FROM python:3.8-slim-buster
WORKDIR /usr/src/app
ADD requirement.txt /usr/src/app
ADD bin/facturx-webservice /usr/src/app/app.py
ADD facturx /usr/src/app/facturx
RUN pip install --no-cache-dir -r requirement.txt
EXPOSE 5000
CMD ["gunicorn","--workers=4", "--bind", "0.0.0.0:5000","app:app"]
