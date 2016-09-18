
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/18/2016 19:09:25
-- Generated from EDMX file: C:\Users\Fede VM\Desktop\Proyectos\ModuloConManu\ModuloDeSeguridad-GitHub\ModuloDeSeguridad\DataAccess\DataBase.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ModuloDeSeguridad];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AccionCasoDeUso]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Acciones] DROP CONSTRAINT [FK_AccionCasoDeUso];
GO
IF OBJECT_ID(N'[dbo].[FK_GrupoAccion_Accion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[GrupoAccion] DROP CONSTRAINT [FK_GrupoAccion_Accion];
GO
IF OBJECT_ID(N'[dbo].[FK_GrupoAccion_Grupo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[GrupoAccion] DROP CONSTRAINT [FK_GrupoAccion_Grupo];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioGrupo_Grupo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UsuarioGrupo] DROP CONSTRAINT [FK_UsuarioGrupo_Grupo];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioGrupo_Usuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UsuarioGrupo] DROP CONSTRAINT [FK_UsuarioGrupo_Usuario];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Acciones]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Acciones];
GO
IF OBJECT_ID(N'[dbo].[CasosDeUso]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CasosDeUso];
GO
IF OBJECT_ID(N'[dbo].[GrupoAccion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GrupoAccion];
GO
IF OBJECT_ID(N'[dbo].[Grupos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Grupos];
GO
IF OBJECT_ID(N'[dbo].[UsuarioGrupo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UsuarioGrupo];
GO
IF OBJECT_ID(N'[dbo].[Usuarios]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usuarios];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Usuarios'
CREATE TABLE [dbo].[Usuarios] (
    [IdUsuario] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Apellido] nvarchar(max)  NOT NULL,
    [NombreUsuario] nvarchar(max)  NOT NULL,
    [Clave] nvarchar(max)  NOT NULL,
    [Mail] nvarchar(max)  NOT NULL,
    [Estado] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Grupos'
CREATE TABLE [dbo].[Grupos] (
    [IdGrupo] int IDENTITY(1,1) NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Acciones'
CREATE TABLE [dbo].[Acciones] (
    [IdAccion] int IDENTITY(1,1) NOT NULL,
    [Descrpcion] nvarchar(max)  NOT NULL,
    [SubMenu] bit  NOT NULL,
    [CasoDeUso_IdCasoUso] int  NOT NULL
);
GO

-- Creating table 'CasosDeUso'
CREATE TABLE [dbo].[CasosDeUso] (
    [IdCasoUso] int IDENTITY(1,1) NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [Controller] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'UsuarioGrupo'
CREATE TABLE [dbo].[UsuarioGrupo] (
    [Usuario_IdUsuario] int  NOT NULL,
    [Grupo_IdGrupo] int  NOT NULL
);
GO

-- Creating table 'GrupoAccion'
CREATE TABLE [dbo].[GrupoAccion] (
    [Grupo_IdGrupo] int  NOT NULL,
    [Accion_IdAccion] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdUsuario] in table 'Usuarios'
ALTER TABLE [dbo].[Usuarios]
ADD CONSTRAINT [PK_Usuarios]
    PRIMARY KEY CLUSTERED ([IdUsuario] ASC);
GO

-- Creating primary key on [IdGrupo] in table 'Grupos'
ALTER TABLE [dbo].[Grupos]
ADD CONSTRAINT [PK_Grupos]
    PRIMARY KEY CLUSTERED ([IdGrupo] ASC);
GO

-- Creating primary key on [IdAccion] in table 'Acciones'
ALTER TABLE [dbo].[Acciones]
ADD CONSTRAINT [PK_Acciones]
    PRIMARY KEY CLUSTERED ([IdAccion] ASC);
GO

-- Creating primary key on [IdCasoUso] in table 'CasosDeUso'
ALTER TABLE [dbo].[CasosDeUso]
ADD CONSTRAINT [PK_CasosDeUso]
    PRIMARY KEY CLUSTERED ([IdCasoUso] ASC);
GO

-- Creating primary key on [Usuario_IdUsuario], [Grupo_IdGrupo] in table 'UsuarioGrupo'
ALTER TABLE [dbo].[UsuarioGrupo]
ADD CONSTRAINT [PK_UsuarioGrupo]
    PRIMARY KEY CLUSTERED ([Usuario_IdUsuario], [Grupo_IdGrupo] ASC);
GO

-- Creating primary key on [Grupo_IdGrupo], [Accion_IdAccion] in table 'GrupoAccion'
ALTER TABLE [dbo].[GrupoAccion]
ADD CONSTRAINT [PK_GrupoAccion]
    PRIMARY KEY CLUSTERED ([Grupo_IdGrupo], [Accion_IdAccion] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Usuario_IdUsuario] in table 'UsuarioGrupo'
ALTER TABLE [dbo].[UsuarioGrupo]
ADD CONSTRAINT [FK_UsuarioGrupo_Usuario]
    FOREIGN KEY ([Usuario_IdUsuario])
    REFERENCES [dbo].[Usuarios]
        ([IdUsuario])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Grupo_IdGrupo] in table 'UsuarioGrupo'
ALTER TABLE [dbo].[UsuarioGrupo]
ADD CONSTRAINT [FK_UsuarioGrupo_Grupo]
    FOREIGN KEY ([Grupo_IdGrupo])
    REFERENCES [dbo].[Grupos]
        ([IdGrupo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioGrupo_Grupo'
CREATE INDEX [IX_FK_UsuarioGrupo_Grupo]
ON [dbo].[UsuarioGrupo]
    ([Grupo_IdGrupo]);
GO

-- Creating foreign key on [Grupo_IdGrupo] in table 'GrupoAccion'
ALTER TABLE [dbo].[GrupoAccion]
ADD CONSTRAINT [FK_GrupoAccion_Grupo]
    FOREIGN KEY ([Grupo_IdGrupo])
    REFERENCES [dbo].[Grupos]
        ([IdGrupo])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Accion_IdAccion] in table 'GrupoAccion'
ALTER TABLE [dbo].[GrupoAccion]
ADD CONSTRAINT [FK_GrupoAccion_Accion]
    FOREIGN KEY ([Accion_IdAccion])
    REFERENCES [dbo].[Acciones]
        ([IdAccion])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_GrupoAccion_Accion'
CREATE INDEX [IX_FK_GrupoAccion_Accion]
ON [dbo].[GrupoAccion]
    ([Accion_IdAccion]);
GO

-- Creating foreign key on [CasoDeUso_IdCasoUso] in table 'Acciones'
ALTER TABLE [dbo].[Acciones]
ADD CONSTRAINT [FK_AccionCasoDeUso]
    FOREIGN KEY ([CasoDeUso_IdCasoUso])
    REFERENCES [dbo].[CasosDeUso]
        ([IdCasoUso])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AccionCasoDeUso'
CREATE INDEX [IX_FK_AccionCasoDeUso]
ON [dbo].[Acciones]
    ([CasoDeUso_IdCasoUso]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------