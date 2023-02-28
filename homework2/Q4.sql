-- I am using bit.io for this question

create table video(
    video_url varchar not null unique,
    video_title varchar not null,
    thumbnail int default 0,
    description varchar,
    duration int not null default 0,
    category varchar,
    --duration here is measured by how many seconds
    primary key (video_url)




);

create table info_video(
        video_url varchar not null,
        keyword varchar not null,
        primary key (video_url,keyword)
)

create table comment (
    video_url varchar not null,
    comment_id varchar not null,
    commenter_id varchar not null,
    comment_text varchar,
    likes int default 0,
    sentiment int default 0,
)

create table account(
    owner_user_id varchar not null unique,
    owner_name varchar,
    email varchar,
    user_address varchar,
    age int default 0,
    is_vid_creator bool default False,

    primary key (owner_user_id)

);