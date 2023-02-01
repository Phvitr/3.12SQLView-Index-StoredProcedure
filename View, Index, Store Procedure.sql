create database demo12;

use demo12;

CREATE TABLE products (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
productcode VARCHAR(20),
productname VARCHAR(50),
productprice BIGINT,
productamount int,
productdescription VARCHAR(100),
productstatus VARCHAR(100)
);

INSERT INTO products(productcode,productname,productprice,productamount,productdescription,productstatus) VALUE 
('CRV', 'Honda',1000000000,50,'SUV','available'),
('S450','Mercedes-Benz',4500000000,10,'Sedan','unavailable'),
('XC60','Volvo',3000000000,15,'CUV','available'),
('MORNING','KIA',350000000,100,'Sedan','available'),
('LX600','LEXUS',12000000000,5,'SUV','unavailabe');

ALTER TABLE products ADD INDEX idx_productcode(productcode);

ALTER TABLE products ADD INDEX idx_nameprice(productname,productprice);

EXPLAIN SELECT * FROM products WHERE productcode = 2;

CREATE VIEW productview as SELECT productcode, productname, productprice, productstatus FROM products;

SELECT * FROM productview;

DELIMITER //

CREATE PROCEDURE getinfo()

BEGIN SELECT * FROM products; END //

DELIMITER //

CALL getinfo();

DELIMITER //

CREATE PROCEDURE addproduct(
IN icode varchar(20),
IN iname VARCHAR(50),
IN iprice BIGINT,
IN iamount INT,
IN idescription VARCHAR(100),
IN istatus VARCHAR(100)
)

BEGIN INSERT INTO products(productcode,productname,productprice,productamount,productdescription,productstatus) VALUE 
(icode,iname,iprice,iamount,idescription,istatus); END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE editproductbyid (
IN iid INT,
IN icode varchar(20),
IN iname VARCHAR(50),
IN iprice BIGINT,
IN iamount INT,
IN idescription VARCHAR(100),
IN istatus VARCHAR(100)
)

BEGIN UPDATE products
 SET productcode = icode,
     productname = iname,
     productprice= iprice,
     productamount = iamount,
     productdescription = idescription,
     productstatus = istatus
 WHERE id = iid;
 END //
 
 DELIMITER ;
 
 DELIMITER //
CREATE PROCEDURE deleteproductbyid (
IN iid INT
)

BEGIN DELETE FROM products WHERE id = iid; END //

 DELIMITER ;



