-- I am using bit.io for this question
create table sponsor(
    Sponsor_id varchar not null unique,
    
    Name varchar ,
    Phone varchar ,
    Address varchar,

    primary key (Sponsor_id)
);
create table sponsor_detail(
    Sponsor_id varchar not null,
    Video_url varchar not null,
    Sponsor_amount numeric(20,2) not null,
    primary key (Sponsor_id,Video_url),
    foreign key (Sponsor_id) references sponsor on update cascade
);

insert into sponsor values('ufxmdtsrhzy', 'Dom Hamilton', '143870629', '3023 S 17 Atlanta');
insert into sponsor values('fmsgnqzuxvi', 'Damian Verstappen', '029754861', '4020 S 62 Atlanta');
insert into sponsor values('hljdniapruc', 'Micheal Vettel', '846023715', '241 S 95 New York');
insert into sponsor values('xbyvtfgpjqe', 'Pierre Paul', '205149863', '2274 E 93 Los Angeles');
insert into sponsor values('nwxfesogyql', 'Vasper Hamilton', '621508793', '235 S 5 San Diego');


insert into sponsor_detail values('ufxmdtsrhzy', 'https://www.youtube.com/hy3xc2ofrq', 2212.87);
insert into sponsor_detail values('fmsgnqzuxvi', 'https://www.youtube.com/t1uevoygjw', 2129.24);
insert into sponsor_detail values('hljdniapruc', 'https://www.youtube.com/lzpo15bxfq', 10665.19);
insert into sponsor_detail values('fmsgnqzuxvi', 'https://www.youtube.com/mj658gi137', 4624.2);
insert into sponsor_detail values('hljdniapruc', 'https://www.youtube.com/vsn52jm1f4', 6128.43);
insert into sponsor_detail values('fmsgnqzuxvi', 'https://www.youtube.com/gc9t7rdnia', 5750.15);
insert into sponsor_detail values('fmsgnqzuxvi', 'https://www.youtube.com/3lt9az8vre', 2997.12);
insert into sponsor_detail values('fmsgnqzuxvi', 'https://www.youtube.com/r0ds9xanqu', 4873.02);
insert into sponsor_detail values('hljdniapruc', 'https://www.youtube.com/h82p0kv74t', 579.29);
insert into sponsor_detail values('xbyvtfgpjqe', 'https://www.youtube.com/auesg492n7', 5525.23);
insert into sponsor_detail values('fmsgnqzuxvi', 'https://www.youtube.com/c1u6sw5bpf', 2176.06);
insert into sponsor_detail values('hljdniapruc', 'https://www.youtube.com/7dvrc24tuo', 11141.61);
insert into sponsor_detail values('xbyvtfgpjqe', 'https://www.youtube.com/qa9wkhog1y', 2853.23);
insert into sponsor_detail values('ufxmdtsrhzy', 'https://www.youtube.com/fh0zni9o2y', 1312.01);
insert into sponsor_detail values('hljdniapruc', 'https://www.youtube.com/lhsqr4n5ig', 8871.38);
insert into sponsor_detail values('hljdniapruc', 'https://www.youtube.com/3voxe6l0sh', 10961.54);
insert into sponsor_detail values('ufxmdtsrhzy', 'https://www.youtube.com/04axqwi3ks', 9707.49);
insert into sponsor_detail values('ufxmdtsrhzy', 'https://www.youtube.com/5nak6dblv7', 12019.67);
insert into sponsor_detail values('nwxfesogyql', 'https://www.youtube.com/29f14m3hnd', 12739.15);
insert into sponsor_detail values('hljdniapruc', 'https://www.youtube.com/50zb8lqyod', 12942.05);

-- end of data creation

select name,phone,sum(sponsor_detail.sponsor_amount)
from sponsor,sponsor_detail
where sponsor.sponsor_id=sponsor_detail.sponsor_id
-- this is to join sponsor table and sponsor_detail table with sponsor_id as the bridge
group by name,phone

having sum(sponsor_detail.sponsor_amount)=(
    select max(total) from(
        select name,phone,sum(sponsor_detail.sponsor_amount) as total
        from sponsor,sponsor_detail
        where sponsor.sponsor_id=sponsor_detail.sponsor_id
        group by name,phone
    )as total_table
)
--this part is to select those sponsors whose sponsor amount is equal to the maximum total sponsor amount
-- the inner select with alias as total_table will return the different sponsor's total sponsor_amount 
;

