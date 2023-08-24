const { getUsers } = require('./api/fetch');
const { client, User, Product } = require('./models');
const { generatePhones } = require('./utils');

async function start() {
    await client.connect();

    // ОТРИМАННЯ ЮЗЕРІВ І ДОДАВАННЯ ЇХ ДО БД
    // const usersArray = await getUsers();
    // const response = await User.bulkCreate(usersArray);
    // console.log(response);

    // ГЕНЕРАЦІЯ ТЕЛЕФОНІВ І ДОДАВАННЯ ЇХ ДО БД
    const phones = generatePhones(200);
    const response = await Product.bulkCreate(phones);
    console.log(response);

    await client.end();
}

start();