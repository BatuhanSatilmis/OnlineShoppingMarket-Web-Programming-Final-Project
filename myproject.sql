SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


--
-- Database: `myproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `featured` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` VALUES (1,'One plus 8t','7850','mobiles','yes','img/oneplus-8t.jpg'),(2,'Iphone 12','11080','mobiles','no','img/iphone-12.jpg'),(3,'Oppo findx','4600','mobiles','no','img/pocophone-f1.jpg'),(4,'Samsung Note20','10200','mobiles','yes','img/samsung-s10.jpg'),(5,'Macbook Air Ultrabook','12400','laptops','yes','img/macbook-air.jpg'),(6,'Asus Rog Gamebook','9200','laptops','no','img/asus-rog.jpg'),(7,'HP Pavilion Ultrabook','6200','laptops','no','img/hp-pavilion.png'),(8,'Acer Predator Gamebook','7600','laptops','yes','img/acer-predator.jpg'),(9,'Blue Jeans','75','clothing','no','img/jeans.jpg'),(10,'Shirts','60','clothing','yes','img/shirts.jpg'),(11,'T-Shirt','40','clothing','no','img/t-shirt.jpg'),(12,'Sweatshirt','55','clothing','no','img/sweatshirt.jpg'),(13,'Tablature','120','home decor','no','img/painting.jpg'),(14,'Wall Shelf','240','home decor','yes','img/wall-shelf.jpg'),(18,'Wall Clock','45','home decor','no','img/clock.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;COMMIT;

INSERT INTO `user` VALUES (24,'batuhan','bakirkoy','afrousse1998@gmail.com','Batu','1234'),(25,'Enes','kucukcekmece','enes@gmail.com','Enes','1234'),(26,'ilhan','bakirkoy','ilhan@gmail.com','ilhan05','1234'),(27,'batus','bakirkoy','afrousse1999@gmail.com','batus','123456'),(28,'adem ozyavas','bilinmiyor','ademhoca@gmail.com','ademozyavas','123456'),(29,'batuhan','istanbul','afrousse1998@gmail.com','batu05','123456'),(30,'admin','turkey','admin@hotmail.com','admin','1327'),(31,'batuhan','bakirkoy','afrousse1998@gmail.com','Batu','1234');