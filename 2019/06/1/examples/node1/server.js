var http = require('http');
var port = process.env.PORT || 8080;

var handleRequest = function(request, response) {
  console.log('Received request for URL: ' + request.url);
  response.writeHead(200);
  response.end('Hello SnowDeer!');
};

var www = http.createServer(handleRequest);

www.listen(port);
