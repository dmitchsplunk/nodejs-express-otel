# nodejs-express-otel

# install dependencies 
npm install express
npm install @splunk/otel
sudo npm install -g webpack
npm install webpack webpack-cli --save-dev

# build the app with webpack 
npm run build 

# build a docker image 
docker build -t nodejs-express-otel .

# run the application in docker 
docker run -p 8080:8080 -d nodejs-express-otel