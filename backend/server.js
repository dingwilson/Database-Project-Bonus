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
client.query("SELECT * FROM items WHERE item_type='hand'", (err,response) => {
    	console.log(response);
    	res.send(JSON.stringify(response.rows));
});
});

app.get('/characters',function(req,res){
client.query('SELECT * FROM characters', (err,response) => {
    	console.log(response);
	res.send(JSON.stringify(response.rows));
});
});

app.get('/backpacks',function(req,res){
client.query('SELECT * FROM backpacks', (err,response) => {
    	console.log(response);
	res.send(JSON.stringify(response.rows));
});
});

app.get('/spells',function(req,res){
client.query('SELECT * FROM spells', (err,response) => {
    	console.log(response);
	res.send(JSON.stringify(response.rows));
});
});

app.get('/races',function(req,res){
client.query('SELECT * FROM races', (err,response) => {
    	console.log(response);
	res.send(JSON.stringify(response.rows));
});
});


app.get('/classes',function(req,res){
client.query('SELECT * FROM classes', (err,response) => {
    	console.log(response);
	res.send(JSON.stringify(response.rows));
});
});

app.get('/equipped',function(req,res){
client.query('SELECT * FROM equipped', (err,response) => {
    	console.log(response);
	res.send(JSON.stringify(response.rows));
});
});

var server = app.listen(3000, function() {
    console.log('Express is listening to http://localhost:3000');
});
