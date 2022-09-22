create table IF NOT EXISTS fnl_site (
    id uuid not null primary key,
    id_user uuid not null references "user"(id), -- creator
    create_time timestamp not null,
    -- design
    "name" varchar(255) not null,
    "path" varchar(255) not null,
    "description" varchar(8000) not null,
    public boolean not NULL,
    logo_url varchar(8000) NULL, 
    -- behaviour: wich tape to show by default
    redirect_to uuid NOT NULL, -- which page redirect to    
);

create table IF NOT EXISTS fnl_page (
    id uuid not null primary key,
    id_user uuid not null references "user"(id), -- creator
    id_site uuid not null references fnl_site(id),
    create_time timestamp not null,
    -- behaviour: wich tape to redirect
    "type" int NOT null, -- 0: landing, 1: oto, 2: upgrade, 3: login, 4: seminar
    redirect_to uuid NOT NULL, -- which page redirect to    
    -- landing design
    landing_type int NULL, -- 0: big form, 1: medium right-side form, 2: medium left-side form
    landing_title varchar(50) NULL,
    landing_heading varchar(150) NULL,
    landing_call_to_action varchar(50) NULL,
    landing_ask_for_name boolean NULL,
    landing_ask_for_company boolean NULL,
    landing_ask_for_phone_number boolean NULL,
    -- oto design
    
);

create table IF NOT EXISTS fnl_oto (
    id uuid not null primary key,
    id_user uuid not null references "user"(id), -- creator
    id_site uuid not null references fnl_site(id),
    create_time timestamp not null,	
    -- behaviour: wich tape to redirect
    redirection_type int NOT null, -- 0: landing, 1: oto, 2: upgrade, 3: login, 4: seminar
    redirect_to uuid NOT NULL, -- which page redirect to    
    -- design
    title varchar(50) NOT NULL,
    heading varchar(150) NOT NULL,
	--     
);

create table IF NOT EXISTS fnl_upgrade (
);

create table IF NOT EXISTS fnl_login (
);


/*
create table IF NOT EXISTS cnt_seminar (
    id uuid not null primary key,
    id_user uuid not null references "user"(id), -- creator
    create_time timestamp not null,
    "name" varchar(255) not null,
    "path" varchar(255) not null,
    "description" varchar(8000) not null,
    public boolean not null
);

create table IF NOT EXISTS cnt_version (
    id uuid not null primary key,
    id_user uuid not null references "user"(id), -- creator
    id_seminar uuid not null references cnt_seminar(id),
    create_time timestamp not null,
    "version" integer not null,
    "notes" varchar(8000) not null
);

create table IF NOT EXISTS cnt_section (
    id uuid not null primary key,
    id_user uuid not null references "user"(id), -- creator
    id_seminar uuid not null references cnt_seminar(id),
    create_time timestamp not null,
    "name" varchar(255) not null,
    "description" varchar(8000) not null,
    "type" int not null, -- 0:html, 1:markdown
    "content" text not null,
    premium boolean not null,
    premium_required_product varchar(500) null -- what is the I2P product required - TODO: convert this into a FK when the I2P extension is ready
);

create table IF NOT EXISTS cnt_changelog (
    id uuid not null primary key,
    id_user uuid not null references "user"(id), -- creator
    id_section uuid not null references cnt_section(id),
    create_time timestamp not null,
    "name" varchar(255) not null,
    "description" varchar(8000) not null,
    "type" int not null, -- 0:html, 1:markdown
    "content" text not null,
    premium boolean not null,
    premium_required_product varchar(500) null -- what is the I2P product required - TODO: convert this into a FK when the I2P extension is ready
);

create table IF NOT EXISTS cnt_action (
    id uuid not null primary key,
    id_user uuid not null references "user"(id), -- creator
    id_changelog uuid not null references cnt_changelog(id),
    create_time timestamp not null,
    "type" int not null -- 0:seen, 1:marked as done.
);

alter table cnt_seminar add column if not exists delete_time timestamp null;

alter table cnt_section add column if not exists delete_time timestamp null;

alter table cnt_section add column if not exists premium_blured_screenshot_url varchar(8000) null;

alter table cnt_changelog add column if not exists premium_blured_screenshot_url varchar(8000) null;
*/