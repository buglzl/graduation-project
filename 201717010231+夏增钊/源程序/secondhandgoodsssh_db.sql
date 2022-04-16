/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.7.20 : Database - secondhandgoodsssh_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`secondhandgoodsssh_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `about` */

DROP TABLE IF EXISTS `about`;

CREATE TABLE `about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lxr` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `about` */

insert  into `about`(`id`,`lxr`,`tel`,`addr`,`note`) values (1,'李先生','13566667777','光谷大道999号','<span style=\"color:#333333;font-family:\" font-size:14px;background-color:#ffffff;\"=\"\"><span style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">加一元可以购买指定的商品，也是一个不错的促销手段，通过超低的价格来吸引，但是活动的前提应该定好，比如满多少加一元就可以买一斤鸡蛋或者其他商品等等。</span><span style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">加一元可以购买指定的商品，也是一个不错的促销手段，通过超低的价格来吸引，但是活动的前提应该定好，比如满多少加一元就可以买一斤鸡蛋或者其他商品等等。</span></span>');

/*Table structure for table `addr` */

DROP TABLE IF EXISTS `addr`;

CREATE TABLE `addr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shr` varchar(255) DEFAULT NULL,
  `shrtel` varchar(255) DEFAULT NULL,
  `shraddr` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `addr` */

/*Table structure for table `car` */

DROP TABLE IF EXISTS `car`;

CREATE TABLE `car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` varchar(255) DEFAULT NULL,
  `mid` varchar(255) DEFAULT NULL,
  `sl` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `car` */

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg` text,
  `hfmsg` text,
  `savetime` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `chat` */

insert  into `chat`(`id`,`msg`,`hfmsg`,`savetime`,`memberid`) values (2,'123','','2021-02-28 15:29:10','25');

/*Table structure for table `dddetail` */

DROP TABLE IF EXISTS `dddetail`;

CREATE TABLE `dddetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ddno` varchar(255) DEFAULT NULL,
  `goodno` varchar(255) DEFAULT NULL,
  `goodid` varchar(255) DEFAULT NULL,
  `sl` int(11) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `fhstatus` varchar(255) DEFAULT NULL,
  `fkstatus` varchar(255) DEFAULT NULL,
  `shstatus` varchar(255) DEFAULT NULL,
  `zffs` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `ckstatus` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `dddetail` */

insert  into `dddetail`(`id`,`ddno`,`goodno`,`goodid`,`sl`,`total`,`fhstatus`,`fkstatus`,`shstatus`,`zffs`,`savetime`,`ckstatus`,`delstatus`) values (19,'0228032626','2021022802044593','22',1,'346.0','已发货','已付款','已收货','货到付款','2021-02-28','old','0');

/*Table structure for table `ddinfo` */

DROP TABLE IF EXISTS `ddinfo`;

CREATE TABLE `ddinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ddno` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  `ddprice` varchar(255) DEFAULT NULL,
  `fhstatus` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `shstatus` varchar(255) DEFAULT NULL,
  `wlinfo` varchar(255) DEFAULT NULL,
  `fkstatus` varchar(255) DEFAULT NULL,
  `shrname` varchar(255) DEFAULT NULL,
  `shrtel` varchar(255) DEFAULT NULL,
  `shraddr` varchar(255) DEFAULT NULL,
  `thstatus` varchar(255) DEFAULT NULL,
  `zffs` varchar(255) DEFAULT NULL,
  `saverid` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `ddinfo` */

insert  into `ddinfo`(`id`,`ddno`,`memberid`,`ddprice`,`fhstatus`,`savetime`,`shstatus`,`wlinfo`,`fkstatus`,`shrname`,`shrtel`,`shraddr`,`thstatus`,`zffs`,`saverid`,`delstatus`) values (26,'0228032626','25','346.0','待发货','2021-02-28 15:26:26','待收货',NULL,'待付款','真实','13800138000','1号店',NULL,'货到付款',NULL,'0');

/*Table structure for table `fav` */

DROP TABLE IF EXISTS `fav`;

CREATE TABLE `fav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodid` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `fav` */

/*Table structure for table `gamebm` */

DROP TABLE IF EXISTS `gamebm`;

CREATE TABLE `gamebm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(255) DEFAULT NULL,
  `bsid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `gamebm` */

/*Table structure for table `games` */

