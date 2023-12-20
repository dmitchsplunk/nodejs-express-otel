FROM node:14.21.3-alpine3.17 as builder

RUN mkdir -p /app
WORKDIR /app

COPY package*.json .
RUN npm install

COPY . .

RUN npm run build

FROM node:14.21.3-alpine3.17 as final

WORKDIR /app

#COPY --from=builder /app .
COPY --from=builder /app/dist/final.js /app/dist/final.js

ENV OTEL_SERVICE_NAME=nodejs-express-otel
ENV OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4317
ENV OTEL_RESOURCE_ATTRIBUTES='deployment.environment=test,service.version=1.0'

EXPOSE 8080
CMD ["node","-r", "@splunk/otel/instrument", "dist/final.js"]
#CMD ["sh"]