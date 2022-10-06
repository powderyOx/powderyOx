-- noinspection SqlDialectInspectionForFile

-- noinspection SqlNoDataSourceInspectionForFile

DROP DATABASE IF EXISTS `Lib4You_30092022`;
CREATE
DATABASE IF NOT EXISTS `Lib4You_30092022`;

USE Lib4You_30092022;

-- Setting the storage engine
-- Details can be found here: https://dev.mysql.com/doc/refman/5.7/en/storage-engine-setting.html
-- Alternative Storage Engines: https://dev.mysql.com/doc/refman/5.7/en/storage-engines.html
SET
default_storage_engine=MyISAM;

-- ----------- books ----------------
-- CREATE Table books
CREATE TABLE books
(
    isbn        BIGINT       NOT NULL PRIMARY KEY,
    title       VARCHAR(128) NOT NULL,
    year YEAR,
    edition     TINYINT,
    description TEXT,
    likes INT
);

-- Insert data into table language
INSERT INTO books
VALUES (123123123, 'PHP for  Beginners', 2022, 1,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 0),
       (245678912, 'JavaScript - Aber jetzt lern ich es', 2019, 3,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At erat pellentesque adipiscing commodo.',0),
       (378901234, 'Netzwerktechnik leicht gemacht', 2016, 2,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Iaculis nunc sed augue lacus viverra vitae congue eu. Laoreet suspendisse interdum consectetur libero id.',0),
       (405612347, 'Mathe 1', 2019, 4,
        'Ut porttitor leo a diam sollicitudin tempor id eu nisl. Id leo in vitae turpis massa sed elementum tempus egestas. Venenatis urna cursus eget nunc. Interdum posuere lorem ipsum dolor sit amet consectetur adipiscing. Enim lobortis scelerisque fermentum dui.',0),
       (523456789, 'Grundlagen der Elektrotechnik 2', 2021, 5,
        'Iaculis urna id volutpat lacus laoreet non curabitur gravida. Velit egestas dui id ornare arcu odio ut. Velit euismod in pellentesque massa placerat. Egestas dui id ornare arcu odio ut sem nulla. Elementum integer enim neque volutpat ac tincidunt. ',0);

-- ----------- authors ----------------
-- CREATE Table authors
CREATE TABLE authors
(
    idd       INT         NOT NULL PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(64) NOT NULL,
    lastname  VARCHAR(64) NOT NULL
)AUTO_INCREMENT=6;

-- Insert data into table authors
INSERT INTO authors
VALUES (1, 'Fritz', 'Sommer'),
       (2, 'Tobias', 'Huber'),
       (3, 'Joseph', 'Doyle'),
       (4, 'Joanne', 'Rowling'),
       (5, 'Lukas', 'Dorfer');

-- CREATE Table rel_books_authors
CREATE TABLE rel_books_authors
(
    isbn      BIGINT NOT NULL,
    author_id INT    NOT NULL,
    PRIMARY KEY (isbn, author_id)
);

-- Insert data into table rel_books_authors
INSERT INTO rel_books_authors
VALUES (123123123, 1),
       (245678912, 1),
       (378901234, 2),
       (378901234, 3),
       (405612347, 3),
       (405612347, 4),
       (405612347, 5),
       (523456789, 4),
       (523456789, 3),
       (523456789, 2);