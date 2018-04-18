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
	res.send('Hello World! :D');
});

app.get('/items',function(req,res){
client.query('SELECT * FROM items', (err,res) => {
    console.log(JSON.stringify(res.fields));
});
res.send('Items Page');
});

app.get('/characters',function(req,res){
client.query('SELECT * FROM characters', (err,res) => {
    console.log(JSON.stringify(res.fields));
});
res.send('Characters Page');
});

app.get('/backpacks',function(req,res){
client.query('SELECT * FROM backpacks', (err,res) => {
    console.log(JSON.stringify(res.fields));
});
res.send('Backpacks Page');
});

app.get('/spells',function(req,res){
client.query('SELECT * FROM spells', (err,res) => {
    console.log(JSON.stringify(res.fields));
});
res.send('Spells Page');
});

app.get('/races',function(req,res){
client.query('SELECT * FROM races', (err,res) => {
    console.log(JSON.stringify(res.fields));
});
res.send('Races Page');
});


app.get('/classes',function(req,res){
client.query('SELECT * FROM classes', (err,res) => {
    console.log(JSON.stringify(res.fields));
});
res.send('Classes Page');
});

app.get('/equipped',function(req,res){
client.query('SELECT * FROM equipped', (err,res) => {
    console.log(JSON.stringify(res.fields));
});
res.send('Equipped Page');
});

var server = app.listen(3000, function() {
	console.log('Express is listening to http://localhost:3000');
	});


