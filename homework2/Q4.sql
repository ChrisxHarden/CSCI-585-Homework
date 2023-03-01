-- I am using bit.io for this question


----please make sure starting with a new database or delete all exsiting tables before running this SQL code
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
create table account(
    owner_user_id varchar not null unique,
    owner_name varchar,
    email varchar,
    user_address varchar,
    age int default 0,
    is_vid_creator bool default False,

    primary key (owner_user_id)

);

create table info_video(
        video_url varchar not null,
        keyword varchar not null,
        primary key (video_url,keyword),
        foreign key (video_url) references video on update cascade
);

create table comment (
    video_url varchar not null,
    comment_id varchar not null,
    commenter_id varchar not null,
    comment_text varchar,
    likes int default 0,
    sentiment int default 0,
    primary key(video_url,comment_id),
    foreign key (commenter_id) references account on update cascade,
    foreign key (video_url) references video on update cascade
);
--finish creating table

--in bit.io the comment table may not show at first, refreshing the page may help

insert into account values(
    'dsapdfoiasdfh',
    'Marvel Entertainment Club',
    'MEC@mcu.com',
    'Los Angeles, US',
    54,
    True

);

insert into account values(
    'pqoweifgoiadj',
    'News of Marvel Entertainment',
    'NfME@mcu.com',
    'Los Angeles, US',
    48,
    True

);

insert into account values(
    'apsdoigjapsod',
    'fake marvel entertainment',
    'yougottrolled@gmail.com',
    'Los Angeles, US',
    23,
    True

);

-- insert data into account table

insert into video values('https://www.youtube.com/puitcox9w2', 'iafzqpwienwmao', 940, 'lhkdrtsahshotrympdyzvfccidzqwihslrn', 3296,'Info');
insert into video values('https://www.youtube.com/0v6h5tckdg', 'xwicfdsjaelnna', 1336, 'omddvdqzaqqodsbibpxwoxvelqfilyshnvx', 506,'Info');
insert into video values('https://www.youtube.com/bs21x09lng', 'jcgpegkevpvqhc', 799, 'beiymgojcfbsughlwflnfhbudzkpmehlmhe', 3323,'Entertainment');
insert into video values('https://www.youtube.com/fst1ecy6qo', 'iwlbwspmnrygrz', 568, 'nzhmpnxruphavmoboxkapzupsidjiugcwro', 726,'Info');
insert into video values('https://www.youtube.com/qjo096t8k7', 'djshjipdyqxpzq', 688, 'lydoatdzgropxwpglsehzmsurysmegvnbmg', 3124,'Info');

-- insert data into video table

insert into info_video values('https://www.youtube.com/puitcox9w2','Fashion');
insert into info_video values('https://www.youtube.com/puitcox9w2','Food');
insert into info_video values('https://www.youtube.com/puitcox9w2','Travel');
insert into info_video values('https://www.youtube.com/0v6h5tckdg','Travel');
insert into info_video values('https://www.youtube.com/fst1ecy6qo','Food');
insert into info_video values('https://www.youtube.com/fst1ecy6qo','Fashion');
insert into info_video values('https://www.youtube.com/qjo096t8k7','Food');

--insert data into info_video table, in this table, each data item record a video and one of its keyword
insert into comment values('https://www.youtube.com/puitcox9w2','artjqnqohahlgh', 'pqoweifgoiadj', 'wayedlqjfgjtqlyhhhujjodavqazluxoqnarnuwuqn', 98, 5);
insert into comment values('https://www.youtube.com/0v6h5tckdg','xgiaxdctfbedtw', 'pqoweifgoiadj', 'dtkoodfqilctmnpdpwzjogsepzqfvalheczzgxmyes', 56, 1);
insert into comment values('https://www.youtube.com/puitcox9w2','znzrkaynvymkce', 'dsapdfoiasdfh', 'naqcvijldqotmavlpduzqbqleacdcrwtfsqghwlvbg', 17, 4);
insert into comment values('https://www.youtube.com/bs21x09lng','tnznyleoqwuovo', 'apsdoigjapsod', 'klmshkqaeudgysvjjbaffepkvfhsuvzxorzjeyodoj', 10, 1);
insert into comment values('https://www.youtube.com/puitcox9w2','hsccvrritvcvqz', 'dsapdfoiasdfh', 'gfaalvpvjhdyoqzpruocipzyzudkdxgxdnjdimbraj', 22, 6);
insert into comment values('https://www.youtube.com/bs21x09lng','ovvfpguxfgafgj', 'dsapdfoiasdfh', 'aabrbddbthiononrbzydakmsevzsgeayhgvvwjyxfn', 63, 4);
insert into comment values('https://www.youtube.com/fst1ecy6qo','nhsamyzdfgoupk', 'apsdoigjapsod', 'ggishenoktsqptlceewnomuqccaoeyfvfhblnhgpef', 90, 2);
insert into comment values('https://www.youtube.com/qjo096t8k7','wvzteadwuferrr', 'pqoweifgoiadj', 'selqqsrhyhcejdskzquppkbxtthedcxcmefqblisfw', 95, 7);
insert into comment values('https://www.youtube.com/0v6h5tckdg','macqpcbbqsjuhp', 'pqoweifgoiadj', 'tzslzepojmwzbdygfdzbdauhzyoilweozljtchnrfs', 95, 8);
insert into comment values('https://www.youtube.com/qjo096t8k7','wlhxcprnkxnnen', 'pqoweifgoiadj', 'mafbjebdvsfdjxdyebeqocdfbnprpyujotsycwkkqc', 95, 1);

--insert data into comment table


--------------------finish inserting data------------------

select * 
from(select info_video.keyword,avg(sentiment) as avgs --select the keywords and its average sentiment score
from video,info_video,comment 
where video.video_url=comment.video_url and--join video and comment table
    video.video_url=info_video.video_url--join video and info_video table
    
group by info_video.keyword  --as info_video table stores(video_url, keyword) as a data entry, using the group by clause will group the videos into different keywords. same video could be grouped into different keywords with multiple copies.
) as s1

order by s1.avgs desc-- make sure the keyword with the highest average sentiment score is shown at first 