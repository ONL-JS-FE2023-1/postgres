module.exports.mapUsers = (usersArray) => {
    return usersArray.map((user) => `('${user.firstName}', '${user.lastName}', '${user.email}', '${user.gender}', ${user.isSubscribe})`)
    .join(',');
}


/*

`
('${user.firstName}', '${user.lastName}', '${user.email}', '${user.gender}', ${user.isSubscribe}),
('${user.firstName}', '${user.lastName}', '${user.email}', '${user.gender}', ${user.isSubscribe}),
('${user.firstName}', '${user.lastName}', '${user.email}', '${user.gender}', ${user.isSubscribe}),
('${user.firstName}', '${user.lastName}', '${user.email}', '${user.gender}', ${user.isSubscribe}),
('${user.firstName}', '${user.lastName}', '${user.email}', '${user.gender}', ${user.isSubscribe});
`

*/