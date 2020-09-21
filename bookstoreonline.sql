/*
 Navicat MySQL Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : bookstoreonline

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 25/05/2020 17:00:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrator
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `admin_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_sex` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `admin_tel` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`admin_username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of administrator
-- ----------------------------
INSERT INTO `administrator` VALUES ('root', '12345', 'XY', '男', '+10086');

-- ----------------------------
-- Table structure for bookdb
-- ----------------------------
DROP TABLE IF EXISTS `bookdb`;
CREATE TABLE `bookdb`  (
  `book_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_press` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `book_desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `book_price` double(10, 0) NOT NULL,
  `book_kunumber` int(11) NOT NULL,
  `book_xiaonumber` int(11) NOT NULL,
  PRIMARY KEY (`book_id`) USING BTREE,
  INDEX `bookdb_ibfk_1`(`book_category`) USING BTREE,
  CONSTRAINT `bookdb_ibfk_1` FOREIGN KEY (`book_category`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bookdb
-- ----------------------------
INSERT INTO `bookdb` VALUES ('096c5dfb-f8fc-4e68-bd47-6261e7b0793f', '写字达标一本通(2上RJ)', '孙利标', '安徽美术出版社', 'f458c0cc-f996-47f7-9d01-35e74fe0c27d', 'ad062982-92fa-4fd8-821b-12b7cbeb54bb.webp', '2020-05-24', '本书专为广大中小学学生设计，结合最新教学大纲进行编写。将学生每课必须掌握的生字、词语、句子及优秀课文汇总，按照硬笔规范汉字的标准笔形、笔顺、字形和结构书写，既可以帮助学生掌握学习要点知识又达到了练字的目的。本书是一套非常适合广大小学生练习的学生字帖。', 17, 88, 0);
INSERT INTO `bookdb` VALUES ('0c9eadc4-2b70-40f1-9e79-a8b7f8816739', '你心向上我心向你(上下)', '十尾兔', '青岛出版社', 'b8e58a70-2809-470c-8d58-067b2e4217ac', '9ae96326-be14-4b6b-9646-e14455c8809b.webp', '2020-05-24', '荣氏集团当家人荣谨因无意间看到小白领乔暖不为人知的一面而产生了好奇，经过之后的几次偶然接触，他更是被她独立自主的个性所吸引，于是开始不动声色地保护乔暖。 从小吃苦、一路靠自己打拼闯荡四方的乔暖，面对荣谨释放的温柔爱意，一向疏离冷漠的内心被逐渐融化。 面对现实的重重考验，他们誓要携手前进，所向披靡！', 56, 21, 2);
INSERT INTO `bookdb` VALUES ('15ee12ee-bbfe-4729-8993-bef7377163de', '唯物史观与当代历史主义', '焦佩锋', '人民出版社', '6d707d72-048f-4446-9650-b1bdb372385c', '5e61ab9f-b54d-4aec-8ce2-fd652bf2d630.webp', '2020-05-24', '本书对唯物史观与历史主义关系进行综合性研究。以启蒙自身的悖反性为切人点，揭示现代性内部的否定之否定关系，以此作为讨论理性和历史关系的思想背景；以古典历史主义和当代历史主义之间的脉络为线索，揭示历史主义从诞生到发展的演化过程，以此作为讨论马克思主义历史理论的问题背景；以唯物史观和古典历史主义、当代历史主义的两次对话为重点，揭示唯物史观对历史主义以及作为其相关形式的当代西方史学理论的批判性意义，以此彰显唯物史观的科学性质和当代意义。', 65, 55, 0);
INSERT INTO `bookdb` VALUES ('1bae5836-946b-4542-83c4-00410ab0beba', '孤独是生命的礼物', '余光中//林清玄//白先勇', '长江文艺出版社', 'b8e58a70-2809-470c-8d58-067b2e4217ac', '5622def3-3e9e-482b-940f-a03f1991a814.webp', '2020-05-24', '余光中、林清玄、白先勇联手献作，华语文坛巅峰之作！\r\n\r\n《孤独是生命的礼物》中收录了余光中、林清玄、白先勇、刘克襄、马家辉、朱天衣等知名作家的散文作品，这些作家无疑是当代中国读书人中最闪耀的明星，却依旧在孤独的人生路上反思求索。他们书写孤独、诠释孤独、坚守孤独。 在他们通达而活脱的思想中，我们看到了一个个孤独情感流淌却又不失理智的灵魂在闪闪发光。\r\n\r\n越是丰盈的灵魂，越能敏锐得感觉到孤独，不求回应，不求认同，独自向着内心的丰沛就是最大的自信。我们都需要时间独处，学会与自己交谈，学会孤独，便能站在更加明智观察生活的高度。', 34, 22, 0);
INSERT INTO `bookdb` VALUES ('20ca38ee-e0b9-4e0c-9d63-967f209a3eb2', '传统中国的货币与财政', ' 何平', '人民出版社', '11dd1c24-5b67-47e0-bab7-a0e6ef1a60f4', 'ad1775f5-1c71-4559-a8d1-b52703dabd76.webp', '2020-05-24', '无', 81, 66, 0);
INSERT INTO `bookdb` VALUES ('20f9abb7-20cd-4b88-8356-b8d1ec8dbfe4', '洗漱间的秘密', '(波兰)克雷斯蒂娜·利普卡-斯塔贝罗', '漓江出版社', 'd99dcde3-157b-4902-9070-3e38578aea80', 'd7e93c01-8ff3-4ceb-8c45-03f8261417b0.webp', '2020-05-18', '这是一本关于日常生活话题的非虚构类绘本，它向小朋友们介绍了连国王都要亲自去的地方——洗漱间的相关知识。 ', 23, 88, 3);
INSERT INTO `bookdb` VALUES ('23ab86f9-6135-43c2-9011-d83522ea064f', '起源与进化/新知图书馆', '美国迪亚格雷集团', '上海科学技术文献出版社', 'fbdd834f-b81a-400e-8fb5-dc82ee82887a', 'd1ca4a2b-c744-4fef-ad6d-81300ed70d0f.webp', '2020-05-18', '《新知图书馆》系列丛书包括法医科学、化学、自然科学、环境科学、地球科学、人体科学、遗传科学、生态科学、海洋科学、太空与天文学、计算机科学、天气与气候等。每册书中有20项实验，各类实验配有插图和图解，便于抓住学生注意力，直观地传递信息。所有实验都会综合调动学生进行科学探究的各方面技能，诸如观察、测量、归类、分析以及预测等。通俗易懂，可作为教师的参考书，是创新型课堂探究活动的资源。 本书为其中一册。', 45, 25, 7);
INSERT INTO `bookdb` VALUES ('3248f31e-6cd8-4c6a-bc8e-f3ec8a18bba0', '乌梁素海生态补水研究', '万芳', '科学出版社', 'fbdd834f-b81a-400e-8fb5-dc82ee82887a', 'fa469da8-aa08-4367-98ce-860f9e0d20cb.webp', '2020-05-24', '无', 76, 88, 0);
INSERT INTO `bookdb` VALUES ('36635ffe-aa63-4a6c-a2e1-3d307d860503', '天工开物(图文版)', '(明)宋应星', '吉林出版集团股份有限公司', 'fbdd834f-b81a-400e-8fb5-dc82ee82887a', 'e03bb78f-f911-4a77-9905-14f7c7a53f71.webp', '2020-05-24', '《天工开物》是世界上第一部关于农业和手工业生产的综合性著作，是中国历史上伟大的科技著作，被誉为“中国17世纪的工艺百科全书”。它对中国古代的各项技术进行了系统的总结，构成了一个完整的科学技术体系，对农业方面的丰富经验进行了总结，全面反映了工艺技术的成就。书中记述的许多生产技术，一直沿用到近代。 作者在书中强调人类要和自然相协调、人力要与自然力相配合，他注重实践、重视实践的思想也对后世有一定影响，代表了明代的技术水平。正如有人评价：观当世之一二便知此书乃绝世天成。', 37, 123, 0);
INSERT INTO `bookdb` VALUES ('3877d990-e85e-4f5d-b2aa-b2ae38c5faa7', '马蹄集', '张克', '上海三联书店', 'b8e58a70-2809-470c-8d58-067b2e4217ac', '285366ad-a2b1-41d1-951d-0df047974900.webp', '2020-05-18', '本书稿为著者近年在鲁迅研究及中国现代文学研究领域的学术论文辑录成果。全书共分三个部分，以鲁迅研究为主体。', 55, 20, 3);
INSERT INTO `bookdb` VALUES ('3eb27f8b-957f-4284-a302-9b945613fca2', '双向投资中的战略协同', '赵蓓文', '人民出版社', '11dd1c24-5b67-47e0-bab7-a0e6ef1a60f4', 'c827fd1e-a629-4f37-ac71-2b512d15a67c.webp', '2020-05-24', '无', 140, 77, 0);
INSERT INTO `bookdb` VALUES ('3f1819f1-a22f-4c47-bce5-0fad4ed386e6', '法汉课堂中的互动言语行为', ' 夏笑笑', '中山大学出版社', 'f458c0cc-f996-47f7-9d01-35e74fe0c27d', '1d116d8e-abed-41f1-a3ec-f50728ac1d19.webp', '2020-05-24', '本书旨在分析法汉外语课堂上语言互动中的意义建构过程。以言语行为理论为基础，采用论辩语义理论模型及礼貌语言研究方法，一方面比较法语和汉语不同类型言语行为的语义和概念表征，另一方面从语用角度，考察母语者和外语学习者的语言实现。本书目标为探索法语和汉语中各言语行为概念的异同，外语学习者在课堂上避免“威胁”行为的原因，以及说话者在其语言产出过程中语义概念表征的发展，为法汉语义比较提供研究参考。同时，归纳总结导致学习者出现语用失误的情况，有助于改善语言学习者语用能力的习得，改进语言教师的教学理念。', 74, 88, 1);
INSERT INTO `bookdb` VALUES ('403460de-2623-4204-a92d-aaea74f03d22', '伤寒六经原意', '李宇铭', '中国中医药出版社', 'fbdd834f-b81a-400e-8fb5-dc82ee82887a', '1dfe6d52-4c4a-4a84-a0d5-59140478b4d1.webp', '2020-05-24', '本书将六经作为重点，直面仲景原文，运用智者察同的中庸之道在《伤寒论》《金匮要略》中寻找答案，透过类证、类方、类药等分析视角，分别从还原基础理论、厘清基本概念和重构六经原貌等角度深入剖析，找到六经与仲景学术一脉相承的理论体系，还原仲景经方之大道。本书适用于中医临床工作者、研究者，中医药院校师生，经方爱好者、研究者以及广大的中医药爱好者阅读参考。', 33, 131, 0);
INSERT INTO `bookdb` VALUES ('41332911-936d-4012-b954-241f66ca9d6a', '法治热点八讲', '邹静', '红旗出版社', '6d707d72-048f-4446-9650-b1bdb372385c', '3624676c-2e9a-43fb-b827-b8d8c8150a90.webp', '2020-05-24', '全面依法治国是“四个全面”中的重要一环。本书以党的四中全会精神为指导，讲述了依法治国的重大意义等八个热点问题，回答了怎样推进科学民主立法，推进法治社会建设，加强法制队伍建设，保障公正司法，提高司法公信力，坚持依法治国和以德治国想结合等法治问题，对党员干部增强法制观念，普及法律知识，提高执政能力，有学习价值。', 28, 33, 1);
INSERT INTO `bookdb` VALUES ('5113bc2f-2ff5-414f-af22-52d17dc9f40d', '天工开物(图文版)', ' (明)宋应星', '吉林出版集团股份有限公司', 'fbdd834f-b81a-400e-8fb5-dc82ee82887a', '10e67190-0184-4bb7-a41d-dd1fd01fff3e.webp', '2020-05-18', '《天工开物》是世界上第一部关于农业和手工业生产的综合性著作，是中国历史上伟大的科技著作，被誉为“中国17世纪的工艺百科全书”。它对中国古代的各项技术进行了系统的总结，构成了一个完整的科学技术体系，对农业方面的丰富经验进行了总结，全面反映了工艺技术的成就。', 37, 98, 8);
INSERT INTO `bookdb` VALUES ('59170e4f-2ca8-4fd0-89e5-d28085ff5f97', '精通以太坊(影印版)(英文版)', '(希)安德烈亚斯·M.安东诺普洛斯//(英)加文·伍德', '东南大学出版社', '11dd1c24-5b67-47e0-bab7-a0e6ef1a60f4', '360fab0d-75a2-4023-bf9e-06c15a5d8184.webp', '2020-05-24', '无', 117, 88, 0);
INSERT INTO `bookdb` VALUES ('5a2f93d5-5d16-48e2-bf29-d6b317985e2a', '猎物人(物质文明简史)', '无', '广东人民出版社', '6d707d72-048f-4446-9650-b1bdb372385c', '54cb3002-4d1a-4ff4-925d-d5e3ac80477a.webp', '2020-05-24', ' “猎物人”，不是指“猎头”，也不是指“猎人”。这个《新周刊》自造的概念，旨在对人类生活的形态进行一次新的描述，重点是要重新看待人类成长过程中人与物的关系。\r\n\r\n  在物质的乱花渐欲迷人眼之际，在每天都传来物类的新消息之际，如果缺乏猎物人的引导，物质社会充其量只是消费社会，现代人只是新产品的消费者和物质的奴隶。猎物人，也许正是当代和未来中国生活方式的优质标配。\r\n\r\n  新周刊杂志社编著的《猎物人（物质文明简史）》分为三大部分，猎物考、猎物人写真和猎物天下。猎物考梳理了人类物质文明发展简史；猎物人写真描绘了诸多生动鲜活的猎物人个体，如蔡澜、李健、洪晃、陈晓卿、马未都，分享他们的猎物清单；猎物天下带你纵观古今中外的个体物件，探讨人与物的关系', 83, 67, 0);
INSERT INTO `bookdb` VALUES ('5aa30828-359f-417f-9c89-4acc752d93b7', '路遇最美风景', '月又白', '东方出版中心', 'b8e58a70-2809-470c-8d58-067b2e4217ac', '2a05ca46-789b-4b06-8175-489144746922.webp', '2020-05-24', '本书稿由55篇游记组成，是作者游历五大洲三十多个国家后的记忆珍藏。作者用散文诗的形式将在世界各地的见闻集结成书。作品对当地的风土人情、风光物产、城乡建筑、历史遗迹等有所介绍和白描，字里行间却参透着旅行者的心灵感悟和人文情怀，展现作者别样的旅行。', 27, 161, 0);
INSERT INTO `bookdb` VALUES ('64741549-b4bc-4701-958d-c9ae8bad761b', '小孩', '大冰', '湖南文艺出版社', 'b8e58a70-2809-470c-8d58-067b2e4217ac', 'b8ef53fd-2683-4cd2-9736-7e0fa55cf5e4.webp', '2020-05-24', '说书人大冰用富有韵律感的笔调、田野述事化的描述、正在进行时的方式讲述那些小孩——苦中作乐的小孩、知苦灭苦的小孩、赤子之心的小孩、自度度人的小孩：在生存压力与生命无常中为自己及同类寻找出路的拉祜族小孩瓶罐、爱嬉闹爱助人常怀一颗赤子之心的顽童大松、把儿子以1块钱卖掉舍弃舒心生活照料父亲的台北儿子阿宏、抗争宿命漂泊半生为血脉丝承拼尽全力的客家姑娘采、爱憎分明雪中送炭不问回报的老大哥黄健翔、世俗而透亮干净而简单自度亦度人的老潘婷婷梁叔、种过大米养过小猪为自己找家找亲人的东北姑娘樱桃，还有那个留在记忆深处乖巧而干净的苹果…… 这些赤诚的干净的散发着微微光芒的小孩，用他们的故事，如烛火、萤光、流星和闪电，点亮独行的暗夜，也劈散世间戾霾，与恒河沙数的普通人和普通事一起，红尘历劫，构成有情人间。\r\n\r\n不是所有的故事都能改变你的生活。不过，它一旦做到了，就是一辈子', 37, 40, 0);
INSERT INTO `bookdb` VALUES ('64d97b86-d5fe-43df-98fd-f920949b4cab', '水塘边的大傻瓜(精)', '(法)斯特凡纳·昂利什', '河北教育出版社', 'd99dcde3-157b-4902-9070-3e38578aea80', 'e570b5e1-43f7-431d-8ba5-f9568ccfca80.webp', '2020-05-24', '无', 37, 99, 0);
INSERT INTO `bookdb` VALUES ('65f2bcaa-36c4-4ce6-9dfe-7f3c964b7319', '植物资源学', '王振宇//刘荣//赵鑫', '中国科学技术出版社', 'fbdd834f-b81a-400e-8fb5-dc82ee82887a', '8a4fcf58-0fb4-484d-ba4a-79c917153c5a.webp', '2020-05-24', '本书对充分利用植物资源，提高植物资源的利用率、生产效率和经济效益、开发新产品和新技术以及提高林特产品的技术含量和附加值具有一定的指导作用。通过本书可以使读者了解植物资源的概念、研究内容、研究现状、发展趋势以及植物资源的化学成分、功能特性、开发利用的基本原理与方法。', 38, 99, 0);
INSERT INTO `bookdb` VALUES ('663322c6-aca0-4b7e-9548-d8d606633712', '桂西秘境(精)', '李元君', '广西民族出版社', 'b8e58a70-2809-470c-8d58-067b2e4217ac', 'bd1e9de8-ebb8-45ab-8262-9ed7c26ea6aa.webp', '2020-05-24', '全书分为四篇，分别是《世界天坑之都——乐业》《山上的水乡——古府凌云》《没有围墙的民族博物馆——隆林》《遥远的句町古国》。作者用平实笔触，描写这四个地方得天独厚的自然景观、风味清冽的茶乡故事、绚丽多姿的民族风情、神秘遥远的历史遗迹。即便随着岁月剥蚀，这个地方早已面目全非，作者仍以一名出版家的旺盛的好奇心和巨大的热情，去了解这几个西南边陲小城的前世今生，了解与它们相关的一切，感受自然的魅力，追寻文化的足迹，从这些地方蕴含的文化内涵感受到巨大的吸引力，在流畅优美的行文间，展露了作者炽热的人文情怀。同时文章配以大量精彩照片，图文相得益彰，使读者如身临其境。', 45, 23, 0);
INSERT INTO `bookdb` VALUES ('6b476f59-b215-4950-bb1c-d93aaad99eae', '创新简史', '未知', '清华大学出版社', 'fbdd834f-b81a-400e-8fb5-dc82ee82887a', 'bf712c03-d6d9-4aad-806e-6b75f2a4f1a0.webp', '2020-05-18', '人类为什么能够演化成今天这样？是什么驱动人类社会的进步？什么是创新？创新到底需要什么特质，规避什么风险？《创新简史：打开人类进步的黑匣子》采用“记叙+议论”的体裁，纵观整个人类历史，从技术、科学、体制、产业、文化等方面，用丰富的故事细节为公众展示人类创新的过程，并分析其中的各种问题，也有对一些经典问题如“钱学森之问”“李约瑟难题”、中国产业创新“七宗罪”的思考和分析，既给人以趣味，又引人思考。', 55, 35, 10);
INSERT INTO `bookdb` VALUES ('7ad4048f-6891-47b4-9c47-d14a3559d05b', '监察法学教程(精)', '秦前红', '法律出版社', '6d707d72-048f-4446-9650-b1bdb372385c', '5bd97910-25c0-4808-88c1-d27da0790621.webp', '2020-05-24', '本书紧扣《中华人民共和国监察法》，由国内在国家监察领域有相当研究基础的专家学者编写，主要包括监察法的基本理论、监察法的历史与发展、监察机关与监察范围、监察权限、监察程序、监察监督、法律责任与救济等篇章，力求深入准确地描绘国家监察制度，全面系统地阐述监察法的基本理论、规范体系和实践问题。本书既可以作为理论研究者的学术资料，也可以作为实务工作者的工作参考。', 84, 89, 0);
INSERT INTO `bookdb` VALUES ('7eec29f5-62f9-4eb9-ac84-61909f470a4f', '达芬奇的飞行传奇(精)', ' (德)贾勒特·拉特兰', '北京科学技术出版社', 'd99dcde3-157b-4902-9070-3e38578aea80', '8e46ad24-65bc-48ba-9172-d8840b77e3bf.webp', '2020-05-24', '无', 37, 34, 0);
INSERT INTO `bookdb` VALUES ('8711380c-1662-487a-8f6a-16284e1aca21', '我们囧囧的小时光', '爱喝水', '黑龙江美术出版社', 'd99dcde3-157b-4902-9070-3e38578aea80', '67982cff-a947-4e4e-a27a-3e760d054bf7.webp', '2020-05-18', '唐飞和陶心馨是一对青梅竹马的同班同学。 青梅竹马时，陶心馨是老大，唐飞是小弟，任陶心馨搓圆揉扁和胡闹，包容陶心馨的一切…… ', 36, 73, 2);
INSERT INTO `bookdb` VALUES ('886f59e9-3dfd-4ccf-a195-3bcb6f3ffbad', '阴天有时下肉丸(精)', '(美)朱迪·巴瑞特', '北京联合出版公司', 'd99dcde3-157b-4902-9070-3e38578aea80', '9a7bb7f9-de97-412d-adb8-0935fe8a6ad5.webp', '2020-05-24', '吧唧吧唧小镇和别的小镇一样，有街道、有花园、有学校。不同的是，这里没有卖食物的商店。尽管如此，小镇居民的生活中却不乏美味。因为这儿下雨的时候不下雨珠，下雪的时候不下雪花，刮来的也不只是单纯的风——从天而降的是各种美味的食物。可是有一天，天气变糟了，面包风暴、薄饼飓风、番茄龙卷风，各种坏天气接连袭来！面对堆满街道的肉丸、汉堡和番茄，人们开始害怕起来……', 44, 110, 1);
INSERT INTO `bookdb` VALUES ('8871c6d4-57d7-411a-9a48-53b482244ad3', '我喜欢人生快活的样子', '蔡澜', '湖南文艺出版社', 'b8e58a70-2809-470c-8d58-067b2e4217ac', '3daf7f78-2aa0-4207-ac8c-1abde5e19007.webp', '2020-05-24', '《我喜欢人生快活的样子》是知名作家、美食家、生活家蔡澜书写人生态度的散文随笔集。 本书谈读书、交友、饮食、茶道、旅行、情感、婚姻、家庭、花鸟等主题，涉及人生意义、生活情趣、情感培养、养生休闲等诸多内容。 全书各篇篇幅短小，一事一议，小中见大，屡有新见，均能启发心智，令人有耳目一新之感；即便是谈论百姓寻常市井生活，家长里短，也能幽默生动，轻松惬意，使人深切感觉到作者热爱生活、积极乐观的人生态度', 45, 96, 0);
INSERT INTO `bookdb` VALUES ('8cc8358e-585c-4e84-97b4-a82ce4efc95e', '聚焦京津冀协同发展', '武义青', '中国社会科学出版社', '11dd1c24-5b67-47e0-bab7-a0e6ef1a60f4', 'f65ecd07-f851-457a-96b4-82992c19ca09.webp', '2020-05-24', '无', 93, 55, 0);
INSERT INTO `bookdb` VALUES ('99e227e1-8e78-4716-85d2-454310487407', '除了你世界与我无关', '贾九峰', '百花洲文艺出版社', 'b8e58a70-2809-470c-8d58-067b2e4217ac', 'aad466dc-a35c-4923-892e-135b40aec5df.webp', '2020-05-24', '《除了你，世界与我无关》是由十五个爱情故事组成，如同影片中催人泪下的长镜头，一帧一帧映现在读者面前。恋人的生死相依，夫妻的悲欢别离，有情的人终成眷属，相爱的人劳燕分飞……时间、年龄、国界、灾难、战争、政治和仇恨，唯有爱，可以超越。爱，不知所起，但可以为之生，为之死。 不在深夜痛哭，哪知心之痛？写时心动、读时心疼、听来心惊，一旦错过，后会无期。', 34, 333, 1);
INSERT INTO `bookdb` VALUES ('99eae04d-4ea4-40d5-9acd-347e8a9b4392', '青春不散场', '孙春楠', '中国石油大学出版社', 'b8e58a70-2809-470c-8d58-067b2e4217ac', '773ca64b-e6db-421b-bd49-2643800ed651.webp', '2020-05-18', '这是一部青春题材的书稿，全书约计12万字，是作者在高中紧张学习之余的作品合集。包含《留给青春的别言》《幻纪元》《海天一隙》等几篇小说。', 28, 98, 0);
INSERT INTO `bookdb` VALUES ('9beac475-b2c8-4eef-add1-71a0cac0de03', '代数簇(英文版)(精', '荷)爱德华·路易安嘎', '高等教育出版社', 'fbdd834f-b81a-400e-8fb5-dc82ee82887a', '3384e40b-a536-43af-bbcf-b9145b148623.webp', '2020-05-18', '本书是作者在清华大学讲授的研究生课程“代数几何Ⅰ”，的讲义。每次伴随着课程的讲授，作者都要进行修订。经过四五次的修订锤炼之后，作者终于决定出版此书。 交换代数和代数几何是密不可分的，因此阅读本书需要一些交换代数的预备知识。', 66, 135, 0);
INSERT INTO `bookdb` VALUES ('9f18672e-4e00-40b3-9772-23e88dadee8d', '社区矫正程序问题研究', '司绍寒', '法律出版社', '6d707d72-048f-4446-9650-b1bdb372385c', '2a119d66-eae4-4501-9f36-de706ad376bb.webp', '2020-05-18', '《社区矫正程序问题研究》对社区矫正的适用程序、交付执行程序、执行程序进行了详细的论述，对社区矫正与刑事诉讼程序、刑事执行程序和刑事执行体制的关系进行了深入的探讨，提出了社区矫正司法执行与行政执行的二元执行理论，以及以此为基础的社区矫正程序立法建议', 65, 70, 1);
INSERT INTO `bookdb` VALUES ('a223c82d-7897-4750-86dc-f8341fd7c398', '皮囊(精)', '蔡崇达', '天津人民出版社', 'b8e58a70-2809-470c-8d58-067b2e4217ac', '929df844-ebb8-487b-bbe0-9abf4ee02ac7.webp', '2020-05-24', '时间沉淀之后，或许，80后出现了最重要（最好）的作家——蔡崇达。\r\n\r\n他让韩寒为了促成结集邀约三年；\r\n\r\n他让刘德华三十年来首次亲笔推介；\r\n\r\n他让文学评论大家李敬泽提笔作序；\r\n\r\n他让白岩松引为同路人并倾情赞赏。\r\n\r\n作者蔡崇达，本着对故乡亲人的情感，用一种客观、细致、冷静的方式，讲述了一系列刻在骨肉间故事。一个福建渔业小镇上的风土人情和时代变迁，在这些温情而又残酷的故事中一一体现。用《皮囊》这个具有指向本质意味的书名，来表达作者对父母、家乡的缅怀，对朋友命运的关切，同时也回答那些我们始终要回答的问题。', 37, 222, 0);
INSERT INTO `bookdb` VALUES ('a3d3ab6c-229a-4beb-9453-bc0d5d5e196e', '工业企业上云应用指南', '宁波市经济和信息化委员会', '人民邮电出版社', '11dd1c24-5b67-47e0-bab7-a0e6ef1a60f4', '20fffef9-6464-449f-bde7-a6100f4cbde3.webp', '2020-05-18', '宁波市经济和信息化委员会编著的《工业企业上云应用指南》主要用于指导工业企业如何应用工业云平台（以下简称为“上云”）。第一章主要介绍工业企业上云的必要性和未来趋势，帮助读者了解上云的商业价值；第二、三、四章主要讲解云平台的架构体系以及云应用的成熟度，帮助读者了解云平台的服务模式；第五、六章主要分析工业企业上云的应用场景和云平台服务商案例，帮助读者从实践中学习相关知识。 本书主要面向想要了解云平台的读者和工业企业，帮助企业在数字化、网络化、智能化方向上获得高质量发展，为企业带来创新机遇。', 37, 43, 1);
INSERT INTO `bookdb` VALUES ('a5a54dd7-7b14-4b85-b1cd-1932d953799c', '路易斯·I·康的空间构成', '(日)原口秀昭', '中国建筑工业出版社', 'fbdd834f-b81a-400e-8fb5-dc82ee82887a', '44295406-620b-4b35-809f-fcc67409aa54.webp', '2020-05-24', '本书对路易斯·I·康的空间构成法作了详细的介绍。首先，作者将路易斯·I·康的作品从空间构成的视点加以分析，形成容易理解的视觉表现；然后，将弗兰克·劳埃德·赖特、密斯·凡·德·罗、勒·柯布西耶、阿尔瓦·阿尔托等20世纪的巨匠们的空间构成与路易斯·I·康空间构成作比较，在明确双方作品各自本质的同时，对整个20世纪作一历史性的透视。最后，对路易斯·I·康的空间构成的轨迹、变迁进行总结，并列表从整体、部分、结构特点对其84个作品作了精要的分析比较。本书内容丰富，图文并茂，讲解深入浅出，具有很强的可读性。', 23, 99, 0);
INSERT INTO `bookdb` VALUES ('afa6ebed-05fd-446a-830d-133c52ae0114', '皇家兔(共2册)(精)', ' (英)圣塔·蒙蒂菲奥里//西蒙·蒙蒂菲奥里', '长江少年儿童出版社有限公司', 'd99dcde3-157b-4902-9070-3e38578aea80', '23ed769c-dd10-4e85-a5f4-cd5495886061.webp', '2020-05-24', '《皇家兔之特工之路》 在一家人当中，夏罗向来就是最弱小和安静的那个，而且还是兄弟姐妹成天捉弄取乐的对象。不过，当他无意中撞见一群老鼠，并偷听到一个针对女王的居心叵测的阴谋之后，夏罗却独自踏上了寻找伦敦皇家兔以及力挽狂澜的征程。这只小小的兔子，真能证明自己是一个大大的英雄吗？ 《皇家兔之逃离高塔》 终于可以称呼自己为伦敦皇家兔，终于成为这个生活在白金汉宫下面、同全世界的邪恶力量作斗争的秘密组织的一员，黄尾巴小夏罗自豪极了。可是在高高的“碎片”之中，在伦敦这座闻名遐迩的摩天大楼里，邪恶的瑞奇鼠们正在策划着一个阴谋：在美利坚合众国总统访问期间引发一场浩劫。而且，当大兔地洞遭受攻击，当夏罗也被绑走之后，他们看起来就要得逞了！ 夏罗能及时逃出，并力挽狂澜吗？', 93, 45, 0);
INSERT INTO `bookdb` VALUES ('b93f7eab-922c-403a-aed7-71e4a1d74fb1', '金融发展促进就业研究', '司颖华//肖强', '社会科学文献出版社', '6d707d72-048f-4446-9650-b1bdb372385c', '5345a2ca-3d7e-4ca0-88a4-00dfa273ebe4.webp', '2020-05-18', '金融发展对实体经济的影响，一直是理论研究者和政策制定者关注的问题，而只有研究金融发展对就业的影响，才能全面理解金融发展对实体经济所起的作用。同时，从就业研究的角度来看，如果忽略了金融发展的作用，对就业的决定机制也就不能有透彻的认识', 75, 32, 1);
INSERT INTO `bookdb` VALUES ('bfdeb5f2-b226-4e8e-8039-fd467a061195', '雅思周计划(口语第4版)', '刘伟', '中国人民大学出版社', 'f458c0cc-f996-47f7-9d01-35e74fe0c27d', '81766d17-0b24-43bc-b882-502fb6cfbb86.webp', '2020-05-18', '刘伟编著的《雅思周计划（口语第4版）》全部题目均来源于历次考试真题，是最权威的备考资料。 书中全部题目和回答均配有考官录音，全书录音时长7小时，帮助考生在提高口语表达能力的同时也大大提高听力水平。 本书配有参考译文，帮助考生快速透彻理解句意和句型结构。 “基础段”＋“强化段”的备考过程帮助考生“有步骤、高效率”地准备雅思考试。', 46, 99, 0);
INSERT INTO `bookdb` VALUES ('c6832d3f-1f97-485b-9dbf-10548959c849', '人生海海(精)', '麦家', '北京十月文艺出版社', 'b8e58a70-2809-470c-8d58-067b2e4217ac', 'c55eeca5-dee2-4f78-84d8-81f170f977ea.webp', '2020-05-24', '他是全村出奇古怪的人，古怪的名目要扳着指头一个一个数： 第一，他当过国民党上校，是革命群众要斗争的对象。但大家一边斗争他，一边又巴结讨好他，家里出什么事都去找他拿主意。 第二，说他是太监，可我们小孩子经常偷看他那个地方，好像还是满当的，有模有样的。 第三，他向来不出工，不干农活，天天空在家里看报纸，嗑瓜子，可日子过得比谁家都舒坦。还像养孩子一样养着一对猫，宝贝得不得了，简直神经病！” 《人生海海(精)》是茅盾文学奖得主麦家于2019年推出的全新长篇小说，悬念迭出，气度恢弘。故事背景跨越近一个世纪，巧用孩童视角，围绕一个待解谜团，讲述了一个人在时代中穿行缠斗的一生，离奇的故事里藏着让人悠长叹息的人生况味。人生似海，装载着时代、传奇与人心，既有日常滋生的残酷，也有时间带来的仁慈。', 52, 123, 9);
INSERT INTO `bookdb` VALUES ('cce55e42-4ba8-4da4-8f47-cb87fa3c7911', '被删除的人', '陈奕潞', '湖南文艺出版社', 'b8e58a70-2809-470c-8d58-067b2e4217ac', '6a1d5de4-74d2-4676-b7d1-373ca6027c87.webp', '2020-05-24', '这里是陈奕潞精心打造的奇幻花园，这里有着无限的可能。\r\n\r\n      这是一部短篇故事集，陈奕潞延续她一贯精准的写作手法，游刃有余的把控着不同的故事不同的人物。故事间看似没有联系，实际都朝着同一个方向，都在挖掘人性深处*真实的东西，不管是善还是恶。\r\n\r\n      这是一部21世纪的东方《十日谈》，天马行空的故事全都放在高速发展的现代社会中，让读者在虚幻中感受真实。故事交换永生好像是不等价的交换，其实*是公平，你打动我，我便满足你。24个故事形形色色，贪婪，私欲，虚妄，报复，爱恋，一一的呈现。\r\n\r\n      这些故事里，你能看到你自己。', 1, 22, 0);
INSERT INTO `bookdb` VALUES ('d35eb3a7-d1ec-4d12-a98e-b18c55dfc9af', '山梨(精)', '(日)宫泽贤治', '广西师范大学出版社', 'd99dcde3-157b-4902-9070-3e38578aea80', '0889a11b-c0a9-49cb-b64e-e241e1e42558.webp', '2020-05-24', '本书讲述了螃蟹父子三个五月和十一月在水中的所见所闻。阳光明媚的五月，两只小螃蟹在溪底玩耍，它们目睹了一条小鱼的死亡。过了半年，在寒冷的十一月，一颗山梨落到了水中，它给螃蟹们的生活带来了新鲜和期待。 《山梨》是一篇需要细细品味的童话，看似讲述了一个毫无波澜、平淡无奇的故事，但在这样的平常背后，藏着的是生活的无常和诗意。生活就是由这样一个个平常的日子组成的，而在这个过程中，我们必须学会向死而生，寻找生命的意义和价值。', 40, 78, 0);
INSERT INTO `bookdb` VALUES ('d4e3ca8a-d6ca-4a92-8a04-18cd52d104f6', '外语知能关系论', '高治东', '天津大学出版社', 'f458c0cc-f996-47f7-9d01-35e74fe0c27d', '2df86556-a33a-477b-b5c3-bb2ae42e0147.webp', '2020-05-24', '高治东著的《外语知能关系论》研究认为，外语能力形成动态意义模式主要包括学习者自身置入、文本意图、语境交互与语境消解结构等四个主要方面的内涵。基于体验的语言符号精微辨识的语义多义性的体验阐释策略、语义多义性的认知解读策略和基于语境消解结构意义确立的话语意义的构建策略、内外在语境整合策略，有助于外语话语意义的有效确立与诠释，进而帮助学习者外语形式、内容与意义相整合的外语能力的有效形成和发展。', 27, 99, 0);
INSERT INTO `bookdb` VALUES ('db6ec048-2810-4aaa-8292-d3460f4b0922', '当我足够爱才敢失去你', '朱沐', '湖南文艺出版社', 'b8e58a70-2809-470c-8d58-067b2e4217ac', 'dd1b1bcc-58f5-429d-82f0-eb00b5e039be.webp', '2020-05-24', '  爱得拼尽全力，才会不留遗憾。大热畅销书《当我足够爱才敢失去你》作者朱沐Lydia最新都市爱情传奇。豆瓣网百万网友倾情互动，深情大结局首度曝光。随书附赠“你足够好”精美明信片。\r\n\r\n  朱沐创作的《当我足够爱才敢失去你》讲述了在上海金融界工作的小白领颜烁，日复一日地过着声色犬马的生活。她偶遇香港娱乐圈著名摄影师皇甫源，被他身上的自由气息和文艺气质所吸引，陷入了一段无法控制的暧昧情感。与此同时，颜烁的工作遭遇突变，她接住唯一的橄榄枝，只身前往皇甫源所在的城市香港……', 1, 35, 0);
INSERT INTO `bookdb` VALUES ('dcf514d0-31fc-4752-ad6d-fddecae5a73e', '木质藤本植物资源(上)', '牟凤娟//李一果//王昌命', '科学出版社', 'fbdd834f-b81a-400e-8fb5-dc82ee82887a', 'e77b38e5-91b6-4b5c-ac00-ce3a316df592.webp', '2020-05-24', '无', 225, 131, 0);
INSERT INTO `bookdb` VALUES ('e57e5b05-e2bb-432b-b6c4-bfbb099b5b04', '信息经济(智能化与社会化)', '信息社会50人论坛', '中国财富出版社', '11dd1c24-5b67-47e0-bab7-a0e6ef1a60f4', '1377c649-cc20-4dd3-8972-8838624cfeac.webp', '2020-05-18', '《信息经济(智能化与社会化)》由信息社会50人论坛众多重量级大咖联袂撰文推出，全方位深刻解析社会多领域核心问题，被社会各界推崇为信息经济年度重磅之作。', 75, 65, 0);
INSERT INTO `bookdb` VALUES ('e7c7ccec-203f-424e-99ed-0c67e6d4cd24', '匏野文集(精)', '(清)张汝瑚', '商务印书馆', '6d707d72-048f-4446-9650-b1bdb372385c', '795d2485-429a-4c92-b8b8-10e93a55292b.webp', '2020-05-24', '无', 83, 124, 0);
INSERT INTO `bookdb` VALUES ('eb1094f5-87eb-4352-8767-62ef2481a496', '社会法总论', '余少祥', '社会科学文献出版社', '6d707d72-048f-4446-9650-b1bdb372385c', '504971ad-fac4-4e93-82f1-7ce3a5eb6e6d.webp', '2020-05-24', '作为一门新学科，社会法学研究在我国起步较晚，其基础理论研究十分薄弱。本书是作者多年从事社会法基础理论研究的重要成果。作者在自己以往社会法专题研究的基础上，缕析国内外有关学说、观点，以学术创新精神，对社会法的起源，社会法的概念和性质界定，社会法的定位、法律特征、基本原则、法律机制、内容体系等基础理论问题进行了系统深入的探讨，试图构建社会法完整的理论体系。本书通过对社会法一些重大理论问题作出回应，弥补了社会法基础理论研究的不足，对于促进社会法学科的发展具有重要的推动作用，有利于尽快确定社会法的理论边界和基本框架，推动社会法学科的发展和完善。', 113, 45, 0);
INSERT INTO `bookdb` VALUES ('ee69bad0-6579-43e6-ae95-eae803c25035', '全栈工程师Web开发指南', ' (意)迪诺·埃斯波西托', '人民邮电出版社', 'f458c0cc-f996-47f7-9d01-35e74fe0c27d', '287988ac-d73a-43f5-96b5-69fb8dbbe9c8.webp', '2020-05-24', '迪诺·埃斯波西托著的《全栈工程师Web开发指南》通过介绍一种实用的、问题驱动的，关注用户的方法，介绍了规划、设计和构建动态的Web强有力的方法，给出了目前进行Web开发的一套有效解决方案。本书引导读者选择和实现特定的技术，阐释了重要的用户体验主题，并探讨了对移动友好的技术和反应式设计技术等内容。除此之外，本书还介绍了ASP.NET MVC、SignalR、Bootstrap、AJAX、JSON和JQuery等技术的相关内容。 通过阅读本书，读者将学到如何从DDD方法以及现代的UX设计方法中获益，进而能够快速构建出解决当前问题并且有出色用户体验的Web解决方案。', 75, 76, 0);
INSERT INTO `bookdb` VALUES ('ef71ea10-b5f7-4619-81ba-71d969110ce1', '洗漱间的秘密', ' (波兰)克雷斯蒂娜·利普卡-斯塔贝罗', '漓江出版社', 'd99dcde3-157b-4902-9070-3e38578aea80', 'fce28a88-c31d-440e-965d-d373d9b96d44.webp', '2020-05-24', '这是一本关于日常生活话题的非虚构类绘本，它向小朋友们介绍了连国王都要亲自去的地方——洗漱间的相关知识。 绘本以十六个大问号串起全文，将小朋友们非常关心的问题细细道来。读完这本绘本，小朋友们将会了解到以下知识： 洗漱间的结构，每个部分（洗漱池、浴池、马桶等）的功能； 如何上厕所、如何洗手、如何洗澡、如何刷牙、如何洗头； 过去的人是如何洗澡的； 怎样节水，以及怎样使厕所散发香气； 更重要的是，我们在卫生方面所做的种种创新和获得的进步。', 36, 67, 0);
INSERT INTO `bookdb` VALUES ('f36f5035-90b2-49cc-b842-6d8b70a77f21', '了不起的奇车侠(精)', '(法)皮埃尔·克鲁科', '北京少年儿童出版社', 'd99dcde3-157b-4902-9070-3e38578aea80', '0edf509e-c62b-4ccf-9ab6-c0bc31716f21.webp', '2020-05-24', '宇宙青蛙做得太过火啦，它偷走了我的被子，然后坐着电子火流星逃跑啦！为了追逐这只星际小偷，我用上了最为神奇的交通工具——小奇车，小奇车的奔跑速度超级无敌的快，无数人梦寐以求想得到这小奇车……疯狂的追逐开始了：在空中，海洋里甚至太空里！当这场追逐结束后，我会回到我的工作室，改良美丽的小奇车，坐着它去进行更多的冒险。', 37, 47, 0);
INSERT INTO `bookdb` VALUES ('fcff8632-9f46-458f-9a05-12deffb5399d', '厚街村情', '东莞市厚街镇人民政府', '光明日报出版社', '6d707d72-048f-4446-9650-b1bdb372385c', 'a774d140-d93d-490e-ad9a-c0522abff2f4.webp', '2020-05-24', '无', 121, 67, 0);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('11dd1c24-5b67-47e0-bab7-a0e6ef1a60f4', '经济金融', '经济金融指的是。。。。。');
INSERT INTO `category` VALUES ('6d707d72-048f-4446-9650-b1bdb372385c', '人文社科', '人文社科指的是。。。。。');
INSERT INTO `category` VALUES ('b8e58a70-2809-470c-8d58-067b2e4217ac', '文学艺术', '文学艺术指的是。。。。。');
INSERT INTO `category` VALUES ('d99dcde3-157b-4902-9070-3e38578aea80', '少儿童书', '少儿童书指的是。。。。。');
INSERT INTO `category` VALUES ('f458c0cc-f996-47f7-9d01-35e74fe0c27d', '教育考试', '教育考试指的是。。。。。');
INSERT INTO `category` VALUES ('fbdd834f-b81a-400e-8fb5-dc82ee82887a', '科学技术', '科学技术指的是。。。。。');

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `favorite_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `book_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`favorite_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `book_id`(`book_id`) USING BTREE,
  CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `bookdb` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES ('676dc662-ea40-4ab3-be38-cf266b784f0d', '0b0d7564-9a85-497c-95f8-ac05b5317a07', '6b476f59-b215-4950-bb1c-d93aaad99eae');
INSERT INTO `favorite` VALUES ('781a178b-c1a6-42ee-b692-f261d365b281', '0b0d7564-9a85-497c-95f8-ac05b5317a07', 'a223c82d-7897-4750-86dc-f8341fd7c398');
INSERT INTO `favorite` VALUES ('a424c092-8a70-458b-8a12-680a34e3bf6d', '0b0d7564-9a85-497c-95f8-ac05b5317a07', 'c6832d3f-1f97-485b-9dbf-10548959c849');
INSERT INTO `favorite` VALUES ('aa16ae66-9405-46c7-8332-9cc276f4d9d1', '0b0d7564-9a85-497c-95f8-ac05b5317a07', 'e57e5b05-e2bb-432b-b6c4-bfbb099b5b04');
INSERT INTO `favorite` VALUES ('d14a7f10-c499-48d6-8007-3414590625cf', '0b0d7564-9a85-497c-95f8-ac05b5317a07', '0c9eadc4-2b70-40f1-9e79-a8b7f8816739');

-- ----------------------------
-- Table structure for orderitems
-- ----------------------------
DROP TABLE IF EXISTS `orderitems`;
CREATE TABLE `orderitems`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `book_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ordernum` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_id_fk`(`book_id`) USING BTREE,
  INDEX `ordernum_fk`(`ordernum`) USING BTREE,
  CONSTRAINT `book_id_fk` FOREIGN KEY (`book_id`) REFERENCES `bookdb` (`book_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ordernum_fk` FOREIGN KEY (`ordernum`) REFERENCES `orders` (`ordernum`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orderitems
-- ----------------------------
INSERT INTO `orderitems` VALUES ('20200524243953188711700', 1, 45, '23ab86f9-6135-43c2-9011-d83522ea064f', '20200524243953187851000');
INSERT INTO `orderitems` VALUES ('20200524254715106983300', 1, 23, '20f9abb7-20cd-4b88-8356-b8d1ec8dbfe4', '20200524254715106055600');
INSERT INTO `orderitems` VALUES ('20200524254715107042600', 1, 44, '886f59e9-3dfd-4ccf-a195-3bcb6f3ffbad', '20200524254715106055600');
INSERT INTO `orderitems` VALUES ('20200524255469781200600', 1, 37, '5113bc2f-2ff5-414f-af22-52d17dc9f40d', '20200524255469781180700');
INSERT INTO `orderitems` VALUES ('20200524255469781214600', 1, 28, '41332911-936d-4012-b954-241f66ca9d6a', '20200524255469781180700');
INSERT INTO `orderitems` VALUES ('20200525304797239853300', 2, 112, '0c9eadc4-2b70-40f1-9e79-a8b7f8816739', '20200525304797237842500');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `ordernum` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `money` double NULL DEFAULT NULL,
  `time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `userId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ordernum`) USING BTREE,
  INDEX `user_Id_fk`(`userId`) USING BTREE,
  CONSTRAINT `user_Id_fk` FOREIGN KEY (`userId`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('20200524243953187851000', 1, 45, '2020-05-24 18:34:30', 1, '0b0d7564-9a85-497c-95f8-ac05b5317a07');
INSERT INTO `orders` VALUES ('20200524254715106055600', 2, 67, '2020-05-24 21:33:52', 0, '0b0d7564-9a85-497c-95f8-ac05b5317a07');
INSERT INTO `orders` VALUES ('20200524255469781180700', 2, 65, '2020-05-24 21:46:27', 0, '0b0d7564-9a85-497c-95f8-ac05b5317a07');
INSERT INTO `orders` VALUES ('20200525304797237842500', 2, 112, '2020-05-25 11:28:34', 1, '0b0d7564-9a85-497c-95f8-ac05b5317a07');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_sex` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_tel` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0b0d7564-9a85-497c-95f8-ac05b5317a07', 'qwerty', '12345', 'XtoY', '男', '+10086', '火星');
INSERT INTO `user` VALUES ('8c11560c-5eb5-4150-9493-e82d605a48d2', 'qwerty123', '12345', '张三', '男', '112', 'fffff');

SET FOREIGN_KEY_CHECKS = 1;
