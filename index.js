const { Client } = require('pg');

const configs = {
    host: 'localhost',
    port: 5432,
    user: 'postgres',
    password: 'postgres',
    database: 'students'
}

const client = new Client(configs);

async function start() {
    await client.connect();

    const response = await client.query(`
        INSERT INTO users(first_name, last_name, email, gender, is_subscribe) VALUES
        ('Maria', 'Semenova', 'maria.semenova@gmail.com', 'female', true);
    `)

    await client.end();

    console.log(response);
}

start();