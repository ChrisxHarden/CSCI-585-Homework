-- I am using bit.io for this question

create table video(
    video_url varchar not null unique,
    video_title varchar not null,
    thumbnail int default 0,
    description varchar,
    duration int not null default 0,
    
    --duration here is measured by how many seconds
    primary key (video_url)

);

create table statitics(
    video_url varchar not null unique,
    likes int not null default 0,
    dislikes int not null default 0,
    views int not null default 0,
    num_share int not null default 0,
    num_com int not null default 0,
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



create table video_his(
    video_url varchar not null,
    viewer_id varchar not null,
    primary key (video_url,viewer_id)
);


create table channel(
    channel_name varchar not null unique,
    owner_user_id varchar not null,
    creation_date date not null,
    primary key (channel_name),
    foreign key (owner_user_id) references account on update cascade

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


---finish creating table

insert into account values(
    'adutiaudn',
    'Taylor Swift',
    'thisisTaylor@ts.com',
    'Los Angeles,US',
    33,
    True
);--this is the REAL TAYLOR SWIFT

insert into account values(
    'aosdigapsq',
    'Taylor Swift',
    'thisisnotTaylor@ts.com',
    'Los Angeles,US',
    33,
    True
);--this is another person with the same name


insert into account values('vggwuzewh', 'Lewis Swift', 'a@hbltm.com', '4706 W 12 Atlanta', 34);
insert into account values('bjojomekl', 'Lewis Zhou', 'koojh.com', '4503 W 52 Atlanta', 32);
insert into account values('hqtvzzvks', 'Jack Massi', 'lohgl.com', '4479 N 94 New Mexico', 51);
insert into account values('vprxkaadp', 'Dom Hamilton', 'dnkjo.com', '4428 S 84 San Francisco', 60);
insert into account values('pybktsmgc', 'Lewis Harden', 'byp@og.com', '604 N 4 New Mexico', 11);
insert into account values('cewoohjvk', 'Jack Harden', 'ik@akd.com', '1452 S 12 New York', 41);
insert into account values('zshysqlcd', 'Micheal Hamilton', 'yy@eaj.com', '4674 W 80 Atlanta', 17);
insert into account values('qbdkslqas', 'Lance Swift', 'hnmc@x.com', '3531 W 42 New York', 49);
insert into account values('pfzacvvjk', 'Vasper Swift', 'yxf@xj.com', '4957 N 32 Atlanta', 50);
insert into account values('squsupalb', 'Sebastian Zhou', 'ytt@rh.com', '2260 N 30 San Diego', 51);
insert into account values('tehtkewak', 'John Massi', 'jum@dg.com', '3174 E 42 New York', 31);
insert into account values('pjnbmappm', 'Micheal Stroll', 'ed@vnp.com', '1814 N 50 New York', 14);
insert into account values('nkhtskupb', 'Jack Swift', 'rhx@xg.com', '3950 S 41 San Diego', 37);
insert into account values('ctispuwbl', 'Vasper Ratum', 'eq@jdt.com', '1128 W 92 New Mexico', 50);
insert into account values('ocvumladl', 'Lewis Ratum', 'dcrz@p.com', '679 S 22 San Diego', 17);
-- finish insert data into account table

insert into channel values('Taylor_here','adutiaudn','2013-06-07');
insert into channel values('Taylor_trailer','adutiaudn','2013-06-29');
insert into channel values('IamnotTaylor','aosdigapsq','2013-06-07');
-- finish insert data into channel table


insert into video values('https://www.youtube.com/rl8w1kg759', 'bhyienohquosvtjb', 796, 'hfzoxrqtxqaqsolnycbhwfcctavbuwhvathwux', 688);
insert into video values('https://www.youtube.com/3jyt50mwpd', 'liboropqhcrxcoel', 137, 'zlcjhsyzriacrjlbhquvsgpzgfzyjaoshmhjzv', 1715);
insert into video values('https://www.youtube.com/zu2afryi6h', 'ysbumeqdksaxcjpe', 375, 'wzglirrfaccigurvnejnjhjndckxyxhscjxrjz', 5161);
insert into video values('https://www.youtube.com/jf0kim973q', 'crvizneqijplehrg', 99, 'yzipdgxipzqzsgohemwfvjqshpdpfjuyttdgmn', 1242);


-- finish insert data into video table
insert into video_his values('https://www.youtube.com/rl8w1kg759', 'pybktsmgc');
insert into video_his values('https://www.youtube.com/rl8w1kg759', 'aosdigapsq');
insert into video_his values('https://www.youtube.com/zu2afryi6h', 'zshysqlcd');
insert into video_his values('https://www.youtube.com/3jyt50mwpd', 'ocvumladl');
insert into video_his values('https://www.youtube.com/jf0kim973q', 'hqtvzzvks');
insert into video_his values('https://www.youtube.com/3jyt50mwpd', 'vggwuzewh');
insert into video_his values('https://www.youtube.com/rl8w1kg759', 'adutiaudn');
insert into video_his values('https://www.youtube.com/3jyt50mwpd', 'zshysqlcd');
insert into video_his values('https://www.youtube.com/3jyt50mwpd', 'adutiaudn');
insert into video_his values('https://www.youtube.com/zu2afryi6h', 'pybktsmgc');
insert into video_his values('https://www.youtube.com/3jyt50mwpd', 'pybktsmgc');
insert into video_his values('https://www.youtube.com/zu2afryi6h', 'pfzacvvjk');
insert into video_his values('https://www.youtube.com/3jyt50mwpd', 'tehtkewak');
insert into video_his values('https://www.youtube.com/rl8w1kg759', 'squsupalb');
insert into video_his values('https://www.youtube.com/jf0kim973q', 'nkhtskupb');
insert into video_his values('https://www.youtube.com/zu2afryi6h', 'tehtkewak');
insert into video_his values('https://www.youtube.com/jf0kim973q', 'aosdigapsq');
insert into video_his values('https://www.youtube.com/jf0kim973q', 'cewoohjvk');
insert into video_his values('https://www.youtube.com/rl8w1kg759', 'vprxkaadp');
insert into video_his values('https://www.youtube.com/zu2afryi6h', 'squsupalb');
insert into video_his values('https://www.youtube.com/jf0kim973q', 'pybktsmgc');
insert into video_his values('https://www.youtube.com/3jyt50mwpd', 'pfzacvvjk');
insert into video_his values('https://www.youtube.com/rl8w1kg759', 'vggwuzewh');
insert into video_his values('https://www.youtube.com/rl8w1kg759', 'tehtkewak');
insert into video_his values('https://www.youtube.com/rl8w1kg759', 'hqtvzzvks');
insert into video_his values('https://www.youtube.com/3jyt50mwpd', 'cewoohjvk')


----------------finish inserting data into video_his

insert into statitics values('https://www.youtube.com/rl8w1kg759',3,1,8,2,6);
insert into statitics values('https://www.youtube.com/3jyt50mwpd', 4,1,8,3,6);
insert into statitics values('https://www.youtube.com/zu2afryi6h',3,2,5,4,3);
insert into statitics values('https://www.youtube.com/jf0kim973q',1,1,5,4,3);

-----finish inserting data into statitics


insert into upload_request values('adutiaudn','Taylor_here','https://www.youtube.com/rl8w1kg759','2022-10-03');
insert into upload_request values('adutiaudn','Taylor_here','https://www.youtube.com/3jyt50mwpd', '2021-09-07');
insert into upload_request values('adutiaudn','Taylor_trailer','https://www.youtube.com/zu2afryi6h','2020-10-09');
insert into upload_request values('aosdigapsq','IamnotTaylor','https://www.youtube.com/jf0kim973q','2019-09-08');

--finish inserting data into request

------------------------------------finish inserting data------------------------------------------------


select video.video_title,min(account.age) as min_age,max(account.age) as max_age
from account,video,video_his,statitics,upload_request
where video.video_url=video_his.video_url and -- join video and video_his table, video_his table stores video url and who watched the video, using (url,viewer_id)
      video_his.viewer_id=account.owner_user_id and-- join video_his and account, using the viewer_id in video_his to track the viewer's account to get his/her age
      upload_request.video_url=video.video_url and -- join video_his and upload_request
      upload_request.owner_user_id='adutiaudn' and-- make sure the video is uploaded by the REAL Taylor Swift with user_id to identify
      statitics.video_url=video.video_url--join video and statitics to get the number of comments on each video

group by video.video_title,statitics.num_com

having statitics.num_com=(select max(num_com)-- this is to get the maxmimum num_com i.e. the number of comment on a video
       from (select stat.num_com as num_com,video.video_title --the inner select is meant to get the number of comments on each video created by Taylor Swift, here I use user_id to identify.
              from statitics stat,video,upload_request
              where upload_request.owner_user_id='adutiaudn' and -- make sure the creator of the video is Taylor Swift, here I use user_id to identify her as someone may have the same name as Taylor Swift 
              stat.video_url=video.video_url and -- this is to join stat and video 
              video.video_url=upload_request.video_url) as s1)-- this is to join video and upload request table




