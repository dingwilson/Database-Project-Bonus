var express = require('express');
var app = express();

const { Pool, Client } = require('pg')

const client = new Client({
	user: 'postgres',
	host: '70.119.87.18',
	password: 'ppkw_CS4347_003',
	database: 'postgres',
	port: 5432
});
client.connect();
app.get('/', function(req,res){
	console.log('Home');
	res.write('Hello World! :D');
	res.end();

});

app.get('/items',function(req,res){
client.query('SELECT * FROM items', (err,response) => {
    	console.log(response);
    	res.send('Items Page\n' + JSON.stringify(response.fields));
});
});

app.get('/characters',function(req,res){
client.query('SELECT * FROM characters', (err,response) => {
    	console.log(response);
	res.send('Characters Page\n' + JSON.stringify(response.fields));
});
});

app.get('/backpacks',function(req,res){
client.query('SELECT * FROM backpacks', (err,response) => {
    	console.log(response);
	res.send('Backpacks Page\n' + JSON.stringify(response.fields));
});
});

app.get('/spells',function(req,res){
client.query('SELECT * FROM spells', (err,response) => {
    	console.log(response);
	res.send('Spells Page\n' + JSON.stringify(response.fields));
});
});

app.get('/races',function(req,res){
client.query('SELECT * FROM races', (err,response) => {
    	console.log(response);
	res.send('Races Page\n' + JSON.stringify(response.fields));
});
});


app.get('/classes',function(req,res){
client.query('SELECT * FROM classes', (err,response) => {
    	console.log(response);
	res.send('Classes Page\n' + JSON.stringify(response.fields));
});
});

app.get('/equipped',function(req,res){
client.query('SELECT * FROM equipped', (err,response) => {
    	console.log(response);
	res.send('Equipped Page\n'+ JSON.stringify(response.fields));
});
});

var server = app.listen(3000, function() {
    console.log('Express is listening to http://localhost:3000');
    });
