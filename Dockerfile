FROM python:3.9.1-alpine
RUN apk add --update --no-cache g++ gcc libxslt-dev curl
WORKDIR /usr/src/app
ADD requirement.txt /usr/src/app
ADD bin/facturx-webservice /usr/src/app
ADD facturx /usr/src/app/facturx
RUN pip install --no-cache-dir -r requirement.txt
EXPOSE 5000
ENTRYPOINT ["python","facturx-webservice","-d","-s","0.0.0.0"]
