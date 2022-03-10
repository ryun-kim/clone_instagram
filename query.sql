CREATE TABLE t_user(
   iuser bigINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   email VARCHAR(50) NOT NULL,
   provider VARCHAR(10) NOT NULL DEFAULT 'local',
   pw VARCHAR(100),
   nm VARCHAR(5) NOT NULL,
   cmt VARCHAR(50) DEFAULT '' COMMENT '코멘트',
   mainimg VARCHAR(50),
   regdt DATETIME DEFAULT NOW(),
   UNIQUE(email, provider)
);

CREATE TABLE t_feed(
   ifeed BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   location VARCHAR(20),
   ctnt TEXT,
   iuser BIGINT UNSIGNED NOT NULL,
   regdt DATETIME DEFAULT NOW(),
   FOREIGN KEY (iuser) REFERENCES t_user(iuser)
);

CREATE TABLE t_feed_img(
   ifeed BIGINT UNSIGNED NOT NULL,
   img VARCHAR(50) NOT NULL,
   PRIMARY KEY(ifeed, img),
   FOREIGN KEY (ifeed) REFERENCES t_feed(ifeed)
);

CREATE TABLE t_feed_cmt(
   icmt BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
   ifeed BIGINT UNSIGNED NOT NULL,
   iuser BIGINT UNSIGNED NOT NULL,
   cmt VARCHAR(200) NOT NULL,
   regdt DATETIME DEFAULT NOW(),
   FOREIGN KEY (ifeed) REFERENCES t_feed(ifeed),
   FOREIGN KEY (iuser) REFERENCES t_user(iuser)
);

CREATE TABLE t_feed_fav(
   ifeed BIGINT UNSIGNED,
   iuser BIGINT UNSIGNED,
   regdt DATETIME DEFAULT NOW(),
   PRIMARY KEY(ifeed, iuser),
   FOREIGN KEY (ifeed) REFERENCES t_feed(ifeed),
   FOREIGN KEY (iuser) REFERENCES t_user(iuser)
);