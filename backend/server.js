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


//This is the homepage for our API, nothing really going on here just a casual rest to ensure connectivity
app.get('/', function(req,res){
	logger('Endpoint: Homepage');
	res.write('Welcome to the awesome homepage that is our RPG Database project xD');
	res.end();
});
/*
--------------------------------------------------------
Endpoint for items, '/items' returns all items in  our
database while '/items/:id' will return item with :id
--------------------------------------------------------
*/
app.get('/items',function(req,res){
client.query(logger("SELECT * FROM items"), (err,response) => {
	//logger(response);
    	res.send(JSON.stringify(response.rows));
});
});

app.get('/items/:id', function(req,res){
let sql = 'SELECT * FROM items WHERE item_id=' + req.params.id;
client.query(logger(sql), (err,response) => {
	//logger(response);
	res.send(JSON.stringify(response.rows));
});
});

/*
--------------------------------------------------------
Character Endpoint
--------------------------------------------------------
*/
app.get('/characters',function(req,res){
client.query(logger('SELECT * FROM characters'), (err,response) => {
	//logger(response);
	res.send(JSON.stringify(response.rows));
});
});

app.get('/characters/:id', function(req,res){
let sql = 'SELECT * FROM characters WHERE char_id=' + req.params.id;
client.query(logger(sql), (err,response) => {
	//logger(response);
	res.send(JSON.stringify(response.rows));
});
});
/*
--------------------------------------------------------
Backpack Endpoint
'/backpack/:id' returns a characters backpack
--------------------------------------------------------
*/
app.get('/backpacks',function(req,res){
client.query(logger('SELECT * FROM backpacks'), (err,response) => {
    	//logger(response);
	res.send(JSON.stringify(response.rows));
});
});

app.get('/backpacks/:id',function(req,res){
let sql = 'SELECT * FROM backpacks WHERE char_id=' + req.params.id;
client.query(logger(sql), (err,response) => {
	//logger(response);
	res.send(JSON.stringify(response.rows));
});
});
/*
--------------------------------------------------------
Spell Endpoint
'/spells/class/id' returns all spells for class with id
'/spells/race/id' returns all spells for class with id
--------------------------------------------------------
*/
app.get('/spells',function(req,res){
client.query(logger('SELECT * FROM spells'), (err,response) => {
    	//logger(response);
	res.send(JSON.stringify(response.rows));
});
});

app.get('/spells/:id', function(req,res){
let sql = 'SELECT * FROM spells WHERE spell_id='+req.params.id;
client.query(logger(sql), (err, response) => {
	//logger(response)
	res.send(JSON.stringify(response.rows));
});
});

app.get('/spells/class/:id', function(req,res){
let sql = 'SELECT * FROM spells where class_id='+req.params.id;
client.query(logger(sql), (err, response) => {
	//logger(response)
	res.send(JSON.stringify(response.rows));
});
});


app.get('/spells/race/:id', function(req,res){
let sql = 'SELECT * FROM spells where race_id='+req.params.id;
client.query(logger(sql), (err, response) => {
	//logger(response)
	res.send(JSON.stringify(response.rows));
});
});

/*
--------------------------------------------------------
Race Endpoint
'/races/:id' returns all characters that are of race id
--------------------------------------------------------
*/
app.get('/races',function(req,res){
client.query(logger('SELECT * FROM races'), (err,response) => {
    	console.log(response);
	res.send(JSON.stringify(response.rows));
});
});

app.get('/races/:id', function(req,res){
let sql = 'SELECT * FROM characters where race_id='+req.params.id;
client.query(logger(sql), (err, response) => {
	//logger(response)
	res.send(JSON.stringify(response.rows));
});
});


/*
----------------------------------------------------------
Class Endpoint
'/classes/:id' returns all characters that are of class id
----------------------------------------------------------
*/
app.get('/classes',function(req,res){
client.query(logger('SELECT * FROM classes'), (err,response) => {
    	//logger(response);
	res.send(JSON.stringify(response.rows));
});
});

app.get('/classes/:id', function(req,res){
let sql = 'SELECT * FROM characters WHERE class_id='+req.params.id;
client.query(logger(sql), (err,response)=>{
	//logger(response);
	res.send(JSON.stringify(response.rows));
});
});

/*
--------------------------------------------------------
Equipped Endpoint
'/equipped/:id' returns equipped items for character
--------------------------------------------------------
*/
app.get('/equipped',function(req,res){
client.query(logger('SELECT * FROM equipped'), (err,response) => {
    	//logger(response);
	res.send(JSON.stringify(response.rows));
});
});

app.get('/equipped/:id', function(req,res){
let sql = 'SELECT * FROM equipped WHERE char_id='+req.params.id;
client.query(logger(sql), (err, response) => {
	//logger(response)
	res.send(JSON.stringify(response.rows));
});
});

var server = app.listen(3000, function() {
    console.log('Express is listening to http://localhost:3000');
});

function logger(data){
d = new Date();
console.log("---------------------------------------------------------");
console.log(d.toLocaleString());
console.log(data);
return data;
};