DROP TABLE IF EXISTS `games`;

CREATE TABLE `games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `bstime` varchar(255) DEFAULT NULL,
  `note` text,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `games` */

insert  into `games`(`id`,`title`,`bstime`,`note`,`savetime`) values (1,'明天有新品上架',NULL,'<span style=\"color:#333333;font-family:\" font-size:16px;background-color:#ffffff;\"=\"\">满减是超市最常用的一种促销手段，为了提高超市的整理销量，吸引客户前来消费，满减活动也是非常吸引人的，但是在做满减活动之前，一定要想好什么样的物品适合做，怎么样才不至于亏损还保有盈利的空间。</span>','2021-02-28 15:05:11');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodno` varchar(255) DEFAULT NULL,
  `goodname` varchar(255) DEFAULT NULL,
  `fid` varchar(255) DEFAULT NULL,
  `sid` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `note` text,
  `saver` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `shstatus` varchar(255) DEFAULT NULL,
  `istj` varchar(255) DEFAULT NULL,
  `fhfs` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `salestatus` varchar(255) DEFAULT NULL,
  `goodpp` varchar(255) DEFAULT NULL,
  `cs` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`id`,`goodno`,`goodname`,`fid`,`sid`,`price`,`note`,`saver`,`savetime`,`shstatus`,`istj`,`fhfs`,`filename`,`delstatus`,`salestatus`,`goodpp`,`cs`) values (17,'0228012041','三星 Galaxy Note12','81','82','2899','<img src=\"/secondhandgoodsssh/attached/image/20180228/20180228132037_155.gif\" alt=\"\" />','16','2021-02-28 15:05:30','通过','yes','当面交易','0228012041.jpg','0',NULL,'21',22);
insert  into `goods`(`id`,`goodno`,`goodname`,`fid`,`sid`,`price`,`note`,`saver`,`savetime`,`shstatus`,`istj`,`fhfs`,`filename`,`delstatus`,`salestatus`,`goodpp`,`cs`) values (18,'0228012314','Apple iPhone 11','81','82','7980','<img src=\"/secondhandgoodsssh/attached/image/20180228/20180228132247_13.jpg\" alt=\"\" />','16','2021-02-28 15:05:30','通过','yes','快递','0228012314.jpg','0',NULL,'22',14);
insert  into `goods`(`id`,`goodno`,`goodname`,`fid`,`sid`,`price`,`note`,`saver`,`savetime`,`shstatus`,`istj`,`fhfs`,`filename`,`delstatus`,`salestatus`,`goodpp`,`cs`) values (19,'0228012510','ThinkPad','81','83','3899','<img src=\"/secondhandgoodsssh/attached/image/20180228/20180228132507_916.jpg\" alt=\"\" />','16','2021-02-28 15:05:30','通过','yes','当面交易','0228012510.jpg','0',NULL,'23',3);
insert  into `goods`(`id`,`goodno`,`goodname`,`fid`,`sid`,`price`,`note`,`saver`,`savetime`,`shstatus`,`istj`,`fhfs`,`filename`,`delstatus`,`salestatus`,`goodpp`,`cs`) values (20,'0228012845','移动电源','81','84','345','商品名称：小米小米(MI)移动电源2C 20000毫安 移动电源2/大容量充电宝 双USB输出 双向快充 聚合物 适用于平板/手机等商品编号：5054737商品毛重：420.00g商品产地：中国大陆外壳材质：其他功能：超轻薄，双向快充容量：20000mAh及以上电芯类型：锂聚合物电池','16','2021-02-28 15:05:30','通过','yes','快递','0228012845.jpg','0',NULL,'24',5);
insert  into `goods`(`id`,`goodno`,`goodname`,`fid`,`sid`,`price`,`note`,`saver`,`savetime`,`shstatus`,`istj`,`fhfs`,`filename`,`delstatus`,`salestatus`,`goodpp`,`cs`) values (21,'0228013046','单反相机','81','85','5899','<img src=\"/secondhandgoodsssh/attached/image/20180228/20180228133042_310.jpg\" alt=\"\" />','21','2021-02-28 15:05:30','通过','yes','快递','0228013046.jpg','0',NULL,'26',8);
insert  into `goods`(`id`,`goodno`,`goodname`,`fid`,`sid`,`price`,`note`,`saver`,`savetime`,`shstatus`,`istj`,`fhfs`,`filename`,`delstatus`,`salestatus`,`goodpp`,`cs`) values (22,'0228013250','假面山庄','80','86','346','<img src=\"/secondhandgoodsssh/attached/image/20180228/20180228133247_67.jpg\" alt=\"\" />','21','2021-02-28 15:05:30','通过','yes','当面交易','0228013250.jpg','0',NULL,'28',10);
insert  into `goods`(`id`,`goodno`,`goodname`,`fid`,`sid`,`price`,`note`,`saver`,`savetime`,`shstatus`,`istj`,`fhfs`,`filename`,`delstatus`,`salestatus`,`goodpp`,`cs`) values (23,'0228013809','穿梭之旅1','80','87','120','<img src=\"/secondhandgoodsssh/attached/image/20180228/20180228133803_960.jpg\" alt=\"\" />','21','2021-02-28 15:05:30','通过','yes','快递','0228013809.jpg','0',NULL,'28',13);
insert  into `goods`(`id`,`goodno`,`goodname`,`fid`,`sid`,`price`,`note`,`saver`,`savetime`,`shstatus`,`istj`,`fhfs`,`filename`,`delstatus`,`salestatus`,`goodpp`,`cs`) values (25,'0317095635','全面屏双摄拍照手机','81','82','1999','<img src=\"/secondhandgoodsssh/attached/image/20180317/20180317215632_605.jpg\" alt=\"\" />','22','2021-02-28 15:05:30','通过','yes','当面交易','0331110641.jpg','0',NULL,'24',17);
insert  into `goods`(`id`,`goodno`,`goodname`,`fid`,`sid`,`price`,`note`,`saver`,`savetime`,`shstatus`,`istj`,`fhfs`,`filename`,`delstatus`,`salestatus`,`goodpp`,`cs`) values (28,'0228032828','玩具手机','81','82','100','假装是手机','25','2021-02-28 15:28:28','通过','no','快递','0228032828.jpg','0',NULL,'21',0);

