USE [master]
GO
/****** Object:  Database [J3_L_P0013]    Script Date: 7/12/2022 1:04:14 PM ******/
CREATE DATABASE [Assignment]
GO
USE [Assignment]
GO
/****** Object:  Table [dbo].[tblBill]    Script Date: 7/12/2022 1:04:14 PM ******/

CREATE TABLE [dbo].[tblBill](
	[id] [varchar](50) NOT NULL,
	[userID] [varchar](50) NOT NULL,
	[total] [int] NOT NULL,
	[paymentMethod] [bit] NOT NULL,
	[createDate] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblBill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBillDetail]    Script Date: 7/12/2022 1:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBillDetail](
	[id] [varchar](50) NOT NULL,
	[billID] [varchar](50) NOT NULL,
	[productID] [varchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [int] NOT NULL,
 CONSTRAINT [PK_tblBillDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 7/12/2022 1:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[id] [varchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLog]    Script Date: 7/12/2022 1:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLog](
	[id] [varchar](50) NOT NULL,
	[userID] [varchar](50) NOT NULL,
	[productID] [varchar](50) NOT NULL,
	[time] [varchar](50) NOT NULL,
	[activity] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblUpdateLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 7/12/2022 1:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[id] [varchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[imageLink] [varchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[createDate] [varchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[categoryID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 7/12/2022 1:04:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[id] [varchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phoneNumber] [varchar](11) NOT NULL,
	[isAdmin] [bit] NOT NULL,
	[address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[tblBill] ([id], [userID], [total], [paymentMethod], [createDate]) VALUES (N'1', N'115207145220650726058', 74, 0, N'2021-01-23')
INSERT [dbo].[tblBill] ([id], [userID], [total], [paymentMethod], [createDate]) VALUES (N'10', N'103055757365377277355', 1, 1, N'2021-11-02')
INSERT [dbo].[tblBill] ([id], [userID], [total], [paymentMethod], [createDate]) VALUES (N'11', N'103055757365377277355', 5, 1, N'2021-11-04')
INSERT [dbo].[tblBill] ([id], [userID], [total], [paymentMethod], [createDate]) VALUES (N'12', N'103055757365377277355', 34, 1, N'2021-11-05')
INSERT [dbo].[tblBill] ([id], [userID], [total], [paymentMethod], [createDate]) VALUES (N'13', N'103055757365377277355', 45, 1, N'2021-11-06')
INSERT [dbo].[tblBill] ([id], [userID], [total], [paymentMethod], [createDate]) VALUES (N'14', N'103055757365377277355', 19, 1, N'2021-11-06')
INSERT [dbo].[tblBill] ([id], [userID], [total], [paymentMethod], [createDate]) VALUES (N'15', N'103055757365377277355', 22, 0, N'2021-11-06')
INSERT [dbo].[tblBill] ([id], [userID], [total], [paymentMethod], [createDate]) VALUES (N'16', N'103055757365377277355', 20, 1, N'2021-11-07')
INSERT [dbo].[tblBill] ([id], [userID], [total], [paymentMethod], [createDate]) VALUES (N'17', N'103055757365377277355', 15, 1, N'2021-11-07')
INSERT [dbo].[tblBill] ([id], [userID], [total], [paymentMethod], [createDate]) VALUES (N'18', N'103055757365377277355', 30, 1, N'2021-11-08')
INSERT [dbo].[tblBill] ([id], [userID], [total], [paymentMethod], [createDate]) VALUES (N'19', N'103055757365377277355', 29, 1, N'2021-11-08')
INSERT [dbo].[tblBill] ([id], [userID], [total], [paymentMethod], [createDate]) VALUES (N'2', N'115207145220650726058', 21, 0, N'2021-01-23')
INSERT [dbo].[tblBill] ([id], [userID], [total], [paymentMethod], [createDate]) VALUES (N'20', N'103055757365377277355', 6, 0, N'2022-06-28')
INSERT [dbo].[tblBill] ([id], [userID], [total], [paymentMethod], [createDate]) VALUES (N'3', N'115207145220650726058', 8, 1, N'2021-01-23')
INSERT [dbo].[tblBill] ([id], [userID], [total], [paymentMethod], [createDate]) VALUES (N'4', N'115207145220650726058', 28, 1, N'2021-01-23')
INSERT [dbo].[tblBill] ([id], [userID], [total], [paymentMethod], [createDate]) VALUES (N'5', N'115207145220650726059', 23, 0, N'2021-10-27')
INSERT [dbo].[tblBill] ([id], [userID], [total], [paymentMethod], [createDate]) VALUES (N'6', N'115207145220650726059', 35, 1, N'2021-10-27')
INSERT [dbo].[tblBill] ([id], [userID], [total], [paymentMethod], [createDate]) VALUES (N'7', N'115207145220650726059', 2, 1, N'2021-10-27')
INSERT [dbo].[tblBill] ([id], [userID], [total], [paymentMethod], [createDate]) VALUES (N'8', N'115207145220650726059', 5, 1, N'2021-10-27')
INSERT [dbo].[tblBill] ([id], [userID], [total], [paymentMethod], [createDate]) VALUES (N'9', N'115207145220650726059', 5, 1, N'2021-10-27')
GO
INSERT [dbo].[tblBillDetail] ([id], [billID], [productID], [quantity], [price]) VALUES (N'19', N'7', N'12', 1, 2)
INSERT [dbo].[tblBillDetail] ([id], [billID], [productID], [quantity], [price]) VALUES (N'20', N'8', N'12', 1, 5)
INSERT [dbo].[tblBillDetail] ([id], [billID], [productID], [quantity], [price]) VALUES (N'21', N'9', N'12', 1, 5)
INSERT [dbo].[tblBillDetail] ([id], [billID], [productID], [quantity], [price]) VALUES (N'22', N'10', N'47', 1, 1)
INSERT [dbo].[tblBillDetail] ([id], [billID], [productID], [quantity], [price]) VALUES (N'23', N'11', N'12', 1, 5)
INSERT [dbo].[tblBillDetail] ([id], [billID], [productID], [quantity], [price]) VALUES (N'24', N'12', N'14', 1, 15)
INSERT [dbo].[tblBillDetail] ([id], [billID], [productID], [quantity], [price]) VALUES (N'25', N'12', N'35', 1, 19)
INSERT [dbo].[tblBillDetail] ([id], [billID], [productID], [quantity], [price]) VALUES (N'26', N'13', N'35', 1, 19)
INSERT [dbo].[tblBillDetail] ([id], [billID], [productID], [quantity], [price]) VALUES (N'27', N'13', N'30', 1, 26)
INSERT [dbo].[tblBillDetail] ([id], [billID], [productID], [quantity], [price]) VALUES (N'28', N'14', N'22', 1, 19)
INSERT [dbo].[tblBillDetail] ([id], [billID], [productID], [quantity], [price]) VALUES (N'29', N'15', N'49', 2, 11)
INSERT [dbo].[tblBillDetail] ([id], [billID], [productID], [quantity], [price]) VALUES (N'30', N'16', N'17', 1, 10)
INSERT [dbo].[tblBillDetail] ([id], [billID], [productID], [quantity], [price]) VALUES (N'31', N'16', N'15', 1, 10)
INSERT [dbo].[tblBillDetail] ([id], [billID], [productID], [quantity], [price]) VALUES (N'32', N'17', N'12', 1, 5)
INSERT [dbo].[tblBillDetail] ([id], [billID], [productID], [quantity], [price]) VALUES (N'33', N'17', N'18', 1, 10)
INSERT [dbo].[tblBillDetail] ([id], [billID], [productID], [quantity], [price]) VALUES (N'34', N'18', N'21', 1, 30)
INSERT [dbo].[tblBillDetail] ([id], [billID], [productID], [quantity], [price]) VALUES (N'36', N'20', N'12', 1, 5)
INSERT [dbo].[tblBillDetail] ([id], [billID], [productID], [quantity], [price]) VALUES (N'37', N'20', N'16', 1, 1)
INSERT [dbo].[tblBillDetail] ([id], [billID], [productID], [quantity], [price]) VALUES (N'6', N'2', N'12', 1, 2)
GO
INSERT [dbo].[tblCategory] ([id], [name]) VALUES (N'1', N'Smart phone')
INSERT [dbo].[tblCategory] ([id], [name]) VALUES (N'2', N'Laptop')
INSERT [dbo].[tblCategory] ([id], [name]) VALUES (N'3', N'Tablet')
INSERT [dbo].[tblCategory] ([id], [name]) VALUES (N'4', N'Smart watch')
INSERT [dbo].[tblCategory] ([id], [name]) VALUES (N'5', N'Ear phone')
GO
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'17', N'115207145220650726058', N'12', N'2021-10-27T18:55:58.264', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'18', N'115207145220650726058', N'14', N'2021-10-30T13:13:38.323', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'19', N'115207145220650726058', N'14', N'2021-10-30T13:16:04.389', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'20', N'115207145220650726058', N'17', N'2021-10-30T13:17:41.811', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'21', N'115207145220650726058', N'21', N'2021-10-31T01:07:45.342', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'22', N'115207145220650726058', N'22', N'2021-10-31T01:08:54.157', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'23', N'115207145220650726058', N'22', N'2021-10-31T01:09:10.016', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'24', N'115207145220650726058', N'23', N'2021-10-31T01:11:14.377', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'25', N'115207145220650726058', N'23', N'2021-10-31T01:11:35.157', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'26', N'115207145220650726058', N'25', N'2021-10-31T01:14:33.864', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'27', N'115207145220650726058', N'27', N'2021-10-31T01:16:17.187', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'28', N'115207145220650726058', N'18', N'2021-10-31T01:20:46.992', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'29', N'115207145220650726058', N'18', N'2021-10-31T01:20:57.219', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'30', N'115207145220650726058', N'17', N'2021-10-31T01:21:02.619', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'31', N'115207145220650726058', N'28', N'2021-10-31T01:21:06.978', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'32', N'115207145220650726058', N'27', N'2021-10-31T01:21:10.950', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'33', N'115207145220650726058', N'12', N'2021-10-31T01:21:22.749', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'34', N'115207145220650726058', N'20', N'2021-10-31T01:21:27.312', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'35', N'115207145220650726058', N'19', N'2021-10-31T01:21:31.382', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'36', N'115207145220650726058', N'26', N'2021-11-02T00:34:35.553', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'37', N'115207145220650726058', N'26', N'2021-11-02T00:34:51.943', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'38', N'115207145220650726058', N'32', N'2021-11-02T00:36:01.031', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'39', N'115207145220650726058', N'32', N'2021-11-02T00:36:15.215', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'40', N'115207145220650726058', N'33', N'2021-11-02T00:37:40.400', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'41', N'115207145220650726058', N'45', N'2021-11-02T00:48:08.586', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'44', N'115207145220650726058', N'40', N'2021-11-02T01:05:51.776', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'45', N'115207145220650726058', N'51', N'2021-11-04T18:53:07.584', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'46', N'115207145220650726058', N'33', N'2021-11-05T07:37:21.201', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'47', N'115207145220650726058', N'36', N'2021-11-05T07:37:29.355', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'48', N'115207145220650726058', N'36', N'2021-11-05T07:37:35.037', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'49', N'115207145220650726058', N'35', N'2021-11-05T07:37:45.077', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'50', N'115207145220650726058', N'34', N'2021-11-05T07:37:52.073', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'51', N'115207145220650726058', N'33', N'2021-11-05T07:38:02.042', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'52', N'115207145220650726058', N'32', N'2021-11-05T07:38:10.371', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'53', N'115207145220650726058', N'34', N'2021-11-05T07:38:50.530', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'54', N'115207145220650726058', N'35', N'2021-11-05T07:39:01.006', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'55', N'115207145220650726058', N'31', N'2021-11-05T07:39:10.483', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'56', N'115207145220650726058', N'30', N'2021-11-05T07:39:18.635', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'57', N'115207145220650726058', N'29', N'2021-11-05T07:39:34.966', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'58', N'115207145220650726058', N'36', N'2021-11-05T07:39:47.255', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'59', N'115207145220650726058', N'62', N'2021-11-05T07:42:30.507', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'60', N'115207145220650726058', N'40', N'2021-11-05T07:42:36.995', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'61', N'115207145220650726058', N'38', N'2021-11-05T07:42:45.584', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'62', N'115207145220650726058', N'40', N'2021-11-05T07:43:19.781', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'63', N'115207145220650726058', N'23', N'2021-11-05T07:43:35.339', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'64', N'115207145220650726058', N'24', N'2021-11-05T07:43:43.083', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'65', N'115207145220650726058', N'38', N'2021-11-05T07:43:51.513', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'66', N'115207145220650726058', N'49', N'2021-11-05T07:44:17.751', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'67', N'115207145220650726058', N'48', N'2021-11-05T07:44:29.272', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'68', N'115207145220650726058', N'45', N'2021-11-05T07:44:36.483', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'69', N'115207145220650726058', N'48', N'2021-11-05T07:44:44.738', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'70', N'115207145220650726058', N'44', N'2021-11-05T07:44:51.864', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'71', N'115207145220650726058', N'46', N'2021-11-05T07:45:02.068', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'72', N'115207145220650726058', N'43', N'2021-11-05T07:45:09.645', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'73', N'115207145220650726058', N'25', N'2021-11-05T07:45:28.236', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'74', N'115207145220650726058', N'26', N'2021-11-05T07:45:33.587', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'75', N'115207145220650726058', N'12', N'2021-11-05T08:04:57.137', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'76', N'115207145220650726058', N'20', N'2021-11-05T08:05:04.230', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'77', N'115207145220650726058', N'19', N'2021-11-05T08:05:10.103', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'78', N'115207145220650726058', N'18', N'2021-11-05T08:05:16.602', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'79', N'115207145220650726058', N'55', N'2021-11-05T08:05:24.367', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'80', N'115207145220650726058', N'54', N'2021-11-05T08:05:31.405', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'81', N'115207145220650726058', N'53', N'2021-11-05T08:05:38.291', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'82', N'115207145220650726058', N'52', N'2021-11-05T08:05:44.371', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'83', N'115207145220650726058', N'51', N'2021-11-05T08:06:01.999', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'84', N'115207145220650726058', N'50', N'2021-11-05T08:06:17.137', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'85', N'115207145220650726058', N'17', N'2021-11-05T08:06:32.370', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'86', N'115207145220650726058', N'17', N'2021-11-05T08:06:46.880', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'87', N'115207145220650726058', N'27', N'2021-11-05T08:06:53.231', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'88', N'115207145220650726058', N'28', N'2021-11-05T08:07:10.819', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'89', N'115207145220650726058', N'60', N'2021-11-05T08:07:51.133', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'90', N'115207145220650726058', N'61', N'2021-11-05T08:08:01.442', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'91', N'115207145220650726058', N'59', N'2021-11-05T08:08:11.575', N'Update')
INSERT [dbo].[tblLog] ([id], [userID], [productID], [time], [activity]) VALUES (N'92', N'115207145220650726058', N'27', N'2022-06-25T19:50:49.982', N'Delete')
GO
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'12', N'Mi Band 2', N'https://cdn.boba.vn/static/san-pham/dong-ho/dong-ho-thong-minh/dong-ho-theo-doi-suc-khoe/vong-tay-thong-minh-xiaomi-mi-band-2/xiaomi-miband-2(1).png', N'Mi band 2', N'2021-01-17', 5, 10, 1, N'4')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'14', N'Iphone 6', N'https://halomobile.vn/wp-content/uploads/2017/12/iphone-6-plus-gray_15.png', N'Iphone 6', N'2021-10-30', 15, 0, 1, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'15', N'Surface 3', N'https://vuongkhang.com/thumb/720/upload/thumbnail/laptop-3.png', N'Surface 3', N'2021-10-30', 10, 0, 1, N'2')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'16', N'Lenovo Tab M10', N'https://www.lenovo.com/medias/lenovo-tablet-m10-hero-1-.png?context=bWFzdGVyfHJvb3R8NjI0MTF8aW1hZ2UvcG5nfGgyMi9oMmIvOTk4ODM0NjQ0NTg1NC5wbmd8MDYxMDlmYTE0M2YxZDMyM2VjYTUyMThjNDQwM2VlNzgyYTQ5ZTM0OTVlZmM4OWI3OTc0ZjA1NjI4YjYwNTQxZQ', N'Lenovo Tab M10', N'2021-10-30', 1, 0, 1, N'3')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'17', N'Airpod 1', N'data:image/png;base64,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', N'Airpod 3', N'2021-10-30', 10, 0, 1, N'5')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'18', N'Mi Band 3', N'https://vn-test-11.slatic.net/p/bce1f8543e7fddb4923e398f95851420.png', N'Mi band 3', N'2021-10-31', 10, 0, 1, N'4')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'19', N'Mi Band 4', N'https://cdn.mobilecity.vn/mobilecity-vn/images/2019/06/xiaomi-mi-band-4-3jpg.png', N'Mi band 4', N'2021-10-31', 9, 1, 1, N'4')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'20', N'Mi Band 5', N'https://thegioiso360.vn/wp-content/uploads/2021/07/V%C3%B2ng-%C4%90eo-Tay-Xiaomi-Mi-Brand-5.png', N'Mi band 5', N'2021-10-31', 11, 1, 1, N'4')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'21', N'Iphone 7', N'http://bizweb.dktcdn.net/thumb/grande/100/372/421/products/iphone-7-silver-25ad039a-b200-49e8-8e2a-5d4be8d6887f.png?v=1633488939980', N'Iphone 7', N'2021-10-31', 30, 0, 1, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'22', N'Iphone 7 Plus', N'http://cdn.shopify.com/s/files/1/1458/9464/products/iphone-7-plus-128gb-2-400x460_grande.png?v=1489117467', N'Iphone 7 Plus', N'2021-10-31', 19, 0, 1, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'23', N'Dell Xps 13', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlwmW61Csv2QM6HkeDM4548KqP66uy-2-5Vw&usqp=CAU', N'Dell xps 13', N'2021-10-31', 21, 1, 1, N'2')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'24', N'Asus Zenbook 14', N'https://fugar.be/wp-content/uploads/2020/05/ASUS-Laptop-ZenBook-14-UX434FLC-AI441T-BE-Intel-Core-i7-10510U-90NB0MP3-M09670-1.png', N'Asus zenbook 14', N'2021-10-31', 25, 1, 1, N'2')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'25', N'Ipad Mini 4', N'https://dienthoaimoi.vn/images/products/2020/08/19/resized/13260598_ipad-3_1_1597811473-copy-copy-copy.png', N'Ipad mini 4', N'2021-10-31', 34, 1, 1, N'3')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'26', N'Ipad Mini 5', N'https://dienthoaimoi.vn/images/products/2020/11/19/resized/2_1605764381.png', N'Ipad mini 5', N'2021-10-31', 19, 1, 1, N'3')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'27', N'Airpod 2', N'https://product.hstatic.net/200000250691/product/image-removebg-preview__27__d88534c7ed0b404cbb4d0de251c73468_master.png', N'Air pod 2', N'2021-10-31', 30, 1, 0, N'5')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'28', N'Skullcandy', N'https://cdn.shopify.com/s/files/1/0023/2941/1635/products/IndyEvo_CarefreeYellow_S2IVW-N906_S2IVW-N907_Buds-Case-Closed-Hero_v008_1200x.png?v=1620810024', N'SkullCandy', N'2021-10-31', 17, 1, 1, N'5')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'29', N'Samsung Note 8', N'https://didongmango.com/images/products/2019/06/11/resized/samsung-galaxy-note-8-black22_1560238505.png', N'Samsung note 8', N'2021-11-02', 19, 10, 1, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'30', N'Samsung Note 9', N'https://exmobile.vn/uploads/2019/04/samsung-note9-trang.png', N'Samsung note 9', N'2021-11-02', 26, 5, 1, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'31', N'Samsung Note 10', N'https://images.samsung.com/is/image/samsung/id-galaxy-note10-sm-n975-sm-n975fzkgxid-177754456?$720_576_PNG$', N'Samsung note 10', N'2021-11-02', 29, 10, 1, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'32', N'Redmi 5', N'https://cdn.tgdd.vn/Products/Images/42/143464/xiaomi-redmi-5-den-200-4-org.png', N'redmi 5', N'2021-11-02', 19, 10, 1, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'33', N'Redmi 5 Plus', N'https://cdn.tgdd.vn/Products/Images/42/143465/xiaomi-redmi-5-plus-vang-org.png', N'redmi 5 plus', N'2021-11-02', 21, 10, 1, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'34', N'Redmi Note 8', N'https://hcm.clickbuy.com.vn/uploads/2019/09/avt-redmi-note-8-pro-den.png', N'redmi note 8', N'2021-11-02', 21, 10, 1, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'35', N'Redmi Note 7', N'https://vn-live-03.slatic.net/p/126551f758cd6ca321a87959e3510e2c.png', N'redmi note 7', N'2021-11-02', 19, 8, 1, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'36', N'Samsung A10', N'https://images.samsung.com/is/image/samsung/latin-en-galaxy-a10-a105-sm-a105mzrktpa-backred-156944122?$720_576_PNG$', N'samsung a10', N'2021-11-02', 23, 10, 1, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'37', N'samsung a10s', N'https://images.samsung.com/is/image/samsung/latin-en-galaxy-a10s-a107-sm-a107mzkrgto-frontblack-187009189?$720_576_PNG$', N'samsung a10s', N'2021-11-02', 19, 10, 1, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'38', N'Asus Vivobook s15', N'https://media.loveitopcdn.com/1480/thumb/500x500/1798-asus-s530un-grey-3laptop-asus-s530un-bq264t.png', N'asus vivobook s15', N'2021-11-02', 34, 10, 1, N'2')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'40', N'Asus Vivobook s14', N'https://dlcdnwebimgs.asus.com/gain/9da29e9d-d05d-49df-8636-1e8268acbb12/', N'asus vivobook s14', N'2021-11-02', 29, 10, 1, N'2')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'43', N'Ipad Pro 2018', N'https://applesaigon.vn/wp-content/uploads/2020/01/ipad-pro-11-inch-2018-64gb-wifi-33397-chitiet-400x460-1.png', N'Ipad pro 2018', N'2021-11-02', 27, 10, 1, N'3')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'44', N'Ipad Pro 2017', N'https://dienthoaimoi.vn/images/products/2020/08/22/resized/apple-ipadpro129-4g-qsd-silver_1598110906.png', N'Ipad pro 2017', N'2021-11-02', 24, 10, 1, N'3')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'45', N'Ipad Pro 2016', N'https://bizweb.dktcdn.net/thumb/large/100/420/160/products/ipad-9-7-2017-32gb-gold-a92a393a-b3e0-4e23-a25d-9aee264d6e04-bbdb2d7a-a68f-495a-ab64-d25868b019e4.png?v=1630400231000', N'Ipad pro 2016', N'2021-11-02', 1, 1, 1, N'3')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'46', N'Samsung Tab A7', N'https://images.samsung.com/is/image/samsung/vn-galaxy-tab-a7-t505-sm-t505nzaexev-frontgray-thumb-315412848?$480_480_PNG$', N'Samsung tab a7', N'2021-11-02', 1, 1, 1, N'3')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'47', N'Samsung tab a8', N'https://images.samsung.com/is/image/samsung/za-galaxy-taba-t290-sm-t290nzkaxfa-frontblack-thumb-172164345?$480_480_PNG$', N'Samsung tab a8', N'2021-11-02', 1, 0, 1, N'1')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'48', N'Samsung Tab A8', N'https://images.samsung.com/is/image/samsung/za-galaxy-taba-t290-sm-t290nzkaxfa-frontblack-thumb-172164345?$480_480_PNG$', N'Samsung tab a8', N'2021-11-02', 1, 1, 1, N'3')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'49', N'Samsung Tab A6', N'https://images.samsung.com/is/image/samsung/ca-galaxy-tab-a-7-0-2016-t280-sm-t280nzkaxac-000000001-front-black-thumb-1?$480_480_PNG$', N'Samsung tab a6', N'2021-11-02', 11, 8, 1, N'3')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'50', N'Apple Watch 3', N'https://product.hstatic.net/1000379731/product/aw_series_3_gps_38mm_mqku2_cac22d627b65479eaa814504059cd2f4_grande_3ea99d8fa2324156af3cf6e911f78be8_large.png', N'Apple watch 3', N'2021-11-02', 29, 10, 1, N'4')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'51', N'Apple Watch 4', N'https://product.hstatic.net/1000362143/product/40-alu-silver-sport-white-nc-s4-1up_809f6b39ca024363bcf871583b7ee48d.png', N'Apple watch 4', N'2021-11-02', 1, 1, 1, N'4')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'52', N'Apple Watch 4', N'https://masta.vn/wp-content/uploads/2020/04/44-stainless-silver-milanese-s4-1up.htm_1543208705.png', N'Apple watch 4', N'2021-11-02', 10, 10, 1, N'4')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'53', N'Apple Watch 5', N'https://shopdunk.com/wp-content/uploads/2021/07/Watch-5-den.png', N'Apple watch 5', N'2021-11-02', 23, 10, 1, N'4')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'54', N'Apple Watch 6', N'https://cdn.hoanghamobile.com/i/preview/Uploads/2020/11/06/apple-watch-series-6-gps-cellular-40mm-stainless-steel-with-milanese-loop.png', N'Apple watch 6', N'2021-11-02', 21, 10, 1, N'4')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'55', N'Apple Watch 2', N'https://dienthoaimoi.vn/images/products/2020/08/19/original/seri1-trang-01_1597823686.png.png', N'Apple watch 2', N'2021-11-02', 17, 10, 1, N'4')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'56', N'Sony WH-1000XM3', N'https://media.croma.com/image/upload/f_auto,q_auto,d_Croma%20Assets:no-product-image.jpg,h_260,w_260/v1605265572/Croma%20Assets/Entertainment/Headphones%20and%20Earphones/Images/8944985997342.png', N'Sony WH-1000XM3', N'2021-11-02', 21, 10, 1, N'5')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'57', N'Sony WH-1000XM4', N'https://www.sony.com.vn/image/0bdcfdd5b8a888e79e24bd9fff17c68a?fmt=png-alpha&wid=600', N'Sony WH-1000XM4', N'2021-11-02', 25, 10, 1, N'5')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'58', N'Mi True Wireless Earbuds Basic 2', N'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2021/04/17/image-removebg-preview-9.png', N'Mi True Wireless Earbuds Basic 2', N'2021-11-02', 24, 10, 1, N'5')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'59', N'Galaxy Buds Pro (black)', N'https://images.samsung.com/is/image/samsung/p6pim/ca/galaxy-s21/gallery/ca-galaxy-buds-pro-r190-sm-r190nzkaxac-363152555?$720_576_PNG$', N'Galaxy bud pro (black)', N'2021-11-02', 24, 10, 1, N'5')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'60', N'Galaxy Buds Pro (purple)', N'https://cdn.hoanghamobile.com/i/productlist/dsp/Uploads/2021/01/14/sm-r190-006-case-front-open-combination-violet.png', N'Galaxy bud pro (purple)', N'2021-11-02', 31, 10, 1, N'5')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'61', N'Galaxy Buds Pro (pink)', N'https://images.samsung.com/is/image/samsung/au/galaxy-note20/gallery/au-galaxy-buds-live-r180-sm-r180nznaasa-casefrontopencombinationmysticbronze-275665670?$720_576_PNG$', N'Galaxy bud pro (pink)', N'2021-11-02', 25, 10, 1, N'5')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'62', N'Asus Gaming tuf f15', N'https://hanoicomputercdn.com/media/product/59673_laptop_asus_gaming_tuf_fx506_5.png', N'Asus gaming tuf f15', N'2021-11-02', 43, 15, 1, N'2')
INSERT [dbo].[tblProduct] ([id], [name], [imageLink], [description], [createDate], [price], [quantity], [status], [categoryID]) VALUES (N'63', N'Iphone 13', N'https://cdn.hoanghamobile.com/i/preview/Uploads/2021/09/15/image-removebg-preview-17.png', N'Iphone 13', N'2021-11-08', 21, 1, 1, N'1')
GO
INSERT [dbo].[tblUser] ([id], [name], [password], [email], [phoneNumber], [isAdmin], [address]) VALUES (N'103055757365377277355', N'Nguyễn Lê Thuần', N'12345678', N'chicagobull2306@gmail.com', N'0123456788', 0, N'ccccccc')
INSERT [dbo].[tblUser] ([id], [name], [password], [email], [phoneNumber], [isAdmin], [address]) VALUES (N'115207145220650726058', N'Trần GIa Nguyên', N'12345678', N'nguyentgse140823@fpt.edu.vn', N'0378794677', 1, N'aaaaaaaa')
INSERT [dbo].[tblUser] ([id], [name], [password], [email], [phoneNumber], [isAdmin], [address]) VALUES (N'115207145220650726059', N'Trần Đình Xuân Dung', N'12345678', N'dungtdx@gmail.com', N'0315480227', 0, N'bbbbbb')
GO
ALTER TABLE [dbo].[tblBill]  WITH CHECK ADD  CONSTRAINT [FK_tblBill_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([id])
GO
ALTER TABLE [dbo].[tblBill] CHECK CONSTRAINT [FK_tblBill_tblUser]
GO
ALTER TABLE [dbo].[tblBillDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblBillDetail_tblBill] FOREIGN KEY([billID])
REFERENCES [dbo].[tblBill] ([id])
GO
ALTER TABLE [dbo].[tblBillDetail] CHECK CONSTRAINT [FK_tblBillDetail_tblBill]
GO
ALTER TABLE [dbo].[tblBillDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblBillDetail_tblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([id])
GO
ALTER TABLE [dbo].[tblBillDetail] CHECK CONSTRAINT [FK_tblBillDetail_tblProduct]
GO
ALTER TABLE [dbo].[tblLog]  WITH CHECK ADD  CONSTRAINT [FK_tblLog_tblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([id])
GO
ALTER TABLE [dbo].[tblLog] CHECK CONSTRAINT [FK_tblLog_tblProduct]
GO
ALTER TABLE [dbo].[tblLog]  WITH CHECK ADD  CONSTRAINT [FK_tblLog_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([id])
GO
ALTER TABLE [dbo].[tblLog] CHECK CONSTRAINT [FK_tblLog_tblUser]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([id])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategory]
GO
USE [master]
GO
ALTER DATABASE [Assignment] SET  READ_WRITE 
GO
