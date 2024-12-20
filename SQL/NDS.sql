USE [NDS]
CREATE TABLE [dbo].[hocsinh](
	[MaHS_SK] [int] IDENTITY(1,1) NOT NULL,
	[MaHS_NK] [char](4) NULL,
	[Hovaten] [nvarchar](20) NULL,
	[ngaysinh] [date] NULL,
	[gioitinh] [nvarchar](3) NULL,
	[malopSK] [int] NULL,
	[updatedDate] [datetime] NULL,
	[createdDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHS_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[lop_hoc_nds](
	[MaLop_SK] [int] IDENTITY(1,1) NOT NULL,
	[MaLop_NK] [char](2) NULL,
	[tenlop] [varchar](10) NULL,
	[siso] [tinyint] NULL,
	[createdDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLop_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[hocsinh] ADD  DEFAULT (getdate()) FOR [updatedDate]
GO
ALTER TABLE [dbo].[hocsinh] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[lop_hoc_nds] ADD  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[lop_hoc_nds] ADD  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[hocsinh]  WITH CHECK ADD FOREIGN KEY([malopSK])
REFERENCES [dbo].[lop_hoc_nds] ([MaLop_SK])
GO
