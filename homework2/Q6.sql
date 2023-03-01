-- I am using bit.io for this question


create table account(
    owner_user_id varchar not null unique,
    owner_name varchar,
    email varchar,
    user_address varchar,
    age int default 0,
    is_vid_creator bool default False,

    primary key (owner_user_id)

);


create table channel(
    
    channel_name varchar not null unique,
    owner_user_id varchar not null,
    creation_date date not null,
    total_sub int default 0,
    primary key (channel_name),
    foreign key (owner_user_id) references account on update cascade

);

create table video(
    video_url varchar not null unique,
    video_title varchar not null,
    thumbnail int default 0,
    description varchar,
    duration int not null default 0,
    
    --duration here is measured by how many seconds
    primary key (video_url)

);

create table upload_request(
    owner_user_id varchar not null,
    channel_name varchar not null,
    video_url varchar not null,
    upload_date date not null,
    primary key (owner_user_id,channel_name,video_url),
    foreign key (owner_user_id) references account on update cascade,
    foreign key (channel_name) references channel on update cascade,
    foreign key (video_url) references video on update cascade


);
------finish creating table


insert into account values('escromte', 'Lewis Hamilton', 'qhrh@gvq.com', '4480 W 31,New Mexico,US', 41);
insert into account values('fniixqyp', 'Pierre Zhou', 'ffaj@aue.com', '2440 N 47 New York,US', 20);
insert into account values('ihidynae', 'John Massi', 'zwav@hyx.com', '2819 S 51 Beijing,China', 39);
insert into account values('midfcivf', 'John Zhao', 'tgou@mcm.com', '3955 S 95 New Mexico,US', 12);

-----------finish inserting data into account

insert into channel values('Lewis_channel','escromte','2013-06-07',282);
insert into channel values('Champion_here','escromte','2013-06-07',103);--in usa,succeed here
insert into channel values('Zhou','fniixqyp','2013-06-07',102);--in usc ,didn't qualify in this channel
insert into channel values('24','fniixqyp','2013-06-07',7);--in usa , did'nt qualify in this channel,but combined ok
insert into channel values('BJ','ihidynae','2013-06-07',203);-- not in usa
insert into channel values('lazyaf','midfcivf','2013-06-07',53);--Live in usa and not qualified 