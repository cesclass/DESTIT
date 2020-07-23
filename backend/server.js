const express = require('express');
const app = express();
const PORT = 8080;

// handle API HTTP GET request
app.get('/api', (req, res, next) => {
  // do something
})

// for static files (html, css, ...)
app.use('/', express.static('../frontend/admin'));

// start the server
app.listen(PORT, () => {
  console.log(`http://localhost:${PORT}/`);
});
