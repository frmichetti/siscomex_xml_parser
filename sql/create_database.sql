create table configurations(
	key varchar(255) not null
		constraint configurations_key_pk
			primary key,
	value varchar(255) not null
);

create unique index configurations_key_uindex
	on configurations (key);

insert into configurations (key, value) values ('version', 0.1);

