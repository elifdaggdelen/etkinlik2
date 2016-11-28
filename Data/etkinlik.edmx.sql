
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/28/2016 16:19:31
-- Generated from EDMX file: C:\Users\Elif\Desktop\Etkinlik\Etkinlik\Data\etkinlik.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [etkinlik];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserSet'
CREATE TABLE [dbo].[UserSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UserTypeId] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Mail] nvarchar(max)  NOT NULL,
    [Telefon] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Avatar] varbinary(max)  NOT NULL
);
GO

-- Creating table 'UserTypeSet'
CREATE TABLE [dbo].[UserTypeSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Yetki] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'KategoriSet'
CREATE TABLE [dbo].[KategoriSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [KategoriAdi] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SikayetSet'
CREATE TABLE [dbo].[SikayetSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Konu] nvarchar(max)  NOT NULL,
    [Aciklama] nvarchar(max)  NOT NULL,
    [Tarih] datetime  NOT NULL
);
GO

-- Creating table 'YorumSet'
CREATE TABLE [dbo].[YorumSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [Tarih] datetime  NOT NULL,
    [Verified] bit  NOT NULL
);
GO

-- Creating table 'EtkinlikSet'
CREATE TABLE [dbo].[EtkinlikSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Text] nvarchar(max)  NOT NULL,
    [Resim] nvarchar(max)  NOT NULL,
    [Date] datetime  NOT NULL,
    [UserId] int  NOT NULL,
    [YorumId] int  NOT NULL,
    [KategoriId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [PK_UserSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserTypeSet'
ALTER TABLE [dbo].[UserTypeSet]
ADD CONSTRAINT [PK_UserTypeSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'KategoriSet'
ALTER TABLE [dbo].[KategoriSet]
ADD CONSTRAINT [PK_KategoriSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SikayetSet'
ALTER TABLE [dbo].[SikayetSet]
ADD CONSTRAINT [PK_SikayetSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'YorumSet'
ALTER TABLE [dbo].[YorumSet]
ADD CONSTRAINT [PK_YorumSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EtkinlikSet'
ALTER TABLE [dbo].[EtkinlikSet]
ADD CONSTRAINT [PK_EtkinlikSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserTypeId] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [FK_UserTypeUser]
    FOREIGN KEY ([UserTypeId])
    REFERENCES [dbo].[UserTypeSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserTypeUser'
CREATE INDEX [IX_FK_UserTypeUser]
ON [dbo].[UserSet]
    ([UserTypeId]);
GO

-- Creating foreign key on [UserId] in table 'EtkinlikSet'
ALTER TABLE [dbo].[EtkinlikSet]
ADD CONSTRAINT [FK_UserEtkinlik]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserEtkinlik'
CREATE INDEX [IX_FK_UserEtkinlik]
ON [dbo].[EtkinlikSet]
    ([UserId]);
GO

-- Creating foreign key on [YorumId] in table 'EtkinlikSet'
ALTER TABLE [dbo].[EtkinlikSet]
ADD CONSTRAINT [FK_YorumEtkinlik]
    FOREIGN KEY ([YorumId])
    REFERENCES [dbo].[YorumSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_YorumEtkinlik'
CREATE INDEX [IX_FK_YorumEtkinlik]
ON [dbo].[EtkinlikSet]
    ([YorumId]);
GO

-- Creating foreign key on [KategoriId] in table 'EtkinlikSet'
ALTER TABLE [dbo].[EtkinlikSet]
ADD CONSTRAINT [FK_KategoriEtkinlik]
    FOREIGN KEY ([KategoriId])
    REFERENCES [dbo].[KategoriSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_KategoriEtkinlik'
CREATE INDEX [IX_FK_KategoriEtkinlik]
ON [dbo].[EtkinlikSet]
    ([KategoriId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------