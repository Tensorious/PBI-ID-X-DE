CREATE DATABASE DWH_Project
GO

USE DWH_Project
GO

-- Create Table DimCustomer with PK CustomerID
CREATE TABLE dbo.DimCustomer (
	CustomerID [int] NOT NULL,
	FirstName [varchar](50) NOT NULL,
	LastName [varchar](50) NOT NULL,
	Age [int] NOT NULL,
	Gender [varchar](50) NOT NULL,
	City [varchar](50) NOT NULL,
	NoHP [varchar](50) NOT NULL,
	CONSTRAINT PK_CustomerID PRIMARY KEY (CustomerID ASC))
GO

--Create Table DimProduct with PK ProductID
CREATE TABLE dbo.DimProduct (
	ProductID [int] NOT NULL,
	ProductName [varchar](255) NOT NULL,
	ProductCategory [varchar](255) NOT NULL,
	ProductUnitPrice [int] NOT NULL,
	CONSTRAINT PK_ProductID PRIMARY KEY (ProductID ASC))
GO

--Create Table DimStatusOrder with PK StatusID
CREATE TABLE dbo.DimStatusOrder (
	StatusID [int] NOT NULL,
	StatusOrder [varchar](50) NOT NULL,
	StatusOrderDesc [varchar](50) NOT NULL,
	CONSTRAINT PK_StatusID PRIMARY KEY (StatusID ASC))
GO

/*Create Table FactSalesOrder with PK OrderID, 
FK CustomerID, FK ProductID, FK StatusID*/
CREATE TABLE dbo.FactSalesOrder (
	OrderID [int] NOT NULL,
	CustomerID [int] NOT NULL,
	ProductID [int] NOT NULL,
	Quantity [int] NOT NULL,
	Amount [int] NOT NULL,
	StatusID [int] NOT NULL,
	OrderDate [int] NOT NULL,
	CONSTRAINT PK_OrderID PRIMARY KEY (OrderID ASC),
	CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) REFERENCES dbo.DimCustomer(CustomerID),
	CONSTRAINT FK_ProductID FOREIGN KEY (ProductID) REFERENCES dbo.DimProduct(ProductID),
	CONSTRAINT FK_StatusID FOREIGN KEY (StatusID)  REFERENCES dbo.DimStatusOrder(StatusID))
GO
