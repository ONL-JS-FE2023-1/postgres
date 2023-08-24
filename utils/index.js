module.exports.mapUsers = (usersArray) => {
  return usersArray
    .map(
      ({ 
        name: { first, last },
        email,
        gender,
        dob: {date}
    }) =>
        `('${first}', '${last}', '${email}-${date}', '${gender}', ${Boolean(Math.random() > 0.5)}, '${date}')`
    )
    .join(",");
};

/*

`
('${user.firstName}', '${user.lastName}', '${user.email}', '${user.gender}', ${user.isSubscribe}),
('${user.firstName}', '${user.lastName}', '${user.email}', '${user.gender}', ${user.isSubscribe}),
('${user.firstName}', '${user.lastName}', '${user.email}', '${user.gender}', ${user.isSubscribe}),
('${user.firstName}', '${user.lastName}', '${user.email}', '${user.gender}', ${user.isSubscribe}),
('${user.firstName}', '${user.lastName}', '${user.email}', '${user.gender}', ${user.isSubscribe});
`

*/
