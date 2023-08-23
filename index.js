const { Client } = require('pg');
const { mapUsers } = require('./utils');

const configs = {
    host: 'localhost',
    port: 5432,
    user: 'postgres',
    password: 'postgres',
    database: 'students'
}

const client = new Client(configs);

const usersArray = [
    {
        firstName: 'Test1',
        lastName: 'Grishina',
        email: 'test1@gmail.com',
        isSubscribe: false,
        gender: 'female'
    },
    {
        firstName: 'Test2',
        lastName: 'Grishina',
        email: 'test2@gmail.com',
        isSubscribe: false,
        gender: 'female'
    },
    {
        firstName: 'Test3',
        lastName: 'Grishina',
        email: 'test3@gmail.com',
        isSubscribe: false,
        gender: 'female'
    },
    {
        firstName: 'Test4',
        lastName: 'Grishina',
        email: 'test4@gmail.com',
        isSubscribe: false,
        gender: 'female'
    },
    {
        firstName: 'Test5',
        lastName: 'Grishina',
        email: 'test5@gmail.com',
        isSubscribe: false,
        gender: 'female'
    }
]

async function start() {
    await client.connect();

    const response = await client.query(`
        INSERT INTO users(first_name, last_name, email, gender, is_subscribe) VALUES
        ${mapUsers(usersArray)}
    `)

    await client.end();

    console.log(response);
}

start();