/*
Navicat MySQL Data Transfer

Source Server         : baotoustudy
Source Server Version : 50629
Source Host           : 47.92.78.248:3306
Source Database       : db_baotoustudy

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2019-12-04 23:18:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for act_sign
-- ----------------------------
DROP TABLE IF EXISTS `act_sign`;
CREATE TABLE `act_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(64) NOT NULL,
  `act_id` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `parent` varchar(255) DEFAULT NULL,
  `join_time` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `teacher` varchar(255) DEFAULT NULL,
  `organ` varchar(255) DEFAULT NULL,
  `pay_money` double(11,2) DEFAULT '0.00' COMMENT '单位：元',
  `order_code` varchar(255) DEFAULT NULL,
  `pay_status` varchar(255) DEFAULT '0' COMMENT '支付状态(0:未支付 1:已支付)',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of act_sign
-- ----------------------------
INSERT INTO `act_sign` VALUES ('1', 'oS5v5sx7yB4SdrXGomkvFkt6btOY', '101', '孔令晰', '女', '2018年12月25日', '爸爸', '12月8日9:00-10:30', '15101078430', '', '', '36.00', '2018122513101126468', '0', '1545714611', '1545714611', null);

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `img` varchar(1000) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `sort` int(11) DEFAULT '50',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', '234', null, '1', '50', '1549035034', '1549035034', null);

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `teller` varchar(255) DEFAULT NULL,
  `desc_short` varchar(255) DEFAULT NULL,
  `desc_long` text,
  `price` double(11,2) NOT NULL,
  `view_num` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '1',
  `sort` int(11) DEFAULT '50',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '1', '赵说不误', '/static/mobile/img/book.jpg', 'Chris赵', 'Chris赵', '赵说不误是大胡子俱乐部第一个自己做的内容产品，每周二准时和大家见面，讨论一些关于包头有趣的话题。', '<p>赵说不误是大胡子俱乐部第一个自己做的内容产品，每周二准时和大家见面，讨论一些关于包头有趣的话题。.</p>\r\n', '0.00', '50', '1', '50', '1570977318', '1548949124', null);
INSERT INTO `book` VALUES ('2', '1', '包头同学会', '/static/mobile/img/book.jpg', null, null, null, null, '0.00', '3', '1', '50', '1548949124', '1548949124', null);
INSERT INTO `book` VALUES ('3', '2', '应用型学习', '/static/mobile/img/book.jpg', null, null, null, null, '0.00', '2', '1', '50', '1548949124', '1548949124', null);
INSERT INTO `book` VALUES ('4', '2', '名师专讲', '/static/mobile/img/book.jpg', null, null, null, null, '0.00', '0', '1', '50', '1548949124', '1548949124', null);
INSERT INTO `book` VALUES ('5', '3', '科学工厂', '/static/mobile/img/book.jpg', null, null, null, null, '0.00', '6', '1', '50', '1548949124', '1548949124', null);
INSERT INTO `book` VALUES ('6', '3', '有声阅读', '/static/mobile/img/book.jpg', null, null, null, null, '0.00', '0', '1', '50', '1548949124', '1548949124', null);
INSERT INTO `book` VALUES ('7', '0', '1', null, '1', '1', '', '', '1.00', '0', '1', '50', '1549028281', '1549027830', '1549028281');
INSERT INTO `book` VALUES ('8', '0', '1', null, '1', '1', '1', '1', '1.00', '0', '1', '50', '1549028282', '1549027875', '1549028282');
INSERT INTO `book` VALUES ('9', '3', '1', null, '1', '1', '1434534', '1', '1.00', '0', '0', '50', '1549028075', '1549027889', '1549028075');

-- ----------------------------
-- Table structure for book_cat
-- ----------------------------
DROP TABLE IF EXISTS `book_cat`;
CREATE TABLE `book_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '分类名称',
  `status` int(11) DEFAULT '1' COMMENT '状态(0下架 1上架)',
  `sort` int(11) DEFAULT '50' COMMENT '排序(越小越在前)',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of book_cat
-- ----------------------------
INSERT INTO `book_cat` VALUES ('1', '大胡子FM', '1', '1', '1548949124', '1548949124', null);
INSERT INTO `book_cat` VALUES ('2', '校内课程', '1', '2', '1548949766', '1548949766', null);
INSERT INTO `book_cat` VALUES ('3', '校外课程', '1', '3', '1548950295', '1548950295', null);
INSERT INTO `book_cat` VALUES ('6', 'a', '1', '50', '1549025146', '1549025130', '1549025146');
INSERT INTO `book_cat` VALUES ('7', 'b', '1', '50', '1549025147', '1549025137', '1549025147');

-- ----------------------------
-- Table structure for book_section
-- ----------------------------
DROP TABLE IF EXISTS `book_section`;
CREATE TABLE `book_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `is_free` int(11) DEFAULT NULL,
  `audio` varchar(500) DEFAULT NULL,
  `content` longtext,
  `status` int(11) DEFAULT '1',
  `sort` int(11) DEFAULT '50',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of book_section
-- ----------------------------
INSERT INTO `book_section` VALUES ('1', '1', '第一章 在包头如果我是同性恋', '1', 'https://res.wx.qq.com/voice/getvoice?mediaid=MzAxOTQ3OTg4M18yNjUwNTMxNjE3', '对于同性恋这个词我真正的了解是在上大学的时候，我的一位瑞士老师便是女同，现在她和她的女朋友已经定居在澳大利亚，享受着沙滩，海浪的惬意生活。然而对于表面上十分保守安逸的包头城来说，可能同性恋这个词就是反人类的！我记得我的一个学生曾经和我说过：“上帝造人，男人女人，谁说一定是交叉配对的？”当时我很语塞，尽管我也曾受过资本主义洗礼，但对于这样的问题我属实无法回答。但我很笃定的告诉他，如果我是gay，我一定要好好学习，要么出国，要么去gay都，可能那些合法化的国家或是一线城市才能让我有归属感，人以群居，毕竟在这儿，人们是无法接受的……老一辈人还在为子女的婚姻愁苦，哪儿会容他们腾出来一丝丝的脑容量去思考，可能在生物配对这个过程中可以纵向延伸！', '1', '50', null, null, null);
INSERT INTO `book_section` VALUES ('2', '1', '第二章 包头教育不可缺失的中年油腻男', '1', 'https://res.wx.qq.com/voice/getvoice?mediaid=MzAxOTQ3OTg4M18yNjUwNTMxNjYy', '2018年对于我们这一代人，比较特别，无论想得开想不开，我们都狠狠的给自己过了一把整寿！聚会时，你会发现，头发少了一点，肚子圆了一点，唱的歌更加接地气一点，很快我们就被贴上了中年油腻男的标签！闲聊一下，一直以来，中年女性被嫌弃是常态，如“人老珠黄”便是用来形容女性的，而随着女性意识的觉醒，男性的一举一动也受到了审视，在这样的背景下，一些不修边幅、自我感觉良好、好为人师的中年油腻男也受到抨击。这种年龄的鄙视链不仅仅是这个时代的专利，像是我还沉浸在八零后是垮掉的一代、九零后是废掉的一代时，零零后已经开始叫九零后阿姨、大姐，这一句句简单的称呼听起来着实也会很扎心吧！在我眼里正是这样的油腻男，当他们洗干净脸，修修边幅，在与时间做朋友的过程中，夹杂着深厚的素养和底蕴，浑然天成的散发着某种性格特点，反而成就了油腻男的另一种无形的魅力，而油腻两个字反而成为了一种自嘲。\r\n\r\n那你会问：为什么像是包头这样的三线城市不能缺失这样的油腻男呢？', '1', '50', null, null, null);
INSERT INTO `book_section` VALUES ('3', '1', '第三章 在包头说话从来就不便宜', '1', 'https://res.wx.qq.com/voice/getvoice?mediaid=MzAxOTQ3OTg4M18yNjUwNTMxNzAy', '最近总是发现很多事儿是缺乏沟通的，有没有这样的时候，朋友开口借力会因为你的一个迟疑而就此作罢，爱人寻求知心会因为你的一丝倦怠而冷漠，老师会因为你上课走私而训斥，儿女会因为你啰嗦而争辩，父母会因为你不顺从而怒骂，老板会因为你的不赞同而打断……\r\n\r\n总之会用一句，你以为你以为的事情是你以为的吗？来结束对话！交流中我们一味地想要说完我们想说的话，或是听我们想听的，之后便是永无休止的打断，作为旁观者可能看到的仅仅是两个人在菜市场由于香菜能不能便宜这个共同的话题，然后相互争吵，卖菜的说我是10块钱进的不能便宜，而买菜的非说上个月明明10块钱买过，互不相听，毫无意义。而交流说话，总是由两方面组成的，一是说，二就是听，而很多人都忘记了这第二个环节，据统计，一个人在正常语速下可以说240个字左右，但是却可以听超过460个字的语音（一分钟）。\r\n\r\n现如今每个人都在追求所谓的效率性，而我们是否真正的了解叙述者的意图，并不能只靠碎片化的摄取，而是真正的享受当下，真正的融入其中，听对方的全面表达，享受那瞬时的交流过程！像是老人说的听人话吃饱饭一样。', '1', '50', null, null, null);
INSERT INTO `book_section` VALUES ('4', '1', '第四章 在包头逃离很爽，但无用', '1', 'https://res.wx.qq.com/voice/getvoice?mediaid=MzAxOTQ3OTg4M18yNjUwNTMxNzQ2', '和很多的同学朋友聊天，最多的话题可能就是旅游，因为工作原因每年要带队去冬令营和夏令营，那个时候每次发朋友圈，可能都是点赞反馈最多的时候，你会发现一句我们总是挂在嘴边的话：生活不是眼前的苟且，还有诗和远方！\r\n\r\n有一种很消极的说法：旅游就是从自己活腻了的地方去别人活腻的地方。那在包头，这种活腻了的感觉可能会更容易被人放大，然后那种躁动感便会油然而生。', '1', '50', null, null, null);
INSERT INTO `book_section` VALUES ('5', '1', '第五章 滞留包头的“学渣”儿女与生存艰难的留学生', '1', 'https://res.wx.qq.com/voice/getvoice?mediaid=MzAxOTQ3OTg4M18yNjUwNTMxNzgz', '有一天我的一个好朋友给我发了一段文字，她是这么说的“有的孩子天生就有读书的资质，有的孩子没有。没有资质的孩子是来报父母恩的，因为读书特别好的，将来会去美国、英国、加拿大，见面只能靠视频，读书没资质的，等我们老了可以载我们今天去吃牛肉丸、明天载我们去吃铜锅涮，想想也很美好”。正好我也是她提到的没有资质的孩子之一，俗称学渣，意为：不努力学习，快临近期末时才开始突击、临时抱佛脚的学生。人们总说生活艰难，其实在哪儿都难，所以重要的是心，你的内心是如何看待这份艰难，所谓多易必多难，又或者说是最乐不过苦中作乐，最闲不过忙里偷闲吧！', '1', '50', null, null, null);
INSERT INTO `book_section` VALUES ('6', '1', '第六章 在包头无法割舍的公益心', '1', 'https://res.wx.qq.com/voice/getvoice?mediaid=MzAxOTQ3OTg4M18yNjUwNTMxODE1', '首先我要自我膨胀一下，在上周我们成功的举办了包头市首届无线电测向百人跑活动，通过这次公益活动，目的就是为了让孩子们和家长一起活动活动，也通过这样的一件事情来唤醒包头全民健身的意识。\r\n\r\n在闲聊之前我们先来做一个科普，什么是无线电测向？无线电测向是一项风靡全球的科体项目，顾名思义就是科技与体育相结合的活动，又名猎狐行动，手持测向机就像是猎枪，我们去寻找所谓的狐狸这里指电台。说简单，很简单，就是像玩儿捉迷藏游戏一样，运动员忙碌地测听、奔跑，漫山遍野地去搜寻一个个隐蔽的电台。\r\n\r\n由于我们的活动是亲子形式，这两天，我真的是大饱眼福！当然作为老赵我不想去传播负能量，毕竟到达终点的那一瞬间，一切埋怨和不可能，都换成了喜悦与满足！\r\n\r\n一个多次参加我们活动的妈妈和我说，反正回家以后很舒服，舒服到他居然安静的收拾书包，没吵闹早早的就睡了！\r\n\r\n问大家个问题：大家有没有在生活中遇到过熊孩子！一般家长都是很笃定的提出自己之所以像现在这么“熊”全是因为小的时候太多的条条框框，并不像听到的西方教育中所说的释放天性！记得我有一套珍藏多年的小浣熊水浒卡，有一次一个阿姨带着一个弟弟来我家玩儿，很不凑巧地将其翻了出来，凡是80后的人都应该有那段集卡换卡的记忆，也就知道那不仅仅是打大A中的两副扑克牌，我站在他旁边，看着他蹂躏着我的心爱之物，仿佛在践踏着我的童年！结果是108将最后剩下了103人。', '1', '50', null, null, null);
INSERT INTO `book_section` VALUES ('7', '1', '1234', '1', null, '24324', '0', '50', '1549031010', '1549030977', '1549031010');
INSERT INTO `book_section` VALUES ('8', '1', 'test001', '1', 'http://bts.hengha.org/upload/464589232efb75ba/e011208115ed6897.mp3', '<p>测试123123123fdddddddddddddddddddddds</p>\r\n', '1', '50', '1554046639', '1553966546', null);

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `content` text COMMENT '意见反馈内容',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('8', '3', 'Bbbn ', '1546098864', '1546098864', null);
INSERT INTO `feedback` VALUES ('9', '3', 'Vhb摩羯', '1546098875', '1546098875', null);
INSERT INTO `feedback` VALUES ('10', '7', 'yhhh', '1549037014', '1549037014', null);

-- ----------------------------
-- Table structure for punch
-- ----------------------------
DROP TABLE IF EXISTS `punch`;
CREATE TABLE `punch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `credit` int(11) DEFAULT '0' COMMENT '本次签到获得积分',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of punch
-- ----------------------------
INSERT INTO `punch` VALUES ('7', '3', '10', '1546006574', '1546010174', null);
INSERT INTO `punch` VALUES ('8', '3', '10', '1546096574', '1546096574', null);
INSERT INTO `punch` VALUES ('9', '3', '10', '1546100453', '1546100453', null);
INSERT INTO `punch` VALUES ('10', '7', '10', '1547048696', '1547048696', null);
INSERT INTO `punch` VALUES ('11', '3', '10', '1547991108', '1547991108', null);
INSERT INTO `punch` VALUES ('12', '3', '10', '1548000632', '1548000632', null);
INSERT INTO `punch` VALUES ('13', '7', '10', '1549041186', '1549041186', null);
INSERT INTO `punch` VALUES ('14', '7', '10', '1551367534', '1551367534', null);
INSERT INTO `punch` VALUES ('15', '7', '10', '1554043708', '1554043708', null);

-- ----------------------------
-- Table structure for sms
-- ----------------------------
DROP TABLE IF EXISTS `sms`;
CREATE TABLE `sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobilephone` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号码',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '验证码',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '类型',
  `expire` int(11) DEFAULT NULL COMMENT '过期时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态（0.未验证 1.已验证）',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9233 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sms
-- ----------------------------
INSERT INTO `sms` VALUES ('9212', '15361840400', '378609', '', '1545673493', '0', '1545673193', '1545673193', null);
INSERT INTO `sms` VALUES ('9213', '15361840400', '934035', '', '1545673666', '0', '1545673366', '1545673366', null);
INSERT INTO `sms` VALUES ('9214', '15361840400', '239494', '', '1545673691', '0', '1545673391', '1545673391', null);
INSERT INTO `sms` VALUES ('9215', '15361840400', '295894', '', '1545673800', '0', '1545673500', '1545673500', null);
INSERT INTO `sms` VALUES ('9216', '18855535990', '297418', '', '1545673832', '1', '1545673557', '1545673532', null);
INSERT INTO `sms` VALUES ('9217', '15101078430', '161097', '', '1545693885', '1', '1545693611', '1545693585', null);
INSERT INTO `sms` VALUES ('9218', '13848255168', '313454', '', '1545704365', '0', '1545704065', '1545704065', null);
INSERT INTO `sms` VALUES ('9219', '13848224857', '520094', '', '1545704367', '0', '1545704067', '1545704067', null);
INSERT INTO `sms` VALUES ('9220', '13848255168', '291785', '', '1545704435', '0', '1545704135', '1545704135', null);
INSERT INTO `sms` VALUES ('9221', '13848224857', '508522', '', '1545704459', '0', '1545704159', '1545704159', null);
INSERT INTO `sms` VALUES ('9222', '13848255168', '700036', '', '1545704580', '0', '1545704280', '1545704280', null);
INSERT INTO `sms` VALUES ('9223', '13848224857', '793581', '', '1545704663', '1', '1545704390', '1545704363', null);
INSERT INTO `sms` VALUES ('9224', '15652218173', '933710', '', '1545704671', '0', '1545704371', '1545704371', null);
INSERT INTO `sms` VALUES ('9225', '13848255168', '172256', '', '1545704681', '1', '1545704409', '1545704381', null);
INSERT INTO `sms` VALUES ('9226', '15361840400', '273936', '', '1545837358', '1', '1545837080', '1545837058', null);
INSERT INTO `sms` VALUES ('9227', '15947526335', '845369', '', '1546659925', '1', '1546659659', '1546659625', null);
INSERT INTO `sms` VALUES ('9228', '15361840400', '649362', '', '1569169527', '0', '1569169227', '1569169227', null);
INSERT INTO `sms` VALUES ('9229', '15361840400', '319865', '', '1569169574', '0', '1569169274', '1569169274', null);
INSERT INTO `sms` VALUES ('9230', '15361840400', '368337', '', '1569169607', '0', '1569169307', '1569169307', null);
INSERT INTO `sms` VALUES ('9231', '15361840400', '571537', '', '1569169698', '0', '1569169398', '1569169398', null);
INSERT INTO `sms` VALUES ('9232', '15361840400', '611605', '', '1569189743', '1', '1569170184', '1569169443', null);

-- ----------------------------
-- Table structure for system_auth
-- ----------------------------
DROP TABLE IF EXISTS `system_auth`;
CREATE TABLE `system_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '权限名称',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(1:禁用,2:启用)',
  `sort` smallint(6) unsigned DEFAULT '0' COMMENT '排序权重',
  `desc` varchar(255) DEFAULT NULL COMMENT '备注说明',
  `create_by` bigint(11) unsigned DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_auth_title` (`title`) USING BTREE,
  KEY `index_system_auth_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统权限表';

-- ----------------------------
-- Records of system_auth
-- ----------------------------

-- ----------------------------
-- Table structure for system_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `system_auth_node`;
CREATE TABLE `system_auth_node` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth` bigint(20) unsigned DEFAULT NULL COMMENT '角色ID',
  `node` varchar(200) DEFAULT NULL COMMENT '节点路径',
  PRIMARY KEY (`id`),
  KEY `index_system_auth_auth` (`auth`) USING BTREE,
  KEY `index_system_auth_node` (`node`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色与节点绑定';

-- ----------------------------
-- Records of system_auth_node
-- ----------------------------

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '配置编码',
  `value` varchar(500) DEFAULT NULL COMMENT '配置值',
  PRIMARY KEY (`id`),
  KEY `index_system_config_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='系统参数配置';

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES ('1', 'app_name', '包头市学习平台');
INSERT INTO `system_config` VALUES ('2', 'site_name', '包头市学习平台');
INSERT INTO `system_config` VALUES ('3', 'app_version', '1.0');
INSERT INTO `system_config` VALUES ('4', 'site_copy', '©版权所有 2019 包头市学习平台');
INSERT INTO `system_config` VALUES ('5', 'browser_icon', 'http://localhost/ThinkAdmin/static/upload/f47b8fe06e38ae99/08e8398da45583b9.png');
INSERT INTO `system_config` VALUES ('6', 'tongji_baidu_key', '');
INSERT INTO `system_config` VALUES ('7', 'miitbeian', '');
INSERT INTO `system_config` VALUES ('8', 'storage_type', 'local');
INSERT INTO `system_config` VALUES ('9', 'storage_local_exts', 'png,jpg,rar,doc,icon,mp4,mp3');
INSERT INTO `system_config` VALUES ('10', 'storage_qiniu_bucket', '');
INSERT INTO `system_config` VALUES ('11', 'storage_qiniu_domain', '');
INSERT INTO `system_config` VALUES ('12', 'storage_qiniu_access_key', '');
INSERT INTO `system_config` VALUES ('13', 'storage_qiniu_secret_key', '');
INSERT INTO `system_config` VALUES ('14', 'storage_oss_bucket', 'cuci');
INSERT INTO `system_config` VALUES ('15', 'storage_oss_endpoint', 'oss-cn-beijing.aliyuncs.com');
INSERT INTO `system_config` VALUES ('16', 'storage_oss_domain', 'cuci.oss-cn-beijing.aliyuncs.com');
INSERT INTO `system_config` VALUES ('17', 'storage_oss_keyid', '用你自己的吧');
INSERT INTO `system_config` VALUES ('18', 'storage_oss_secret', '用你自己的吧');
INSERT INTO `system_config` VALUES ('34', 'wechat_appid', 'wx60a43dd8161666d4');
INSERT INTO `system_config` VALUES ('35', 'wechat_appkey', '9890a0d7c91801a609d151099e95b61a');
INSERT INTO `system_config` VALUES ('36', 'storage_oss_is_https', 'http');
INSERT INTO `system_config` VALUES ('37', 'wechat_type', 'thr');
INSERT INTO `system_config` VALUES ('38', 'wechat_token', 'test');
INSERT INTO `system_config` VALUES ('39', 'wechat_appsecret', 'a041bec98ed015d52b99acea5c6a16ef');
INSERT INTO `system_config` VALUES ('40', 'wechat_encodingaeskey', 'BJIUzE0gqlWy0GxfPp4J1oPTBmOrNDIGPNav1YFH5Z5');
INSERT INTO `system_config` VALUES ('41', 'wechat_thr_appid', 'wx60a43dd8161666d4');
INSERT INTO `system_config` VALUES ('42', 'wechat_thr_appkey', '05db2aa335382c66ab56d69b1a9ad0ee');

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `node` char(200) NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作行为',
  `content` text NOT NULL COMMENT '操作内容描述',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';

-- ----------------------------
-- Records of system_log
-- ----------------------------
INSERT INTO `system_log` VALUES ('1', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-01-30 22:45:51');
INSERT INTO `system_log` VALUES ('2', '127.0.0.1', 'admin/login/out', 'admin', '系统管理', '用户退出系统成功', '2019-01-30 22:45:59');
INSERT INTO `system_log` VALUES ('3', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-01-30 23:33:56');
INSERT INTO `system_log` VALUES ('4', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-02-01 01:22:45');
INSERT INTO `system_log` VALUES ('5', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-02-01 20:44:54');
INSERT INTO `system_log` VALUES ('6', '14.103.238.130', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-02-02 00:05:04');
INSERT INTO `system_log` VALUES ('7', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-02-02 00:06:54');
INSERT INTO `system_log` VALUES ('8', '123.116.74.114', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-02-02 07:35:05');
INSERT INTO `system_log` VALUES ('9', '127.0.0.1', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-02-03 00:55:34');
INSERT INTO `system_log` VALUES ('10', '223.104.178.87', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-02-03 08:19:07');
INSERT INTO `system_log` VALUES ('11', '43.224.47.96', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-02-12 12:37:12');
INSERT INTO `system_log` VALUES ('12', '111.56.62.41', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-02-23 15:22:38');
INSERT INTO `system_log` VALUES ('13', '220.112.9.134', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-03-01 01:00:11');
INSERT INTO `system_log` VALUES ('14', '110.16.14.174', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-03-08 10:37:18');
INSERT INTO `system_log` VALUES ('15', '110.16.14.174', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-03-08 10:52:42');
INSERT INTO `system_log` VALUES ('16', '101.243.160.29', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-03-08 14:22:36');
INSERT INTO `system_log` VALUES ('17', '101.243.160.29', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-03-12 11:25:25');
INSERT INTO `system_log` VALUES ('18', '14.103.35.44', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-03-25 00:15:52');
INSERT INTO `system_log` VALUES ('19', '101.243.160.29', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-03-25 09:31:11');
INSERT INTO `system_log` VALUES ('20', '14.103.165.233', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-03-31 00:12:29');
INSERT INTO `system_log` VALUES ('21', '14.103.165.233', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-03-31 16:14:01');
INSERT INTO `system_log` VALUES ('22', '14.103.165.233', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-03-31 22:42:43');
INSERT INTO `system_log` VALUES ('23', '110.16.14.174', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-04-17 09:48:32');
INSERT INTO `system_log` VALUES ('24', '220.152.131.63', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-09-09 00:44:35');
INSERT INTO `system_log` VALUES ('25', '223.104.3.254', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-09-09 12:11:03');
INSERT INTO `system_log` VALUES ('26', '220.152.131.63', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-09-11 22:53:51');
INSERT INTO `system_log` VALUES ('27', '101.105.37.165', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-10-13 19:18:23');
INSERT INTO `system_log` VALUES ('28', '114.252.70.195', 'admin/login/index', 'admin', '系统管理', '用户登录系统成功', '2019-12-03 11:42:08');

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `node` varchar(200) NOT NULL DEFAULT '' COMMENT '节点代码',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) NOT NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) unsigned DEFAULT '0' COMMENT '菜单排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_by` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_system_menu_node` (`node`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES ('1', '0', '系统设置', '', '', '#', '', '_self', '9000', '1', '10000', '2018-01-19 15:27:00');
INSERT INTO `system_menu` VALUES ('2', '10', '后台菜单', '', 'fa fa-leaf', 'admin/menu/index', '', '_self', '10', '1', '10000', '2018-01-19 15:27:17');
INSERT INTO `system_menu` VALUES ('3', '10', '系统参数', '', 'fa fa-modx', 'admin/config/index', '', '_self', '20', '1', '10000', '2018-01-19 15:27:57');
INSERT INTO `system_menu` VALUES ('4', '11', '访问授权', '', 'fa fa-group', 'admin/auth/index', '', '_self', '20', '1', '10000', '2018-01-22 11:13:02');
INSERT INTO `system_menu` VALUES ('5', '11', '用户管理', '', 'fa fa-user', 'admin/admin/index', '', '_self', '10', '1', '0', '2018-01-23 12:15:12');
INSERT INTO `system_menu` VALUES ('6', '11', '访问节点', '', 'fa fa-fort-awesome', 'admin/node/index', '', '_self', '30', '1', '0', '2018-01-23 12:36:54');
INSERT INTO `system_menu` VALUES ('7', '0', '后台首页', '', '', 'admin/index/main', '', '_self', '1000', '0', '0', '2018-01-23 13:42:30');
INSERT INTO `system_menu` VALUES ('8', '16', '系统日志', '', 'fa fa-code', 'admin/log/index', '', '_self', '10', '1', '0', '2018-01-24 13:52:58');
INSERT INTO `system_menu` VALUES ('9', '10', '文件存储', '', 'fa fa-stop-circle', 'admin/config/file', '', '_self', '30', '1', '0', '2018-01-25 10:54:28');
INSERT INTO `system_menu` VALUES ('10', '1', '系统管理', '', '', '#', '', '_self', '200', '1', '0', '2018-01-25 18:14:28');
INSERT INTO `system_menu` VALUES ('11', '1', '访问权限', '', '', '#', '', '_self', '300', '1', '0', '2018-01-25 18:15:08');
INSERT INTO `system_menu` VALUES ('16', '1', '日志管理', '', '', '#', '', '_self', '400', '1', '0', '2018-02-10 16:31:15');
INSERT INTO `system_menu` VALUES ('43', '0', '平台管理', '', '', '#', '', '_self', '2000', '1', '0', '2019-01-31 00:06:28');
INSERT INTO `system_menu` VALUES ('44', '43', '图书管理', '', '', '#', '', '_self', '1', '1', '0', '2019-01-31 00:18:26');
INSERT INTO `system_menu` VALUES ('45', '44', '分类管理', '', 'layui-icon layui-icon-template-1', '/admin/book_cat/index', '', '_self', '1', '1', '0', '2019-01-31 00:21:50');
INSERT INTO `system_menu` VALUES ('46', '44', '图书信息', '', 'fa fa-file-text-o', '/admin/book/index', '', '_self', '2', '1', '0', '2019-01-31 00:24:07');
INSERT INTO `system_menu` VALUES ('47', '44', '图书章节', '', 'fa fa-calendar', '/admin/book_section/index', '', '_self', '3', '1', '0', '2019-01-31 00:25:52');
INSERT INTO `system_menu` VALUES ('48', '43', '活动管理', '', '', '#', '', '_self', '2', '1', '0', '2019-01-31 00:34:22');
INSERT INTO `system_menu` VALUES ('49', '48', '活动配置', '', 'layui-icon layui-icon-set', '/admin/act/index', '', '_self', '1', '1', '0', '2019-01-31 00:35:10');
INSERT INTO `system_menu` VALUES ('50', '48', '报名管理', '', 'layui-icon layui-icon-flag', '/admin/act_sign/index', '', '_self', '2', '1', '0', '2019-01-31 00:37:38');
INSERT INTO `system_menu` VALUES ('51', '43', '用户管理', '', '', '#', '', '_self', '3', '1', '0', '2019-01-31 00:38:55');
INSERT INTO `system_menu` VALUES ('52', '51', '用户信息', '', 'layui-icon layui-icon-username', '/admin/user/index', '', '_self', '1', '1', '0', '2019-01-31 00:39:16');
INSERT INTO `system_menu` VALUES ('53', '55', '意见反馈', '', 'fa fa-assistive-listening-systems', '/admin/feedback/index', '', '_self', '2', '1', '0', '2019-01-31 00:41:57');
INSERT INTO `system_menu` VALUES ('54', '51', '签到记录', '', 'layui-icon layui-icon-ok', '/admin/punch/index', '', '_self', '3', '1', '0', '2019-01-31 00:45:02');
INSERT INTO `system_menu` VALUES ('55', '43', '运营管理', '', '', '#', '', '_self', '4', '1', '0', '2019-01-31 00:45:50');
INSERT INTO `system_menu` VALUES ('56', '55', '轮播管理', '', 'layui-icon layui-icon-picture-fine', '/admin/banner/index', '', '_self', '1', '1', '0', '2019-01-31 00:46:29');

-- ----------------------------
-- Table structure for system_node
-- ----------------------------
DROP TABLE IF EXISTS `system_node`;
CREATE TABLE `system_node` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(100) DEFAULT NULL COMMENT '节点代码',
  `title` varchar(500) DEFAULT NULL COMMENT '节点标题',
  `is_menu` tinyint(1) unsigned DEFAULT '0' COMMENT '是否可设置为菜单',
  `is_auth` tinyint(1) unsigned DEFAULT '1' COMMENT '是否启动RBAC权限控制',
  `is_login` tinyint(1) unsigned DEFAULT '1' COMMENT '是否启动登录控制',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `index_system_node_node` (`node`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='系统节点表';

-- ----------------------------
-- Records of system_node
-- ----------------------------
INSERT INTO `system_node` VALUES ('13', 'admin', '系统设置', '0', '1', '1', '2018-05-04 11:02:34');
INSERT INTO `system_node` VALUES ('14', 'admin/auth', '权限管理', '0', '1', '1', '2018-05-04 11:06:55');
INSERT INTO `system_node` VALUES ('15', 'admin/auth/index', '权限列表', '1', '1', '1', '2018-05-04 11:06:56');
INSERT INTO `system_node` VALUES ('16', 'admin/auth/apply', '权限配置', '0', '1', '1', '2018-05-04 11:06:56');
INSERT INTO `system_node` VALUES ('17', 'admin/auth/add', '添加权限', '0', '1', '1', '2018-05-04 11:06:56');
INSERT INTO `system_node` VALUES ('18', 'admin/auth/edit', '编辑权限', '0', '1', '1', '2018-05-04 11:06:56');
INSERT INTO `system_node` VALUES ('19', 'admin/auth/forbid', '禁用权限', '0', '1', '1', '2018-05-04 11:06:56');
INSERT INTO `system_node` VALUES ('20', 'admin/auth/resume', '启用权限', '0', '1', '1', '2018-05-04 11:06:56');
INSERT INTO `system_node` VALUES ('21', 'admin/auth/del', '删除权限', '0', '1', '1', '2018-05-04 11:06:56');
INSERT INTO `system_node` VALUES ('22', 'admin/config', '系统配置', '0', '1', '1', '2018-05-04 11:08:18');
INSERT INTO `system_node` VALUES ('23', 'admin/config/index', '系统参数', '1', '1', '1', '2018-05-04 11:08:25');
INSERT INTO `system_node` VALUES ('24', 'admin/config/file', '文件存储', '1', '1', '1', '2018-05-04 11:08:27');
INSERT INTO `system_node` VALUES ('25', 'admin/log', '日志管理', '0', '1', '1', '2018-05-04 11:08:43');
INSERT INTO `system_node` VALUES ('26', 'admin/log/index', '日志管理', '1', '1', '1', '2018-05-04 11:08:43');
INSERT INTO `system_node` VALUES ('28', 'admin/log/del', '日志删除', '0', '1', '1', '2018-05-04 11:08:43');
INSERT INTO `system_node` VALUES ('29', 'admin/menu', '系统菜单', '0', '1', '1', '2018-05-04 11:09:54');
INSERT INTO `system_node` VALUES ('30', 'admin/menu/index', '菜单列表', '1', '1', '1', '2018-05-04 11:09:54');
INSERT INTO `system_node` VALUES ('31', 'admin/menu/add', '添加菜单', '0', '1', '1', '2018-05-04 11:09:55');
INSERT INTO `system_node` VALUES ('32', 'admin/menu/edit', '编辑菜单', '0', '1', '1', '2018-05-04 11:09:55');
INSERT INTO `system_node` VALUES ('33', 'admin/menu/del', '删除菜单', '0', '1', '1', '2018-05-04 11:09:55');
INSERT INTO `system_node` VALUES ('34', 'admin/menu/forbid', '禁用菜单', '0', '1', '1', '2018-05-04 11:09:55');
INSERT INTO `system_node` VALUES ('35', 'admin/menu/resume', '启用菜单', '0', '1', '1', '2018-05-04 11:09:55');
INSERT INTO `system_node` VALUES ('36', 'admin/node', '节点管理', '0', '1', '1', '2018-05-04 11:10:20');
INSERT INTO `system_node` VALUES ('37', 'admin/node/index', '节点列表', '1', '1', '1', '2018-05-04 11:10:20');
INSERT INTO `system_node` VALUES ('38', 'admin/node/clear', '清理节点', '0', '1', '1', '2018-05-04 11:10:21');
INSERT INTO `system_node` VALUES ('39', 'admin/node/save', '更新节点', '0', '1', '1', '2018-05-04 11:10:21');
INSERT INTO `system_node` VALUES ('40', 'admin/user', '系统用户', '0', '1', '1', '2018-05-04 11:10:43');
INSERT INTO `system_node` VALUES ('41', 'admin/user/index', '用户列表', '1', '1', '1', '2018-05-04 11:10:43');
INSERT INTO `system_node` VALUES ('42', 'admin/user/auth', '用户授权', '0', '1', '1', '2018-05-04 11:10:43');
INSERT INTO `system_node` VALUES ('43', 'admin/user/add', '添加用户', '0', '1', '1', '2018-05-04 11:10:43');
INSERT INTO `system_node` VALUES ('44', 'admin/user/edit', '编辑用户', '0', '1', '1', '2018-05-04 11:10:43');
INSERT INTO `system_node` VALUES ('45', 'admin/user/pass', '修改密码', '0', '1', '1', '2018-05-04 11:10:43');
INSERT INTO `system_node` VALUES ('46', 'admin/user/del', '删除用户', '0', '1', '1', '2018-05-04 11:10:43');
INSERT INTO `system_node` VALUES ('47', 'admin/user/forbid', '禁用启用', '0', '1', '1', '2018-05-04 11:10:43');
INSERT INTO `system_node` VALUES ('48', 'admin/user/resume', '启用用户', '0', '1', '1', '2018-05-04 11:10:44');
INSERT INTO `system_node` VALUES ('100', 'admin/login/index', '用户登录', '0', '0', '0', '2018-05-04 11:10:44');
INSERT INTO `system_node` VALUES ('101', 'admin/login/out', '用户退出', '0', '0', '0', '2018-05-04 11:10:44');

-- ----------------------------
-- Table structure for system_sequence
-- ----------------------------
DROP TABLE IF EXISTS `system_sequence`;
CREATE TABLE `system_sequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL COMMENT '序号类型',
  `sequence` char(50) NOT NULL COMMENT '序号值',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_sequence_unique` (`type`,`sequence`) USING BTREE,
  KEY `index_system_sequence_type` (`type`),
  KEY `index_system_sequence_number` (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统序号表';

-- ----------------------------
-- Records of system_sequence
-- ----------------------------

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '用户登录密码',
  `qq` varchar(16) DEFAULT NULL COMMENT '联系QQ',
  `mail` varchar(32) DEFAULT NULL COMMENT '联系邮箱',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系手机号',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `login_at` datetime DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `authorize` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除状态(1:删除,0:未删)',
  `create_by` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_system_user_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES ('10000', 'admin', '21232f297a57a5a743894a0e4a801fc3', '22222222', '', '', '', '23000', '2019-12-03 11:42:08', '1', '2,4', '0', null, '2015-11-13 15:14:22');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '邀请人ID',
  `openid` varchar(64) NOT NULL,
  `mobilephone` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `img` varchar(1000) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `birthday` varchar(255) DEFAULT NULL COMMENT '生日',
  `realname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `school` varchar(255) DEFAULT NULL COMMENT '学校',
  `address` varchar(255) DEFAULT NULL COMMENT '邮寄地址',
  `credit` int(11) DEFAULT '0' COMMENT '积分',
  `last_time` int(11) DEFAULT NULL COMMENT '最后登录时间',
  `status` int(11) DEFAULT '1' COMMENT '状态(0禁用 1正常)',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_openid` (`openid`),
  UNIQUE KEY `idx_mobilephone` (`mobilephone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('4', '0', 'oS5v5sx7yB4SdrXGomkvFkt6btOY', '15101078430', '0724cde1b719455766032ee41d70f4aa', '孔祥彬', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKTicnegWibcciaDrX4pvEmdlG0dqLplkyCqK0eNMfug9x6QD7Z8rEMgZB0icmMT1SKCujaKiaFj1qxPgQ/132', null, null, null, null, null, '0', '1545714013', '1', '1545714014', '1545693611', null);
INSERT INTO `user` VALUES ('5', '0', 'oS5v5szqHIBohiI0EiB_Nd_rFrAU', '13848224857', '5f630e6c3bcd27cf86d31b52e13aba96', 'June', 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI0ic2ZPT7lEic77icWg5FpI8g5D0ic9KWaeUvRhiaKicib5HdnLKDZXWj3PKoiacO9LEtgiaiaIpicHB52LAhvA/132', null, null, null, null, null, '0', '1545704390', '1', '1545704391', '1545704390', null);
INSERT INTO `user` VALUES ('6', '0', 'oQIRn1oFh9dDji5vYf98jBw4eyfA', '13848255168', '332d90bb0bd1d66ec112f8774b66aa74', '赵鹏飞CHRIS', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoGJaw7sjGSDicHNtGibdbUib2ZnOA4ZBzIb7UduwRKodYQWgibIeAicNllH6uqJwQUqDJ8S4W0iaNhPEIA/132', null, null, null, null, null, '0', '1554421943', '1', '1554421943', '1545704409', null);
INSERT INTO `user` VALUES ('8', '0', 'oS5v5s5nPol229-TK1DeGpB9XoiQ', '15947526335', '9582951517ecf6a9331136314067426a', '&', 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqrIhRibyIhAdQ5MYEaqxZAadktwiaKibA3KEOYibrwmibLSVNICsiagZf2LXAN9H2UJGrwlibbbVz6LzJnA/132', null, null, null, null, null, '0', '1546659659', '1', '1546659660', '1546659659', null);
