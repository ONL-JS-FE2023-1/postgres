/*

Необхідно спроектувати БД поставки товарів.

В БД має зберігатися наступна інформація.

Товари:
- код товару
- назва товару
- ціна

Замовлення на поставку:
- код замовленння
- найменування постачальника
- адреса постачальнику
- номер договору
- дата заключення договору
- найменування товару
- план поставки (кількість в шт)

Фактичні відгрузки товару:
- код відгрузки
- код замовлення
- дата відгрузки
- відгружено товару (шт)

При проектуванні БД потрібно врахувати:
- товар має декілька замовлень на постачання
- замовлення відповідає одному товару
- товару можуть відповідати декілька відгрузок
- у одній відгрузці може бути декілька товарів
- товар не обов'язково має замовлення; кожне замовлення відповідає товару
- товар не обов'язково відгружається замовнику, але кожна відгрузка обов'язково відповідає певному товару

Примітка 1.
ПЛАН ПОСТАВКИ: у вас може бути замовлення, але ви його можете виконати не одразу, а частинами

Примітка 2.
Структура відношень у завданні є орієнтовною)
Таблиці потрібно спроектувати самостійно, не бійтеся нормалізувати, якщо відчуваєте, що це потрібно

*/

CREATE TABLE products(
    id serial PRIMARY KEY,
    name varchar(300) CHECK (name != '') NOT NULL
);

CREATE TABLE manufacturers(
    id serial PRIMARY KEY,
    name varchar(400) CHECK (name != '') NOT NULL,
    address text CHECK (address != '') NOT NULL,
    tel_number varchar(20) CHECK (tel_number != '') NOT NULL
);

CREATE TABLE orders(
    id serial PRIMARY KEY,
    product_id int REFERENCES products(id),
    contract_address text CHECK (contract_address != '') NOT NULL,
    quantity_plan int NOT NULL,
    product_price decimal(10, 2),
    contract_number int NOT NULL,
    contract_date date NOT NULL,
    manufacturer_id int REFERENCES manufacturers(id)
);

CREATE TABLE shipments(
    id serial PRIMARY KEY,
    order_id int REFERENCES orders(id),
    shipment_date timestamp NOT NULL
);

CREATE TABLE products_to_shipments(
    product_id int REFERENCES products(id),
    shipment_id int REFERENCES shipments(id),
    product_quantity int NOT NULL
);