
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/04/2025 13:26:38
-- Generated from EDMX file: C:\Users\LATITUDE\Desktop\BE\23dh171095_MyStore\23dh171095_MyStore\Models\MyStoreModel1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Mystore];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Pro_Category]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Products] DROP CONSTRAINT [FK_Pro_Category];
GO
IF OBJECT_ID(N'[dbo].[FK__Order__CustomerI__2E1BDC42]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK__Order__CustomerI__2E1BDC42];
GO
IF OBJECT_ID(N'[dbo].[FK_User_Customer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Customers] DROP CONSTRAINT [FK_User_Customer];
GO
IF OBJECT_ID(N'[dbo].[FK__OrderDeta__Order__31EC6D26]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK__OrderDeta__Order__31EC6D26];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductProDetail]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProDetails] DROP CONSTRAINT [FK_ProductProDetail];
GO
IF OBJECT_ID(N'[dbo].[FK_SupplierProDetail]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProDetails] DROP CONSTRAINT [FK_SupplierProDetail];
GO
IF OBJECT_ID(N'[dbo].[FK_ColorProDetail]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProDetails] DROP CONSTRAINT [FK_ColorProDetail];
GO
IF OBJECT_ID(N'[dbo].[FK_ProDetailOrderDetail]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [FK_ProDetailOrderDetail];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[Customers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Customers];
GO
IF OBJECT_ID(N'[dbo].[Orders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Orders];
GO
IF OBJECT_ID(N'[dbo].[OrderDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderDetails];
GO
IF OBJECT_ID(N'[dbo].[Products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Products];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Colors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Colors];
GO
IF OBJECT_ID(N'[dbo].[Suppliers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Suppliers];
GO
IF OBJECT_ID(N'[dbo].[ProDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProDetails];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [CategoryID] int IDENTITY(1,1) NOT NULL,
    [CategoryName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Customers'
CREATE TABLE [dbo].[Customers] (
    [CustomerID] int IDENTITY(1,1) NOT NULL,
    [CustomerName] nvarchar(max)  NOT NULL,
    [CustomerPhone] nvarchar(15)  NOT NULL,
    [CustomerEmail] nvarchar(max)  NULL,
    [CustomerAddress] nvarchar(max)  NULL,
    [Username] nvarchar(255)  NOT NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [OrderID] int IDENTITY(1,1) NOT NULL,
    [CustomerID] int  NOT NULL,
    [OrderDate] datetime  NOT NULL,
    [TotalAmount] decimal(18,2)  NOT NULL,
    [PaymentStatus] nvarchar(max)  NULL,
    [AddressDelivery] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'OrderDetails'
CREATE TABLE [dbo].[OrderDetails] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [ProductID] int  NOT NULL,
    [OrderID] int  NOT NULL,
    [Quantity] int  NOT NULL,
    [UnitPrice] decimal(18,2)  NOT NULL,
    [ProDetailProDetID] int  NOT NULL
);
GO

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [ProductID] int IDENTITY(1,1) NOT NULL,
    [CategoryID] int  NOT NULL,
    [ProductName] nvarchar(max)  NOT NULL,
    [ProductPrice] decimal(18,2)  NOT NULL,
    [ProductImage] nvarchar(max)  NULL,
    [ProductDescription] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Username] nvarchar(255)  NOT NULL,
    [Password] nchar(50)  NOT NULL,
    [UserRole] nchar(1)  NOT NULL
);
GO

-- Creating table 'Colors'
CREATE TABLE [dbo].[Colors] (
    [ColorId] int IDENTITY(1,1) NOT NULL,
    [ColorName] nvarchar(max)  NOT NULL,
    [RGB] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Suppliers'
CREATE TABLE [dbo].[Suppliers] (
    [SupID] int IDENTITY(1,1) NOT NULL,
    [SupName] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ProDetails'
CREATE TABLE [dbo].[ProDetails] (
    [ProDetID] int IDENTITY(1,1) NOT NULL,
    [Price] decimal(18,0)  NOT NULL,
    [RemainQuantity] int  NOT NULL,
    [SoldQuantity] int  NOT NULL,
    [ViewQuantity] int  NOT NULL,
    [ProductProductID] int  NOT NULL,
    [SupplierSupID] int  NOT NULL,
    [ColorColorId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CategoryID] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([CategoryID] ASC);
GO

-- Creating primary key on [CustomerID] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [PK_Customers]
    PRIMARY KEY CLUSTERED ([CustomerID] ASC);
GO

-- Creating primary key on [OrderID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([OrderID] ASC);
GO

-- Creating primary key on [ID] in table 'OrderDetails'
ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT [PK_OrderDetails]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ProductID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([ProductID] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [Username] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Username] ASC);
GO

-- Creating primary key on [ColorId] in table 'Colors'
ALTER TABLE [dbo].[Colors]
ADD CONSTRAINT [PK_Colors]
    PRIMARY KEY CLUSTERED ([ColorId] ASC);
GO

-- Creating primary key on [SupID] in table 'Suppliers'
ALTER TABLE [dbo].[Suppliers]
ADD CONSTRAINT [PK_Suppliers]
    PRIMARY KEY CLUSTERED ([SupID] ASC);
GO

-- Creating primary key on [ProDetID] in table 'ProDetails'
ALTER TABLE [dbo].[ProDetails]
ADD CONSTRAINT [PK_ProDetails]
    PRIMARY KEY CLUSTERED ([ProDetID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CategoryID] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_Pro_Category]
    FOREIGN KEY ([CategoryID])
    REFERENCES [dbo].[Categories]
        ([CategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Pro_Category'
CREATE INDEX [IX_FK_Pro_Category]
ON [dbo].[Products]
    ([CategoryID]);
GO

-- Creating foreign key on [CustomerID] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK__Order__CustomerI__2E1BDC42]
    FOREIGN KEY ([CustomerID])
    REFERENCES [dbo].[Customers]
        ([CustomerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Order__CustomerI__2E1BDC42'
CREATE INDEX [IX_FK__Order__CustomerI__2E1BDC42]
ON [dbo].[Orders]
    ([CustomerID]);
GO

-- Creating foreign key on [Username] in table 'Customers'
ALTER TABLE [dbo].[Customers]
ADD CONSTRAINT [FK_User_Customer]
    FOREIGN KEY ([Username])
    REFERENCES [dbo].[Users]
        ([Username])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_User_Customer'
CREATE INDEX [IX_FK_User_Customer]
ON [dbo].[Customers]
    ([Username]);
GO

-- Creating foreign key on [OrderID] in table 'OrderDetails'
ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT [FK__OrderDeta__Order__31EC6D26]
    FOREIGN KEY ([OrderID])
    REFERENCES [dbo].[Orders]
        ([OrderID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__OrderDeta__Order__31EC6D26'
CREATE INDEX [IX_FK__OrderDeta__Order__31EC6D26]
ON [dbo].[OrderDetails]
    ([OrderID]);
GO

-- Creating foreign key on [ProductProductID] in table 'ProDetails'
ALTER TABLE [dbo].[ProDetails]
ADD CONSTRAINT [FK_ProductProDetail]
    FOREIGN KEY ([ProductProductID])
    REFERENCES [dbo].[Products]
        ([ProductID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductProDetail'
CREATE INDEX [IX_FK_ProductProDetail]
ON [dbo].[ProDetails]
    ([ProductProductID]);
GO

-- Creating foreign key on [SupplierSupID] in table 'ProDetails'
ALTER TABLE [dbo].[ProDetails]
ADD CONSTRAINT [FK_SupplierProDetail]
    FOREIGN KEY ([SupplierSupID])
    REFERENCES [dbo].[Suppliers]
        ([SupID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SupplierProDetail'
CREATE INDEX [IX_FK_SupplierProDetail]
ON [dbo].[ProDetails]
    ([SupplierSupID]);
GO

-- Creating foreign key on [ColorColorId] in table 'ProDetails'
ALTER TABLE [dbo].[ProDetails]
ADD CONSTRAINT [FK_ColorProDetail]
    FOREIGN KEY ([ColorColorId])
    REFERENCES [dbo].[Colors]
        ([ColorId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ColorProDetail'
CREATE INDEX [IX_FK_ColorProDetail]
ON [dbo].[ProDetails]
    ([ColorColorId]);
GO

-- Creating foreign key on [ProDetailProDetID] in table 'OrderDetails'
ALTER TABLE [dbo].[OrderDetails]
ADD CONSTRAINT [FK_ProDetailOrderDetail]
    FOREIGN KEY ([ProDetailProDetID])
    REFERENCES [dbo].[ProDetails]
        ([ProDetID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProDetailOrderDetail'
CREATE INDEX [IX_FK_ProDetailOrderDetail]
ON [dbo].[OrderDetails]
    ([ProDetailProDetID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------