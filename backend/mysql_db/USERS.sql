-- A executer avec un compte GRANT (ex: root)

CREATE USER `reader`@`localhost` IDENTIFIED BY '+F9K7MOT%S8g_qO4',
GRANT SELECT ON `%DB`.* TO `reader`@`localhost`,
CREATE USER `writer`@`localhost` IDENTIFIED BY 'ibH@jwN0^Dr37Fmq',
GRANT SELECT, INSERT, UPDATE, DELETE ON `%DB`.* TO `writer`@`localhost`;