/*Table structure for table `imgadv` */

DROP TABLE IF EXISTS `imgadv`;

CREATE TABLE `imgadv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `imgadv` */

insert  into `imgadv`(`id`,`filename`) values (2,'1113072305.jpg');
insert  into `imgadv`(`id`,`filename`) values (3,'0228015223.gif');

/*Table structure for table `kcrecord` */

DROP TABLE IF EXISTS `kcrecord`;

CREATE TABLE `kcrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` varchar(255) DEFAULT NULL,
  `happennum` int(20) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

/*Data for the table `kcrecord` */

insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (48,'20',100,'in','2021-02-28 15:06:01','16');
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (49,'19',100,'in','2021-02-28 15:06:01','16');
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (50,'18',100,'in','2021-02-28 15:06:01','16');
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (51,'17',100,'in','2021-02-28 15:06:01','16');
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (52,'23',100,'in','2021-02-28 15:06:01','21');
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (53,'22',100,'in','2021-02-28 15:06:01','21');
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (54,'21',100,'in','2021-02-28 15:06:01','21');
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (62,'25',100,'in','2021-02-28 15:06:01','22');
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (63,'25',1,'out','2021-02-28 15:06:01',NULL);
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (64,'25',2,'out','2021-02-28 15:06:01',NULL);
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (65,'17',1,'out','2021-02-28 15:06:01',NULL);
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (66,'17',1,'out','2021-02-28 15:06:01',NULL);
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (67,'20',1,'out','2021-02-28 15:06:01',NULL);
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (68,'25',1,'out','2021-02-28 15:06:01',NULL);
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (69,'18',2,'out','2021-02-28 15:06:01',NULL);
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (70,'23',1,'out','2021-02-28 15:06:01',NULL);
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (71,'26',100,'in','2021-02-28 15:06:01','21');
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (72,'25',1,'out','2021-02-28 15:06:01',NULL);
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (73,'19',1,'out','2021-02-28 15:06:01',NULL);
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (74,'27',1,'in','2021-02-28 15:06:01','24');
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (75,'27',1,'out','2021-02-28 15:06:01',NULL);
insert  into `kcrecord`(`id`,`gid`,`happennum`,`type`,`savetime`,`flag`) values (76,'22',1,'out','2021-02-28 15:27:02',NULL);

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `upass` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `sheng` varchar(255) DEFAULT NULL,
  `shi` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `yue` varchar(255) DEFAULT NULL,
  `shstatus` varchar(255) DEFAULT NULL,
  `qianming` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`id`,`uname`,`upass`,`email`,`tname`,`sex`,`addr`,`sheng`,`shi`,`qq`,`tel`,`delstatus`,`savetime`,`img`,`yue`,`shstatus`,`qianming`) values (16,'xm','123','calvin@163.com','小明','女','湖北武汉','湖北省','武汉市','250739730','13566667777','0','2021-02-28 15:06:14','0317105741.jpg','10592.0','通过','111111111111');
insert  into `member`(`id`,`uname`,`upass`,`email`,`tname`,`sex`,`addr`,`sheng`,`shi`,`qq`,`tel`,`delstatus`,`savetime`,`img`,`yue`,`shstatus`,`qianming`) values (21,'ssh','123','xiaoming@126.com','孙小华','女','湖北武汉','内蒙古自治区','呼和浩特市','1225272681','13455558887','0','2021-02-28 15:06:14','0208013837.jpg','84655.0','通过','222222222222');
insert  into `member`(`id`,`uname`,`upass`,`email`,`tname`,`sex`,`addr`,`sheng`,`shi`,`qq`,`tel`,`delstatus`,`savetime`,`img`,`yue`,`shstatus`,`qianming`) values (22,'jack','123','test@126.com','jack','男','武汉光谷广场','浙江省','嘉兴市','2576480060','13874628201','0','2021-02-28 15:06:14','0317095345.jpg','0','通过','1111111111111');
insert  into `member`(`id`,`uname`,`upass`,`email`,`tname`,`sex`,`addr`,`sheng`,`shi`,`qq`,`tel`,`delstatus`,`savetime`,`img`,`yue`,`shstatus`,`qianming`) values (23,'test','123','test@126.com','test','男','武汉光谷广场','广东省','东莞市','2576480061','13893784349','0','2021-02-28 15:06:14','0318011735.jpg','0','通过','111111111111111');
insert  into `member`(`id`,`uname`,`upass`,`email`,`tname`,`sex`,`addr`,`sheng`,`shi`,`qq`,`tel`,`delstatus`,`savetime`,`img`,`yue`,`shstatus`,`qianming`) values (24,'huiyuan','123','huiyuan@qq.com','huiyuan','男','北京','北京市','北京市市辖区','7895486589','13888888888','0','2021-02-28 15:06:14','0331111300.jpg','6201.0','通过','会员');
insert  into `member`(`id`,`uname`,`upass`,`email`,`tname`,`sex`,`addr`,`sheng`,`shi`,`qq`,`tel`,`delstatus`,`savetime`,`img`,`yue`,`shstatus`,`qianming`) values (25,'user','123','123@139.com','真实','男','1号店','北京市','北京市市辖区','123','13800138000','0','2021-02-28 15:24:16','0228032416.jpg','654.0','通过','123');

/*Table structure for table `pj` */

DROP TABLE IF EXISTS `pj`;

CREATE TABLE `pj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodid` varchar(255) DEFAULT NULL,
  `goodsaver` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  `jb` varchar(255) DEFAULT NULL,
  `msg` text,
  `savetime` varchar(255) DEFAULT NULL,
  `hf` text,
  `ddid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `pj` */

