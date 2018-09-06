CREATE TABLE `Employees` ( 
  `EmployeeId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `DeptId` INTEGER NOT NULL,
  `FirstName` TEXT,
  `LastName` TEXT,
  `Supervisor` BIT,
  FOREIGN KEY (`DeptId`) REFERENCES `Departments`(`DeptId`)
);
 
CREATE TABLE `EmployeesTrainingPrograms` (
	`EmployeesTrainingProgramsId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`EmployeeId` INTEGER NOT NULL,
	`TrainingProgramId` INTEGER NOT NULL,
	 FOREIGN KEY (`EmployeeId`) REFERENCES `Employees`(`EmployeeId`)
	 FOREIGN KEY (`TrainingProgramId`) REFERENCES `TrainingPrograms`(`TrainingProgramId`)
);


CREATE TABLE `TrainingPrograms` (
`TrainingProgramId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
`EmployeeId` INTEGER NOT NULL,
`Name` TEXT,
`StartDate` TEXT NOT NULL,
`EndDate` TEXT NOT NULL,
`MaxAttendees` INTEGER NOT NULL,
 FOREIGN KEY (`EmployeeId`) REFERENCES `Employees`(`EmployeeId`)
 );
 
 CREATE TABLE `EmployeeComputers` (
 `EmployeeComputerId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
 `EmployeeId` INTEGER NOT NULL,
 `ComputerId` INTEGER NOT NULL,
  FOREIGN KEY (`EmployeeId`) REFERENCES `Employees`(`EmployeeId`),
  FOREIGN KEY (`ComputerId`) REFERENCES `Computers`(`ComputerId`)
 );
 

 
 CREATE TABLE `Departments` (
 `DeptId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
 `Title` TEXT,
 `Budget` INTEGER
 );
 
 
 CREATE TABLE `Computers` (
 `ComputerId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
 `EmployeeId` INTEGER NOT NULL,
 `DatePurchased` TEXT,
 `DateDecommissioned` TEXT,
 `DateManufactured` TEXT,
  FOREIGN KEY (`EmployeeId`) REFERENCES `Employees`(`EmployeeId`)
 );


 -- External
 CREATE TABLE `ProductTypes` (
 `ProductTypesId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
 `ProductId` INTEGER NOT NULL,
 `Category` TEXT,
 FOREIGN KEY (`ProductId`) REFERENCES `Products`(`ProductId`)
 );
  
 CREATE TABLE `Products` (
 `ProductId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
 `Price` INTEGER,
 `Title` TEXT,
 `Description` TEXT,
 `Quanitity` INTEGER
 );

 
 CREATE TABLE `OrdersProducts` (
 `OrdersProductsId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
 `ProductId` INTEGER,
 `OrderId` INTEGER,
  FOREIGN KEY (`ProductId`) REFERENCES `Products`(`ProductId`),
  FOREIGN KEY (`OrderId`) REFERENCES `Orders`(`OrderId`)
  );

  CREATE TABLE `Customers` (
  `CustomerId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `FirstName` TEXT,
  `LastName` TEXT,
  `AccountCreatedDate` TEXT,
  `InteractDate` TEXT
  );

  CREATE TABLE `Orders` (
  `OrderId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `PaymentId` INTEGER NOT NULL,
  `CustomerId` INTEGER NOT NULL,
  `OrderDate` TEXT,
   FOREIGN KEY (`PaymentId`) REFERENCES `Payment`(`PaymentId`),
   FOREIGN KEY (`CustomerId`) REFERENCES `Customers`(`CustomerId`)
   );
   
   CREATE TABLE `Payment` (
   `PaymentId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
   `CustomerId` INTEGER,
	`AccountNumber` INTEGER NOT NULL,
	`PaymentType` TEXT NOT NULL,
	 FOREIGN KEY (`CustomerId`) REFERENCES `Customers`(`CustomerId`)
	 );

	
 INSERT INTO Departments VALUES (null, 'IT Department', 234);
 INSERT INTO Departments VALUES (null, 'Creative Department', 2356);
 INSERT INTO Departments VALUES (null, 'Music Department', 2342);
 
 INSERT INTO Employees VALUES (null, 2 , 'Emily','Venturino', 0);
 INSERT INTO Employees VALUES (null, 1, 'Jane', 'Collins', 1);
 INSERT INTO Employees VALUES (null, 1, 'John', 'Johns', 0);
 
 INSERT INTO Computers VALUES (null, 1, '02/12/12', '2/12/14','1/12/12');
 INSERT INTO Computers VALUES (null, 2, '12/22/14', '10/12/16','1/12/12');
 INSERT INTO Computers VALUES (null, 2, '2/22/12', '10/22/15','11/22/13');
 
  INSERT INTO TrainingPrograms VALUES (null, 2, "IT Training",'10/14/17', '10/12/17',100);
  INSERT INTO TrainingPrograms VALUES (null, 1, "Creative Training",'10/14/17', '10/16/17',100);
  INSERT INTO TrainingPrograms VALUES (null, 3, "Music Training",'10/14/17', '10/15/17',100);
  
  INSERT INTO EmployeesTrainingPrograms VALUES (null, 2, 3);
  INSERT INTO EmployeesTrainingPrograms VALUES (null, 1, 2);
  INSERT INTO EmployeesTrainingPrograms VALUES (null, 2, 1);

   INSERT INTO EmployeeComputers VALUES (null, 2, 1);
   INSERT INTO EmployeeComputers VALUES (null, 1, 2);
   INSERT INTO EmployeeComputers VALUES (null, 3, 3);
   
    INSERT INTO Products VALUES (null, 24, 'Apples','Red Delicious Apples',323);
	INSERT INTO Products VALUES (null, 14, 'Grapes','Red Grapes',233);
	INSERT INTO Products VALUES (null, 24, 'Pineapples','Fresh Pineapples',233);
	
	 INSERT INTO ProductTypes VALUES (null, 1, 'Fruit');
	 INSERT INTO ProductTypes VALUES (null, 2, 'Fruit');
	 INSERT INTO ProductTypes VALUES (null, 3, 'Fruit');

	 INSERT INTO Customers VALUES (null, 'Jane','Apple','12/14/16','1/12/16');  
	 INSERT INTO Customers VALUES (null, 'Tim','Harley','12/20/16','1/10/16');  
	 INSERT INTO Customers VALUES (null, 'Alexa','Jims','12/14/16','1/20/16');  
	 
	 INSERT INTO Payment VALUES (null, 1, 23245323432 ,'MasterCard');
	 INSERT INTO Payment VALUES (null, 1, 12312434663 ,'Discover');
	 INSERT INTO Payment VALUES (null, 2, 52324562343 ,'Visa');
	 
	 INSERT INTO Orders VALUES (null, 1, 2 , "12/12/16");
	 INSERT INTO Orders VALUES (null, 2, 1 , "12/22/16");
	 INSERT INTO Orders VALUES (null, 3, 2 , "12/10/16");
	 
	 INSERT INTO OrdersProducts VALUES (null, 1, 2);
	 INSERT INTO OrdersProducts VALUES (null, 2, 2);
	 INSERT INTO OrdersProducts VALUES (null, 3, 1);

