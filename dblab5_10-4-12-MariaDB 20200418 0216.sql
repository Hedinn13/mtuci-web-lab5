--
-- Скрипт сгенерирован Devart dbForge Studio 2019 for MySQL, Версия 8.2.23.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 18.04.2020 2:16:55
-- Версия сервера: 5.5.5-10.4.12-MariaDB-1:10.4.12+maria~bionic-log
-- Версия клиента: 4.1
--

-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

--
-- Установка базы данных по умолчанию
--
USE dblab5;

--
-- Удалить таблицу `django_migrations`
--
DROP TABLE IF EXISTS django_migrations;

--
-- Удалить таблицу `django_session`
--
DROP TABLE IF EXISTS django_session;

--
-- Удалить таблицу `articles_article`
--
DROP TABLE IF EXISTS articles_article;

--
-- Удалить таблицу `auth_user_groups`
--
DROP TABLE IF EXISTS auth_user_groups;

--
-- Удалить таблицу `auth_user_user_permissions`
--
DROP TABLE IF EXISTS auth_user_user_permissions;

--
-- Удалить таблицу `django_admin_log`
--
DROP TABLE IF EXISTS django_admin_log;

--
-- Удалить таблицу `auth_user`
--
DROP TABLE IF EXISTS auth_user;

--
-- Удалить таблицу `auth_group_permissions`
--
DROP TABLE IF EXISTS auth_group_permissions;

--
-- Удалить таблицу `auth_group`
--
DROP TABLE IF EXISTS auth_group;

--
-- Удалить таблицу `auth_permission`
--
DROP TABLE IF EXISTS auth_permission;

--
-- Удалить таблицу `django_content_type`
--
DROP TABLE IF EXISTS django_content_type;

--
-- Установка базы данных по умолчанию
--
USE dblab5;