insert  into `pj`(`id`,`goodid`,`goodsaver`,`memberid`,`jb`,`msg`,`savetime`,`hf`,`ddid`) values (1,'19',NULL,'24','5','本子还不错哦','2021-02-28 15:06:27','谢谢合作','17');
insert  into `pj`(`id`,`goodid`,`goodsaver`,`memberid`,`jb`,`msg`,`savetime`,`hf`,`ddid`) values (2,'22',NULL,'25','5','不错不粗','2021-02-28 15:27:33','','19');

/*Table structure for table `ppinfo` */

DROP TABLE IF EXISTS `ppinfo`;

CREATE TABLE `ppinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ppname` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `ppinfo` */

insert  into `ppinfo`(`id`,`ppname`,`delstatus`) values (21,'三星','0');
insert  into `ppinfo`(`id`,`ppname`,`delstatus`) values (22,'苹果','0');
insert  into `ppinfo`(`id`,`ppname`,`delstatus`) values (23,'联想','0');
insert  into `ppinfo`(`id`,`ppname`,`delstatus`) values (24,'华为','0');
insert  into `ppinfo`(`id`,`ppname`,`delstatus`) values (25,'戴尔','0');
insert  into `ppinfo`(`id`,`ppname`,`delstatus`) values (26,'佳能','0');
insert  into `ppinfo`(`id`,`ppname`,`delstatus`) values (28,'文艺出版社','0');

