create table configurations(
	key varchar(255) not null
		constraint configurations_key_pk
			primary key,
	value varchar(255) not null
);

create unique index configurations_key_uindex
	on configurations (key);

insert into configurations (key, value) values ('version', 0.1);

create table file_sync(
	id bigserial not null
		constraint file_sync_pkey
			primary key,
	file_name varchar(255) not null,
	status varchar(255) default 'NEW'::character varying not null,
	content_size integer not null,
	read_count integer not null
);

create unique index file_sync_id_uindex
	on file_sync (id);

create unique index file_sync_file_name_uindex
	on file_sync (file_name);

ALTER TABLE file_sync ADD locked boolean DEFAULT false  NOT NULL;
