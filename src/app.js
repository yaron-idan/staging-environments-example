var fs = require('fs'),
    http = require('http');

http.createServer(function (req, res) {
  console.log(req.url);
  if (req.url === '/healthcheck')
  {
    res.writeHead(200);
    res.end("healthy");
  }
  else if (req.url === '/index.html')
  {
    fs.readFile(__dirname + '/files/index.html', function (err,data) {
    if (err) {
      res.writeHead(404);
      res.end(JSON.stringify(err));
      return;
    }
      res.writeHead(200);
      res.end(data);
    });
  }
  else
  {
    res.writeHead(404);
    res.end("NOT FOUND");
    return;
  }
  
}).listen(8080);