/*Table structure for table `protype` */

DROP TABLE IF EXISTS `protype`;

CREATE TABLE `protype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(255) DEFAULT NULL,
  `fatherid` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

/*Data for the table `protype` */

insert  into `protype`(`id`,`typename`,`fatherid`,`delstatus`) values (80,'书籍资料','0','0');
insert  into `protype`(`id`,`typename`,`fatherid`,`delstatus`) values (81,'电子产品','0','0');
insert  into `protype`(`id`,`typename`,`fatherid`,`delstatus`) values (82,'手机','81','0');
insert  into `protype`(`id`,`typename`,`fatherid`,`delstatus`) values (83,'电脑','81','0');
insert  into `protype`(`id`,`typename`,`fatherid`,`delstatus`) values (84,'充电宝','81','0');
insert  into `protype`(`id`,`typename`,`fatherid`,`delstatus`) values (85,'相机','81','0');
insert  into `protype`(`id`,`typename`,`fatherid`,`delstatus`) values (86,'课程书籍','80','0');
insert  into `protype`(`id`,`typename`,`fatherid`,`delstatus`) values (87,'学习资料','80','0');
insert  into `protype`(`id`,`typename`,`fatherid`,`delstatus`) values (88,'测试大类','0','1');
insert  into `protype`(`id`,`typename`,`fatherid`,`delstatus`) values (89,'测试小类','88','1');
insert  into `protype`(`id`,`typename`,`fatherid`,`delstatus`) values (90,'杂志','80','0');

/*Table structure for table `qiugou` */

DROP TABLE IF EXISTS `qiugou`;

CREATE TABLE `qiugou` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL,
  `content` text,
  `savetime` varchar(255) DEFAULT NULL,
  `memberid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qiugou` */

/*Table structure for table `siteinfo` */

DROP TABLE IF EXISTS `siteinfo`;

CREATE TABLE `siteinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logoimg` varchar(255) DEFAULT NULL,
  `sitenamefont` varchar(255) DEFAULT NULL,
  `sitenameback` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `siteinfo` */

insert  into `siteinfo`(`id`,`logoimg`,`sitenamefont`,`sitenameback`,`tel`,`addr`,`note`) values (1,'null','','','010-88888888','null','null');

/*Table structure for table `sysuser` */

DROP TABLE IF EXISTS `sysuser`;

CREATE TABLE `sysuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usertype` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userpwd` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `delstatus` varchar(255) DEFAULT NULL,
  `savetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `sysuser` */

insert  into `sysuser`(`id`,`usertype`,`username`,`userpwd`,`realname`,`sex`,`idcard`,`tel`,`email`,`addr`,`delstatus`,`savetime`) values (1,'管理员','admin','123','王老大','男','429000199012120000','13667899876','admin@163.com','湖北武汉东湖高新金地格林东郡1-18-2','0','2018-03-16 00:00:00');
insert  into `sysuser`(`id`,`usertype`,`username`,`userpwd`,`realname`,`sex`,`idcard`,`tel`,`email`,`addr`,`delstatus`,`savetime`) values (10,'管理员','root','123','老李','男','429000198810101235','13433335555','jack@163.com','湖北武汉江汉区8号','0','2018-03-16 23:22:25');

/*Table structure for table `yqlink` */

DROP TABLE IF EXISTS `yqlink`;

CREATE TABLE `yqlink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linkname` varchar(255) DEFAULT NULL,
  `linkurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `yqlink` */

insert  into `yqlink`(`id`,`linkname`,`linkurl`) values (2,'新浪','http://www.sina.com');
insert  into `yqlink`(`id`,`linkname`,`linkurl`) values (3,'百度','http://www.baidu.com');
insert  into `yqlink`(`id`,`linkname`,`linkurl`) values (4,'腾讯','http://www.qq.com');
insert  into `yqlink`(`id`,`linkname`,`linkurl`) values (5,'小米','http://www.xiaomi.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
