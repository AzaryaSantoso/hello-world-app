const express = require('express');
const app = express();
const port = 3000;

// Route untuk GET request ke '/'
app.get('/', (req, res) => {
  res.send('Hello World!');
});

// Menjalankan server pada port yang ditentukan
app.listen(port, () => {
  console.log(`App listening on port ${port}`);
});