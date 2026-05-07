import express from 'express';
import { query } from './db';

const app = express();
const port = 3000;

app.use(express.json());

app.get('/users', async (req, res) => {
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