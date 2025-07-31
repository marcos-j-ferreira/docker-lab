const express = require('express');
const app = express();
const PORT = 3000


app.use(express.json());


app.get('/', (req, res) => {
    res.send('Hello, world!');
});


app.get('/api/message', (req, res) => {
    res.json({message: 'This is a simple API'});
});

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});