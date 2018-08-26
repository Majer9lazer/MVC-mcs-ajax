
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/26/2018 13:34:23
-- Generated from EDMX file: C:\Users\user\Source\Repos\MVC-mcs-ajax\MVC-mcs-Ajax.DAL\MCS_Db.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [MCSEntities];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_newEquipment_TablesManufacturer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[newEquipment] DROP CONSTRAINT [FK_newEquipment_TablesManufacturer];
GO
IF OBJECT_ID(N'[dbo].[FK_newEquipment_TablesModel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[newEquipment] DROP CONSTRAINT [FK_newEquipment_TablesModel];
GO
IF OBJECT_ID(N'[dbo].[FK_newTablesModel_newTablesModel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TablesModel] DROP CONSTRAINT [FK_newTablesModel_newTablesModel];
GO
IF OBJECT_ID(N'[dbo].[FK_TrackMeter_newEquipment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TrackMeter] DROP CONSTRAINT [FK_TrackMeter_newEquipment];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[newEquipment]', 'U') IS NOT NULL
    DROP TABLE [dbo].[newEquipment];
GO
IF OBJECT_ID(N'[dbo].[TablesManufacturer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TablesManufacturer];
GO
IF OBJECT_ID(N'[dbo].[TablesModel]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TablesModel];
GO
IF OBJECT_ID(N'[dbo].[TrackMeter]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TrackMeter];
GO
IF OBJECT_ID(N'[dbo].[TrackServiceHistoryPart]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TrackServiceHistoryPart];
GO
IF OBJECT_ID(N'[dbo].[TrackServiceHistoryProvider]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TrackServiceHistoryProvider];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'newEquipments'
CREATE TABLE [dbo].[newEquipments] (
    [intEquipmentID] int IDENTITY(1,1) NOT NULL,
    [intGarageRoom] nvarchar(50)  NULL,
    [intManufacturerID] int  NOT NULL,
    [intModelID] int  NOT NULL,
    [strManufYear] nvarchar(4)  NULL,
    [intSNPrefixID] int  NOT NULL,
    [strSerialNo] nvarchar(20)  NULL,
    [intEquipmentTypeID] int  NOT NULL,
    [intSMCSFamilyID] int  NOT NULL,
    [intSizeID] int  NOT NULL,
    [CreateDate] datetime  NULL,
    [intMetered] float  NOT NULL,
    [LastDate] datetime  NOT NULL,
    [intLastMetered] float  NOT NULL,
    [intTotalMetered] float  NOT NULL,
    [intlimitDay] int  NULL,
    [intlimitWeek] int  NULL,
    [bitActive] bit  NOT NULL,
    [bitPreservation] bit  NOT NULL,
    [bitMeter] bit  NOT NULL,
    [bitKTG] bit  NOT NULL,
    [isDelete] bit  NOT NULL,
    [intLocationId] int  NOT NULL,
    [strDescription] nvarchar(1050)  NULL,
    [floatCostTires] float  NULL,
    [intCostTiresCurrency] int  NULL,
    [floatAverageDivergence] float  NULL,
    [floatFullPrice] float  NULL,
    [intFullPriceCurrency] int  NULL,
    [dateStartUpDate] datetime  NULL,
    [intServiceLife] int  NULL,
    [intHoweverOddsAcceleration] int  NULL,
    [bitMethodAmortization] bit  NOT NULL
);
GO

-- Creating table 'TablesManufacturers'
CREATE TABLE [dbo].[TablesManufacturers] (
    [intManufacturerID] int IDENTITY(1,1) NOT NULL,
    [strManufacturerChecklistId] nvarchar(50)  NULL,
    [strName] nvarchar(50)  NULL
);
GO

-- Creating table 'TablesModels'
CREATE TABLE [dbo].[TablesModels] (
    [intModelID] int IDENTITY(1,1) NOT NULL,
    [strName] nvarchar(10)  NULL,
    [intManufacturerID] int  NULL,
    [intSMCSFamilyID] int  NULL,
    [strImage] nvarchar(250)  NULL
);
GO

-- Creating table 'TrackMeters'
CREATE TABLE [dbo].[TrackMeters] (
    [intMeteredId] int IDENTITY(1,1) NOT NULL,
    [intEquipmentID] int  NOT NULL,
    [dMeterDate] datetime  NOT NULL,
    [intMeterReading] float  NOT NULL,
    [intHoursHoursOperation] float  NULL,
    [intTotalMeter] float  NULL,
    [boolMeterReplaced] bit  NOT NULL,
    [intTypeMetered] int  NOT NULL,
    [intComponentId] int  NULL,
    [intLocationId] int  NULL
);
GO

-- Creating table 'TrackServiceHistoryParts'
CREATE TABLE [dbo].[TrackServiceHistoryParts] (
    [intServiceHistoryPartsId] int IDENTITY(1,1) NOT NULL,
    [intServiceHistoryId] int  NULL,
    [intMasterPartId] int  NOT NULL,
    [quantity] float  NULL,
    [unit_cost] float  NULL,
    [old_job_no] nvarchar(12)  NULL,
    [intUnitCostCurrency] int  NULL
);
GO

-- Creating table 'TrackServiceHistoryProviders'
CREATE TABLE [dbo].[TrackServiceHistoryProviders] (
    [intServiceHistoryProviderID] int IDENTITY(1,1) NOT NULL,
    [intSupplierId] int  NOT NULL,
    [intRepairLabor] float  NULL,
    [intLaborRate] float  NULL,
    [intServiceHistoryId] int  NULL,
    [old_job_no] nvarchar(12)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [intEquipmentID] in table 'newEquipments'
ALTER TABLE [dbo].[newEquipments]
ADD CONSTRAINT [PK_newEquipments]
    PRIMARY KEY CLUSTERED ([intEquipmentID] ASC);
GO

-- Creating primary key on [intManufacturerID] in table 'TablesManufacturers'
ALTER TABLE [dbo].[TablesManufacturers]
ADD CONSTRAINT [PK_TablesManufacturers]
    PRIMARY KEY CLUSTERED ([intManufacturerID] ASC);
GO

-- Creating primary key on [intModelID] in table 'TablesModels'
ALTER TABLE [dbo].[TablesModels]
ADD CONSTRAINT [PK_TablesModels]
    PRIMARY KEY CLUSTERED ([intModelID] ASC);
GO

-- Creating primary key on [intMeteredId] in table 'TrackMeters'
ALTER TABLE [dbo].[TrackMeters]
ADD CONSTRAINT [PK_TrackMeters]
    PRIMARY KEY CLUSTERED ([intMeteredId] ASC);
GO

-- Creating primary key on [intServiceHistoryPartsId] in table 'TrackServiceHistoryParts'
ALTER TABLE [dbo].[TrackServiceHistoryParts]
ADD CONSTRAINT [PK_TrackServiceHistoryParts]
    PRIMARY KEY CLUSTERED ([intServiceHistoryPartsId] ASC);
GO

-- Creating primary key on [intServiceHistoryProviderID] in table 'TrackServiceHistoryProviders'
ALTER TABLE [dbo].[TrackServiceHistoryProviders]
ADD CONSTRAINT [PK_TrackServiceHistoryProviders]
    PRIMARY KEY CLUSTERED ([intServiceHistoryProviderID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [intManufacturerID] in table 'newEquipments'
ALTER TABLE [dbo].[newEquipments]
ADD CONSTRAINT [FK_newEquipment_TablesManufacturer]
    FOREIGN KEY ([intManufacturerID])
    REFERENCES [dbo].[TablesManufacturers]
        ([intManufacturerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_newEquipment_TablesManufacturer'
CREATE INDEX [IX_FK_newEquipment_TablesManufacturer]
ON [dbo].[newEquipments]
    ([intManufacturerID]);
GO

-- Creating foreign key on [intModelID] in table 'newEquipments'
ALTER TABLE [dbo].[newEquipments]
ADD CONSTRAINT [FK_newEquipment_TablesModel]
    FOREIGN KEY ([intModelID])
    REFERENCES [dbo].[TablesModels]
        ([intModelID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_newEquipment_TablesModel'
CREATE INDEX [IX_FK_newEquipment_TablesModel]
ON [dbo].[newEquipments]
    ([intModelID]);
GO

-- Creating foreign key on [intEquipmentID] in table 'TrackMeters'
ALTER TABLE [dbo].[TrackMeters]
ADD CONSTRAINT [FK_TrackMeter_newEquipment]
    FOREIGN KEY ([intEquipmentID])
    REFERENCES [dbo].[newEquipments]
        ([intEquipmentID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TrackMeter_newEquipment'
CREATE INDEX [IX_FK_TrackMeter_newEquipment]
ON [dbo].[TrackMeters]
    ([intEquipmentID]);
GO

-- Creating foreign key on [intManufacturerID] in table 'TablesModels'
ALTER TABLE [dbo].[TablesModels]
ADD CONSTRAINT [FK_newTablesModel_newTablesModel]
    FOREIGN KEY ([intManufacturerID])
    REFERENCES [dbo].[TablesManufacturers]
        ([intManufacturerID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_newTablesModel_newTablesModel'
CREATE INDEX [IX_FK_newTablesModel_newTablesModel]
ON [dbo].[TablesModels]
    ([intManufacturerID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------