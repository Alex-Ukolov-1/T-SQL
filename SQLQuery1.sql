CREATE TABLE [�������]
(
 [����_��������] Date NOT NULL,
 [���_��������] Varchar(20) NULL,
 [�����_��������] Int NOT NULL,
 [�����_����������] Int NULL,
 [�����_�����������] Int NULL
)
go

CREATE INDEX [IX_Relationship18] ON [�������] ([�����_����������])
go

CREATE INDEX [IX_Relationship19] ON [�������] ([�����_�����������])
go

ALTER TABLE [�������] ADD CONSTRAINT [PK_�������] PRIMARY KEY ([�����_��������])
go

CREATE TABLE [���� ��������]
(
 [�����_��������] Int NOT NULL,
 [�����_�����] Int NOT NULL,
 [����_������] Date NOT NULL,
 [���� ���������] Date NOT NULL,
 [�������_���������] Varchar(20) NULL,
 [�����] Float NULL,
 [����������] Int NULL
)
go

ALTER TABLE [���� ��������] ADD CONSTRAINT [PK_���� ��������] PRIMARY KEY ([�����_��������],[�����_�����])
go

CREATE TABLE [�������� ����������]
(
 [�����_���������_����������] Int NOT NULL,
 [����_���������] Date NULL,
 [���_���������] Varchar(20) NULL,
 [�����_������_����������] Int NULL
)
go


CREATE INDEX [IX_Relationship29] ON [�������� ����������] ([�����_������_����������])
go


ALTER TABLE [�������� ����������] ADD CONSTRAINT [PK_�������� ����������] PRIMARY KEY ([�����_���������_����������])
go


CREATE TABLE [�������]
(
 [�������_�������] Varchar(20) NOT NULL,
 [����_����������] Date NOT NULL,
 [�����_����������] Float NULL,
 [����������] Int NULL,
 [�����_���������_����������] Int NOT NULL,
 [�����_��������] Int NULL,
 [�����_�����] Int NULL
)
go


CREATE INDEX [IX_Relationship28] ON [�������] ([�����_��������],[�����_�����])
go


ALTER TABLE [�������] ADD CONSTRAINT [PK_�������] PRIMARY KEY ([�����_���������_����������])
go


CREATE TABLE [���������]
(
 [�����_����������] Int NOT NULL,
 [���������] Varchar(20) NOT NULL,
 [������] Varchar(20) NOT NULL
)
go

ALTER TABLE [���������] ADD CONSTRAINT [PK_���������] PRIMARY KEY ([�����_����������])
go


CREATE TABLE [����������]
(
 [�����_�����������] Int NOT NULL,
 [����������] Varchar(20) NULL
)
go

ALTER TABLE [����������] ADD CONSTRAINT [PK_����������] PRIMARY KEY ([�����_�����������])
go

CREATE TABLE [������_����������]
(
 [�����_������_����������] Int NOT NULL,
 [������_����������] Varchar(20) NULL
)
go


ALTER TABLE [������_����������] ADD CONSTRAINT [PK_������_����������] PRIMARY KEY ([�����_������_����������])
go


ALTER TABLE [���� ��������] ADD CONSTRAINT [Relationship15] FOREIGN KEY ([�����_��������]) REFERENCES [�������] ([�����_��������]) ON UPDATE CASCADE ON DELETE CASCADE
go



ALTER TABLE [�������] ADD CONSTRAINT [Relationship18] FOREIGN KEY ([�����_����������]) REFERENCES [���������] ([�����_����������]) ON UPDATE CASCADE ON DELETE CASCADE
go



ALTER TABLE [�������] ADD CONSTRAINT [Relationship19] FOREIGN KEY ([�����_�����������]) REFERENCES [����������] ([�����_�����������]) ON UPDATE CASCADE ON DELETE CASCADE
go



ALTER TABLE [�������] ADD CONSTRAINT [Relationship23] FOREIGN KEY ([�����_���������_����������]) REFERENCES [�������� ����������] ([�����_���������_����������]) ON UPDATE CASCADE ON DELETE CASCADE
go



ALTER TABLE [�������] ADD CONSTRAINT [Relationship28] FOREIGN KEY ([�����_��������], [�����_�����]) REFERENCES [���� ��������] ([�����_��������], [�����_�����]) ON UPDATE CASCADE ON DELETE CASCADE
go



ALTER TABLE [�������� ����������] ADD CONSTRAINT [Relationship29] FOREIGN KEY ([�����_������_����������]) REFERENCES [������_����������] ([�����_������_����������]) ON UPDATE NO ACTION ON DELETE NO ACTION
go