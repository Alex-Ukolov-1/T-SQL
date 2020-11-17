CREATE TABLE [Договор]
(
 [Дата_договора] Date NOT NULL,
 [Тип_договора] Varchar(20) NULL,
 [Номер_договора] Int NOT NULL,
 [Номер_поставщика] Int NULL,
 [Номер_плательщика] Int NULL
)
go

CREATE INDEX [IX_Relationship18] ON [Договор] ([Номер_поставщика])
go

CREATE INDEX [IX_Relationship19] ON [Договор] ([Номер_плательщика])
go

ALTER TABLE [Договор] ADD CONSTRAINT [PK_Договор] PRIMARY KEY ([Номер_договора])
go

CREATE TABLE [Этап договора]
(
 [Номер_договора] Int NOT NULL,
 [Номер_этапа] Int NOT NULL,
 [Дата_начала] Date NOT NULL,
 [Дата окончания] Date NOT NULL,
 [Еденица_измерения] Varchar(20) NULL,
 [Сумма] Float NULL,
 [Количество] Int NULL
)
go

ALTER TABLE [Этап договора] ADD CONSTRAINT [PK_Этап договора] PRIMARY KEY ([Номер_договора],[Номер_этапа])
go

CREATE TABLE [Документ выполнения]
(
 [Номер_документа_выполнения] Int NOT NULL,
 [Дата_документа] Date NULL,
 [Тип_документа] Varchar(20) NULL,
 [Номер_валюты_выполнения] Int NULL
)
go


CREATE INDEX [IX_Relationship29] ON [Документ выполнения] ([Номер_валюты_выполнения])
go


ALTER TABLE [Документ выполнения] ADD CONSTRAINT [PK_Документ выполнения] PRIMARY KEY ([Номер_документа_выполнения])
go


CREATE TABLE [Фактура]
(
 [Позиция_фактуры] Varchar(20) NOT NULL,
 [Дата_выполнения] Date NOT NULL,
 [Сумма_выполнения] Float NULL,
 [Количество] Int NULL,
 [Номер_документа_выполнения] Int NOT NULL,
 [Номер_договора] Int NULL,
 [Номер_этапа] Int NULL
)
go


CREATE INDEX [IX_Relationship28] ON [Фактура] ([Номер_договора],[Номер_этапа])
go


ALTER TABLE [Фактура] ADD CONSTRAINT [PK_Фактура] PRIMARY KEY ([Номер_документа_выполнения])
go


CREATE TABLE [Поставщик]
(
 [Номер_поставщика] Int NOT NULL,
 [Поставщик] Varchar(20) NOT NULL,
 [Валюта] Varchar(20) NOT NULL
)
go

ALTER TABLE [Поставщик] ADD CONSTRAINT [PK_Поставщик] PRIMARY KEY ([Номер_поставщика])
go


CREATE TABLE [Плательщик]
(
 [Номер_плательщика] Int NOT NULL,
 [Плательщик] Varchar(20) NULL
)
go

ALTER TABLE [Плательщик] ADD CONSTRAINT [PK_Плательщик] PRIMARY KEY ([Номер_плательщика])
go

CREATE TABLE [Валюта_выполнения]
(
 [Номер_валюты_выполнения] Int NOT NULL,
 [Валюта_выполнения] Varchar(20) NULL
)
go


ALTER TABLE [Валюта_выполнения] ADD CONSTRAINT [PK_Валюта_выполнения] PRIMARY KEY ([Номер_валюты_выполнения])
go


ALTER TABLE [Этап договора] ADD CONSTRAINT [Relationship15] FOREIGN KEY ([Номер_договора]) REFERENCES [Договор] ([Номер_договора]) ON UPDATE CASCADE ON DELETE CASCADE
go



ALTER TABLE [Договор] ADD CONSTRAINT [Relationship18] FOREIGN KEY ([Номер_поставщика]) REFERENCES [Поставщик] ([Номер_поставщика]) ON UPDATE CASCADE ON DELETE CASCADE
go



ALTER TABLE [Договор] ADD CONSTRAINT [Relationship19] FOREIGN KEY ([Номер_плательщика]) REFERENCES [Плательщик] ([Номер_плательщика]) ON UPDATE CASCADE ON DELETE CASCADE
go



ALTER TABLE [Фактура] ADD CONSTRAINT [Relationship23] FOREIGN KEY ([Номер_документа_выполнения]) REFERENCES [Документ выполнения] ([Номер_документа_выполнения]) ON UPDATE CASCADE ON DELETE CASCADE
go



ALTER TABLE [Фактура] ADD CONSTRAINT [Relationship28] FOREIGN KEY ([Номер_договора], [Номер_этапа]) REFERENCES [Этап договора] ([Номер_договора], [Номер_этапа]) ON UPDATE CASCADE ON DELETE CASCADE
go



ALTER TABLE [Документ выполнения] ADD CONSTRAINT [Relationship29] FOREIGN KEY ([Номер_валюты_выполнения]) REFERENCES [Валюта_выполнения] ([Номер_валюты_выполнения]) ON UPDATE NO ACTION ON DELETE NO ACTION
go