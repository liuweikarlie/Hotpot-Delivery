/* SQL DATA */



INSERT INTO admin(username,loginName,password) VALUES
('karlieliu1','karlie','11');

INSERT INTO merchant(merchantName,loginName,password,area,payee,shroffAccountNumber,text1,text2,text3,icon) VALUES
('Mcronals','MC','111','Kowloon','Alice','322904923','Close at 2am','Tel:12323232','Address:xxxxx','http://localhost:8080/f6e703e5-e192-45b0-9f70-d5d2fb4e8bb7.jpg'),
('HotpotSunday','HS','111','HK Island','Mark','323222904923','Close at 1am','Tel:12332','Address:xxxxx','http://localhost:8080/23a91720-8097-478d-9994-dac541b0b6b3.jpg'),
('Happyhot','SS','111','HK Island','David','32322212904923','Close at 1am','Tel:193332','Address:xxxxx','http://localhost:8080/c359838f-c11d-4243-a5e8-9a5080442987.jpg'),
('ChongQing Hotport','CH','111','New Territories','David','3232224923','Close at 1am','Tel:173332','Address:xxxxx','http://localhost:8080/28754e22-338d-4ca0-8be0-7dcede80d3de.jpg');


INSERT INTO category(merchantId,name) VALUES
(1,'Meat'),
(1,'Vegetable'),
(2,'Meat'),
(2,'Vegetable'),
(3,'Meat'),
(3,'Vegetable'),
(4,'Meat'),
(4,'Vegetable');
 
INSERT INTO product(merchantId,categoryId,productName,description,image,price,stock) VALUES
(1,1,'pork','fresh pork','http://localhost:8080/f97cb6d6-42f7-44a7-9ceb-3cba1fdd4b57.jpg',40,20),
(1,2,'tomato','fresh tomato','http://localhost:8080/da253070-a00f-49c7-ba22-512672822e88.jpg',10,30),
(2,3,'pork','fresh pork','http://localhost:8080/f97cb6d6-42f7-44a7-9ceb-3cba1fdd4b57.jpg',20,430),
(2,4,'tomato','fresh tomato','http://localhost:8080/da253070-a00f-49c7-ba22-512672822e88.jpg',20,430),
(2,4,'onion','fresh onion','http://localhost:8080/028de91c-abc3-4296-b9ba-9c4bf9205b5d.jpg',20,430),
(3,6,'onion','good onion','http://localhost:8080/028de91c-abc3-4296-b9ba-9c4bf9205b5d.jpg',10,430),
(3,5,'fresh ball','good fresh ball','http://localhost:8080/4e8f71da-d912-43f5-82dc-88e1674a793f.jpg',10,430),
(2,3,'fresh ball','fresh ball','http://localhost:8080/4e8f71da-d912-43f5-82dc-88e1674a793f.jpg',20,430),
(4,7,'fresh ball','fresh ball','http://localhost:8080/4e8f71da-d912-43f5-82dc-88e1674a793f.jpg',20,430),
(4,8,'potato','good potato','http://localhost:8080/56169102-2e83-4228-85db-cfd296cdf5b0.jpg',10,430),













