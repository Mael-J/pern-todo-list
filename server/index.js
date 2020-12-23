const express = require('express');
const app  = express();
const cors = require('cors');
const pool = require('./db');
const path = require('path');

//middleware
app.use(cors());
app.use(express.json());

//ROUTES
app.use(express.static(path.join(__dirname, 'build')));
app.get('/', function (req, res) {
    res.sendFile(path.join(__dirname, 'build', 'index.html'));
  });
//Create a TODO
app.post("/todos", async (req,res) => {
    try {
        const { description } = req.body;
       
        const newTodo = await pool.query("INSERT INTO todo (description) VALUES($1) RETURNING * ",
         [description]
         );

        res.json(newTodo.rows[0]);
    } catch (error) {
        console.error(error.message);
        
    }
});

// get all TODO
app.get('/todos', async (req,res)=> {
    try {
        const allTodos = await pool.query("SELECT * from todo");
        res.json(allTodos.rows);
    } catch (error) {
        console.error(error.message);
    }
});

//get a TODO
app.get('/todos/:id', async (req,res) => {
    try {
        const {id} = req.params;
        const todo = await pool.query("SELECT * FROM todo where todo_id = $1", [id]);
        res.json(todo.rows[0]);
    } catch (error) {
        console.error(error.message);
    }
})
//update a TODO
app.put('/todos/:id', async (req,res) => {
    try {
        const {id} = req.params;
        const {description} = req.body;
        const updateTodo = await pool.query("UPDATE todo SET description = $1 where todo_id = $2",
        [description,id]);
        res.json("Todo was updated");
        
    } catch (error) {
        console.error(error.message);
        
    }
})
//delete a TODO
app.delete('/todos/:id', async (req,res) => {
    try {
        const {id} = req.params;
        const deleteTodo = pool.query('DELETE FROM todo where todo_id = $1',
        [id]);
        res.json("Todo was deleted");
    } catch (error) {
        console.error(error.message);
        
    }
})


app.listen(5000, () => {
    console.log("server has started on port 5000")
});