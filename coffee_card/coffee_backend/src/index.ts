import express from 'express';
import { query } from './db';

const app = express();
const port = 3000;

app.use(express.json()); // This allows the server to read JSON data sent from the app

app.get('/users', async (req, res) => {


  /* fetches the first 10 users from the database
 args:
req (request): the incoming express request object
 res (response): the outgoing express response object
returns:
none (sends a json list of user objects to the client)*/
  try {
    
    const result = await query('SELECT first_name, email FROM person LIMIT 10');
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send('Server Error');
  } 
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});