FROM node:14.21.3-alpine3.17

WORKDIR /app

COPY package*.json .
RUN npm install
COPY dist/final.js .

ENV OTEL_SERVICE_NAME=nodejs-express-otel
ENV OTEL_EXPORTER_OTLP_ENDPOINT=http://host.docker.internal:4317
ENV OTEL_RESOURCE_ATTRIBUTES='deployment.environment=test,service.version=1.0'

EXPOSE 8080
CMD ["node","-r", "@splunk/otel/instrument", "final.js"]
