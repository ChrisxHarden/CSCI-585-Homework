-- I am using bit.io for this question
----please make sure starting with a new database or delete all exsiting tables before running this SQL code
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

insert into video values('https://www.youtube.com/qx05z3gjls', 'kblckqcclxazwt', 1500, 'xbpbcrmjizdztdworxbtiacfaasngoysfmk', 3820);
insert into video values('https://www.youtube.com/q9tenmrd61', 'gyzysiovnpgcjh', 287, 'ypnrrexiuhjtnvdkytupmozhxmpncjogfzu', 3035);
insert into video values('https://www.youtube.com/dwrh1m62l8', 'nnynryermxbnqr', 255, 'zurkeihojlhrgqshstiagfvebsdwmktkqcc', 4178);
insert into video values('https://www.youtube.com/c1ls24krzo', 'ehpuigysyjwlbk', 1813, 'nkyojvktjhcnmkicyjcchygzjuqkkcutdvu', 3320);
insert into video values('https://www.youtube.com/m23x4qjv6e', 'piuxxuqihceory', 419, 'wggkldieksvjddtzjsskqfgmkdavxlfgkcp', 4593);
insert into video values('https://www.youtube.com/g3ra9zx5om', 'qabwqtvrmddyeu', 1758, 'xmlbfjgkyayzztldxlywbhbngfwtbgbmeou', 1384);
insert into video values('https://www.youtube.com/6fb41teua9', 'vkrekxotbovmzd', 949, 'pmcopkybrosgobcgbaxcwkuexqftnoshlqq', 5681);
insert into video values('https://www.youtube.com/jk06rhas32', 'ffyajdpkggumib', 1801, 'jmghvyinzhcrlqhdayronfdlorbvuhjzcfr', 4643);
insert into video values('https://www.youtube.com/aglc3jbdxp', 'vbjksazubzjkrx', 1161, 'prsfqwwpqqgtikhmjfataesfvvspgciswfg', 3546);
insert into video values('https://www.youtube.com/tjg4lwa6fy', 'wnhmrsytzvdmsg', 813, 'xppddrdryildiknkfzndsdvockyrcukiryi', 5103);

--insert data into video
    
insert into statitics values('https://www.youtube.com/qx05z3gjls', 752, 14, 8142, 137, 175);
insert into statitics values('https://www.youtube.com/q9tenmrd61', 255, 30, 6893, 95, 37);
insert into statitics values('https://www.youtube.com/dwrh1m62l8', 681, 37, 5679, 7, 117);
insert into statitics values('https://www.youtube.com/c1ls24krzo', 840, 84, 3746, 56, 155);
insert into statitics values('https://www.youtube.com/m23x4qjv6e', 176, 40, 1428, 83, 76);
insert into statitics values('https://www.youtube.com/g3ra9zx5om', 450, 19, 1882, 185, 74);
insert into statitics values('https://www.youtube.com/6fb41teua9', 188, 73, 8799, 126, 74);
insert into statitics values('https://www.youtube.com/jk06rhas32', 480, 10, 1805, 136, 64);
insert into statitics values('https://www.youtube.com/aglc3jbdxp', 737, 20, 2612, 43, 115);
insert into statitics values('https://www.youtube.com/tjg4lwa6fy', 340, 68, 3038, 70, 141);
--insert data into statics

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
--insert data into accounts
insert into channel values(
    'MarvelEntertainmentclub',
    'dsapdfoiasdfh',
    '2013-02-27'

);

insert into channel values(
    'Marvelnews',
    'pqoweifgoiadj',
    '2014-02-27'

);
insert into channel values(
    'ironmanclip',
    'dsapdfoiasdfh',
    '2013-04-27'

);

insert into channel values(
    'MarvelEntertainment_club',
    'apsdoigjapsod',
    '2017-02-27'

);
--insert data into channel

insert into upload_request values('dsapdfoiasdfh','MarvelEntertainmentclub','https://www.youtube.com/qx05z3gjls','2021-10-18');
insert into upload_request values('dsapdfoiasdfh','MarvelEntertainmentclub','https://www.youtube.com/q9tenmrd61', '2021-09-12');
insert into upload_request values('dsapdfoiasdfh','MarvelEntertainmentclub','https://www.youtube.com/dwrh1m62l8', '2020-06-18');
insert into upload_request values('dsapdfoiasdfh','ironmanclip','https://www.youtube.com/c1ls24krzo', '2022-10-18');
insert into upload_request values('dsapdfoiasdfh','ironmanclip','https://www.youtube.com/m23x4qjv6e', '2018-9-21');
insert into upload_request values('pqoweifgoiadj','Marvelnews','https://www.youtube.com/g3ra9zx5om', '2021-4-17');
insert into upload_request values('pqoweifgoiadj','Marvelnews','https://www.youtube.com/6fb41teua9', '2019-02-10');
insert into upload_request values('apsdoigjapsod','MarvelEntertainment_club','https://www.youtube.com/jk06rhas32', '2022-10-18');
insert into upload_request values('apsdoigjapsod','MarvelEntertainment_club','https://www.youtube.com/aglc3jbdxp', '2021-09-08');
insert into upload_request values('apsdoigjapsod','MarvelEntertainment_club','https://www.youtube.com/tjg4lwa6fy', '2021-08-07');
--insert data into upload_request


--finish inserting data


select s1.views*1.0/s1.likes*1.0 as ratio , --to ensure the result to be float
s1.channel_name,
s1.video_title
from (--use the inner select to select those videos created by users with 'Marvel Entertainment' in their name and their likes and views for further calculation
     select statitics.views,statitics.likes,request.channel_name, video.video_title
     from upload_request request, account,video,statitics
     where request.owner_user_id=account.owner_user_id and --join upload_request and account with user_id
            account.owner_name like '%Marvel Entertainment%' and -- make sure only the accounts' user_name with 'Marvel Entertainment' are chosen
            request.video_url=video.video_url and -- join upload_request and video
            video.video_url=statitics.video_url--join video and statics
     order by video.video_title) as s1 
