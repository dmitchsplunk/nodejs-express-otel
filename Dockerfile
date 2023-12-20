FROM node:14.21.3-alpine3.17

WORKDIR /app

COPY . .

ENV OTEL_SERVICE_NAME=nodejs-express-otel
ENV OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4317
ENV OTEL_RESOURCE_ATTRIBUTES='deployment.environment=test,service.version=1.0'

EXPOSE 8080
CMD ["node","-r", "@splunk/otel/instrument", "dist/final.js"]
#CMD ["sh"]