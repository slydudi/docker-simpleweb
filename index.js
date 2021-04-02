const express = require('express');

const app = express();

app.get('/test', (req, res) => {
	res.send('Hi there Sylwester 5');
});


app.listen (8080, () => {
	console.log	('Listening on port 8080');
});