--
-- Создать таблицу `django_content_type`
--
CREATE TABLE django_content_type (
  id int(11) NOT NULL AUTO_INCREMENT,
  app_label varchar(100) NOT NULL,
  model varchar(100) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 8,
AVG_ROW_LENGTH = 4681,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `django_content_type_app_label_model_76bd3d3b_uniq` для объекта типа таблица `django_content_type`
--
ALTER TABLE django_content_type
ADD UNIQUE INDEX django_content_type_app_label_model_76bd3d3b_uniq (app_label, model);

--
-- Создать таблицу `auth_permission`
--
CREATE TABLE auth_permission (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  content_type_id int(11) NOT NULL,
  codename varchar(100) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 29,
AVG_ROW_LENGTH = 585,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `auth_permission_content_type_id_codename_01ab375a_uniq` для объекта типа таблица `auth_permission`
--
ALTER TABLE auth_permission
ADD UNIQUE INDEX auth_permission_content_type_id_codename_01ab375a_uniq (content_type_id, codename);

--
-- Создать внешний ключ
--
ALTER TABLE auth_permission
ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id)
REFERENCES django_content_type (id);

--
-- Создать таблицу `auth_group`
--
CREATE TABLE auth_group (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(150) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `name` для объекта типа таблица `auth_group`
--
ALTER TABLE auth_group
ADD UNIQUE INDEX name (name);

--
-- Создать таблицу `auth_group_permissions`
--
CREATE TABLE auth_group_permissions (
  id int(11) NOT NULL AUTO_INCREMENT,
  group_id int(11) NOT NULL,
  permission_id int(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` для объекта типа таблица `auth_group_permissions`
--
ALTER TABLE auth_group_permissions
ADD UNIQUE INDEX auth_group_permissions_group_id_permission_id_0cd325b0_uniq (group_id, permission_id);

--
-- Создать внешний ключ
--
ALTER TABLE auth_group_permissions
ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id)
REFERENCES auth_permission (id);

--
-- Создать внешний ключ
--
ALTER TABLE auth_group_permissions
ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id)
REFERENCES auth_group (id);

--
-- Создать таблицу `auth_user`
--
CREATE TABLE auth_user (
  id int(11) NOT NULL AUTO_INCREMENT,
  password varchar(128) NOT NULL,
  last_login datetime(6) DEFAULT NULL,
  is_superuser tinyint(1) NOT NULL,
  username varchar(150) NOT NULL,
  first_name varchar(30) NOT NULL,
  last_name varchar(150) NOT NULL,
  email varchar(254) NOT NULL,
  is_staff tinyint(1) NOT NULL,
  is_active tinyint(1) NOT NULL,
  date_joined datetime(6) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 2,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `username` для объекта типа таблица `auth_user`
--
ALTER TABLE auth_user
ADD UNIQUE INDEX username (username);

--
-- Создать таблицу `django_admin_log`
--
CREATE TABLE django_admin_log (
  id int(11) NOT NULL AUTO_INCREMENT,
  action_time datetime(6) NOT NULL,
  object_id longtext DEFAULT NULL,
  object_repr varchar(200) NOT NULL,
  action_flag smallint(5) UNSIGNED NOT NULL CHECK (action_flag >= 0),
  change_message longtext NOT NULL,
  content_type_id int(11) DEFAULT NULL,
  user_id int(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 10,
AVG_ROW_LENGTH = 2048,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE django_admin_log
ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id)
REFERENCES django_content_type (id);

--
-- Создать внешний ключ
--
ALTER TABLE django_admin_log
ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id)
REFERENCES auth_user (id);

--
-- Создать таблицу `auth_user_user_permissions`
--
CREATE TABLE auth_user_user_permissions (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  permission_id int(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` для объекта типа таблица `auth_user_user_permissions`
--
ALTER TABLE auth_user_user_permissions
ADD UNIQUE INDEX auth_user_user_permissions_user_id_permission_id_14a6b632_uniq (user_id, permission_id);

--
-- Создать внешний ключ
--
ALTER TABLE auth_user_user_permissions
ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id)
REFERENCES auth_permission (id);

--
-- Создать внешний ключ
--
ALTER TABLE auth_user_user_permissions
ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id)
REFERENCES auth_user (id);

--
-- Создать таблицу `auth_user_groups`
--
CREATE TABLE auth_user_groups (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL,
  group_id int(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `auth_user_groups_user_id_group_id_94350c0c_uniq` для объекта типа таблица `auth_user_groups`
--
ALTER TABLE auth_user_groups
ADD UNIQUE INDEX auth_user_groups_user_id_group_id_94350c0c_uniq (user_id, group_id);

--
-- Создать внешний ключ
--
ALTER TABLE auth_user_groups
ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id)
REFERENCES auth_group (id);

--
-- Создать внешний ключ
--
ALTER TABLE auth_user_groups
ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id)
REFERENCES auth_user (id);

--
-- Создать таблицу `articles_article`
--
CREATE TABLE articles_article (
  id int(11) NOT NULL AUTO_INCREMENT,
  title varchar(200) NOT NULL,
  text longtext NOT NULL,
  created_date date NOT NULL,
  author_id int(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 19,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE articles_article
ADD CONSTRAINT articles_article_author_id_059aea7d_fk_auth_user_id FOREIGN KEY (author_id)
REFERENCES auth_user (id);

--
-- Создать таблицу `django_session`
--
CREATE TABLE django_session (
  session_key varchar(40) NOT NULL,
  session_data longtext NOT NULL,
  expire_date datetime(6) NOT NULL,
  PRIMARY KEY (session_key)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `django_session_expire_date_a5c62663` для объекта типа таблица `django_session`
--
ALTER TABLE django_session
ADD INDEX django_session_expire_date_a5c62663 (expire_date);

--
-- Создать таблицу `django_migrations`
--
CREATE TABLE django_migrations (
  id int(11) NOT NULL AUTO_INCREMENT,
  app varchar(255) NOT NULL,
  name varchar(255) NOT NULL,
  applied datetime(6) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 19,
AVG_ROW_LENGTH = 910,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

-- 
-- Вывод данных для таблицы django_content_type
--
INSERT INTO django_content_type VALUES
(1, 'admin', 'logentry'),
(7, 'articles', 'article'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- 
-- Вывод данных для таблицы auth_permission
--
INSERT INTO auth_permission VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add article', 7, 'add_article'),
(26, 'Can change article', 7, 'change_article'),
(27, 'Can delete article', 7, 'delete_article'),
(28, 'Can view article', 7, 'view_article');

-- 
-- Вывод данных для таблицы auth_group
--
-- Таблица dblab5.auth_group не содержит данных

-- 
-- Вывод данных для таблицы auth_user
--
INSERT INTO auth_user VALUES
(1, 'pbkdf2_sha256$180000$wl12ZDIWb2O8$R0LAijBXZjAiSovWPg/UU8Kx+wd1FXLKD2YgvBOw1NA=', '2020-04-17 20:46:51.265924', 1, 'root', '', '', '', 1, 1, '2020-04-17 17:49:30.331216');

-- 
-- Вывод данных для таблицы django_session
--
INSERT INTO django_session VALUES
('2bf5fzeu16j6jmcfclm1enbzekt8me8l', 'YmU5NTBlN2Y5ZTZiNDhmM2I4NmQyZjBhNjlhYjI1YTIzNjUwMGQxMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjY3Y2I0NjljOTczYmI0MDEwNDA4ZmRhNWU0OWQ0MzlhODdlYmQ0In0=', '2020-05-01 20:46:51.269305'),
('ech8m3ecrf6hahgczcxfs0zay0bb5fkx', 'YmU5NTBlN2Y5ZTZiNDhmM2I4NmQyZjBhNjlhYjI1YTIzNjUwMGQxMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMjY3Y2I0NjljOTczYmI0MDEwNDA4ZmRhNWU0OWQ0MzlhODdlYmQ0In0=', '2020-05-01 17:50:32.745501');

-- 
-- Вывод данных для таблицы django_migrations
--
INSERT INTO django_migrations VALUES
(1, 'contenttypes', '0001_initial', '2020-04-17 17:48:44.081315'),
(2, 'auth', '0001_initial', '2020-04-17 17:48:44.423217'),
(3, 'admin', '0001_initial', '2020-04-17 17:48:45.851236'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-04-17 17:48:46.17745'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-04-17 17:48:46.191173'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-04-17 17:48:46.321979'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-04-17 17:48:46.499238'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-04-17 17:48:46.638318'),
(9, 'auth', '0004_alter_user_username_opts', '2020-04-17 17:48:46.659922'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-04-17 17:48:46.780078'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-04-17 17:48:46.785054'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-04-17 17:48:46.805866'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-04-17 17:48:46.827255'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-04-17 17:48:46.846374'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-04-17 17:48:47.083373'),
(16, 'auth', '0011_update_proxy_permissions', '2020-04-17 17:48:47.097595'),
(17, 'sessions', '0001_initial', '2020-04-17 17:48:47.135196'),
(18, 'articles', '0001_initial', '2020-04-17 18:12:21.578526');

-- 
-- Вывод данных для таблицы django_admin_log
--
INSERT INTO django_admin_log VALUES
(1, '2020-04-17 18:52:47.644636', '1', 'Article object (1)', 1, '[{"added": {}}]', 7, 1),
(2, '2020-04-17 18:53:25.245206', '2', 'Article object (2)', 1, '[{"added": {}}]', 7, 1),
(3, '2020-04-17 18:53:33.235229', '2', 'Article object (2)', 2, '[]', 7, 1),
(4, '2020-04-17 18:53:54.910402', '3', 'Article object (3)', 1, '[{"added": {}}]', 7, 1),
(5, '2020-04-17 19:31:47.231555', '3', 'Article object (3)', 2, '[{"changed": {"fields": ["Text"]}}]', 7, 1),
(6, '2020-04-17 19:32:59.411838', '3', 'Article object (3)', 2, '[]', 7, 1),
(7, '2020-04-17 19:34:26.77162', '3', 'Article object (3)', 2, '[]', 7, 1),
(8, '2020-04-17 19:43:42.159094', '3', 'Article object (3)', 2, '[]', 7, 1),
(9, '2020-04-17 20:47:11.973738', '4', 'Article object (4)', 2, '[]', 7, 1);

-- 
-- Вывод данных для таблицы auth_user_user_permissions
--
-- Таблица dblab5.auth_user_user_permissions не содержит данных

-- 
-- Вывод данных для таблицы auth_user_groups
--
-- Таблица dblab5.auth_user_groups не содержит данных

-- 
-- Вывод данных для таблицы auth_group_permissions
--
-- Таблица dblab5.auth_group_permissions не содержит данных

-- 
-- Вывод данных для таблицы articles_article
--
INSERT INTO articles_article VALUES
(1, 'Lorem Ipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vitae faucibus orci. Morbi a est ac massa rhoncus iaculis. Ut fringilla elit justo, eu tincidunt felis egestas eu. Nunc aliquam diam vel ullamcorper tempus. Duis tincidunt placerat elit. Ut eget congue tellus. Nam facilisis ornare mauris, a sagittis massa facilisis dictum. Curabitur lobortis tempus massa, fringilla molestie odio maximus eu. Proin at nibh est. Ut consequat neque ac consequat pellentesque. Donec felis lorem, hendrerit vel aliquam id, tempus sit amet justo.\r\n\r\nNam pulvinar nunc imperdiet nisl blandit, vitae condimentum odio blandit. Aenean tempus ipsum velit, vel accumsan quam posuere et. Aliquam rhoncus vel purus vitae imperdiet. Morbi at orci id tortor hendrerit lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus ultrices risus sit amet sapien pellentesque sollicitudin in a mi. Quisque egestas ac arcu ut eleifend. Nunc ipsum massa, auctor sed ex non, accumsan placerat ante.\r\n\r\nDuis lorem eros, posuere in mattis in, consectetur eget nisi. In tempor velit aliquet maximus sodales. Vivamus quis tempor urna. Maecenas dignissim, risus ac ultricies bibendum, metus magna aliquam purus, sed consectetur diam eros sodales dolor. Donec dapibus ex at ipsum aliquam eleifend. Maecenas at ante commodo, pellentesque ligula non, euismod neque. Etiam tincidunt nulla quam, nec fermentum lacus iaculis eget. Vivamus mattis a arcu eget egestas. Cras sapien quam, ultricies in commodo et, tincidunt ut tortor.\r\n\r\nNam mollis ornare semper. Fusce at massa eget nunc posuere vestibulum vel a lacus. Vivamus egestas imperdiet vehicula. In quam orci, commodo at urna ut, scelerisque aliquam ligula. Integer vitae tortor ac dui mollis maximus. Nulla tincidunt mollis enim eu tincidunt. Mauris vel suscipit velit. Quisque vehicula feugiat lorem nec vestibulum. Vestibulum non orci ac ligula molestie congue. Sed congue dui non odio imperdiet, sit amet faucibus arcu cursus. Morbi erat felis, posuere non purus eu, ullamcorper eleifend ipsum. Nunc fringilla ante scelerisque, molestie nisi sit amet, placerat nunc. Fusce ultrices lectus ut magna vulputate placerat. Fusce a eleifend urna. Proin vel ipsum erat. Donec consequat urna vitae erat sodales, nec faucibus felis ultrices.\r\n\r\nAliquam erat volutpat. Donec nec quam sit amet purus molestie rhoncus vel non tellus. Aliquam erat volutpat. Pellentesque augue nibh, pulvinar ut gravida nec, vulputate iaculis quam. Cras dapibus vitae nunc eu viverra. Maecenas dapibus dui dolor, quis auctor quam maximus id. Etiam nisi ipsum, rutrum eget congue vel, eleifend eget nunc. Praesent bibendum tortor sit amet enim tempor pretium.', '2020-04-17', 1),
(2, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2020-04-17', 1),
(3, 'Where does it come from?', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', '2020-04-17', 1),
(4, 'Why do we use it?', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '2020-04-17', 1),
(16, 'Where can I get some?', 'here are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', '2020-04-17', 1),
(17, 'The standard Lorem Ipsum passage, used since the 1500s', '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."', '2020-04-17', 1),
(18, 'Section 1.10.32 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC', '"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"', '2020-04-17', 1);

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;