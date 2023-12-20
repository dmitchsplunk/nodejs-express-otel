# nodejs-express-otel

This is a simple node.js application that uses the express framework.  It's built with webpack and deployed as a Docker container.  It's instrumented with the Splunk distribution of OpenTelemetry JS. 

This example assumes that an OpenTelemetry collector is accessible from the Docker container via http://host.docker.internal:4317. 
### Install dependencies 
````
npm install express
npm install @splunk/otel
sudo npm install -g webpack
npm install webpack webpack-cli --save-dev
````

### Build the app with webpack 

````
npm run build 
````

### Build a docker image 

````
docker build -t nodejs-express-otel .
````

### Run the application in docker 

````
docker run -p 8080:8080 -d nodejs-express-otel
````