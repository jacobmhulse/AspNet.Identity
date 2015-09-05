SET IDENTITY_INSERT [dbo].[User] ON;
GO

MERGE INTO [dbo].[User] AS Target
USING (VALUES

    (1, N'admin', N'admin@example.com', 0, N'ACe+kHUdH61ms8NbkXSCXyV34CEP7tjfj93JrtlKRPfShGurFdAujQrmbVA7J9MDbg==',
        N'9771f91d-b4a0-45e0-8971-899b907c5863', NULL, 0, 0, NULL, 0, 0, 'Example'),
    (2, N'user', N'user@example.com', 0, N'ACe+kHUdH61ms8NbkXSCXyV34CEP7tjfj93JrtlKRPfShGurFdAujQrmbVA7J9MDbg==',
        N'9771f91d-b4a0-45e0-8971-899b907c5863', NULL, 0, 0, NULL, 0, 0, 'Example')

) AS Source (
    [UserID],
    [UserName],
    [Email],
    [EmailConfirmed],
    [PasswordHash],
    [SecurityStamp],
    [PhoneNumber],
    [PhoneNumberConfirmed],
    [TwoFactorEnabled],
    [LockoutEndDateUtc],
    [LockoutEnabled],
    [AccessFailedCount],
	[TenantId]
)
ON Target.[UserID] = Source.[UserID]
-- Update matched rows
WHEN MATCHED THEN
UPDATE SET
    [UserName] = Source.[UserName],
    [Email] = Source.[Email],
    [EmailConfirmed] = Source.[EmailConfirmed],
    [PasswordHash] = Source.[PasswordHash],
    [SecurityStamp] = Source.[SecurityStamp],
    [PhoneNumber] = Source.[PhoneNumber],
    [PhoneNumberConfirmed] = Source.[PhoneNumberConfirmed],
    [TwoFactorEnabled] = Source.[TwoFactorEnabled],
    [LockoutEndDateUtc] = Source.[LockoutEndDateUtc],
    [LockoutEnabled] = Source.[LockoutEnabled],
    [AccessFailedCount] = Source.[AccessFailedCount],
	[TenantId] = Source.[TenantId]
-- Insert new rows
WHEN NOT MATCHED BY TARGET THEN
INSERT (
    [UserID],
    [UserName],
    [Email],
    [EmailConfirmed],
    [PasswordHash],
    [SecurityStamp],
    [PhoneNumber],
    [PhoneNumberConfirmed],
    [TwoFactorEnabled],
    [LockoutEndDateUtc],
    [LockoutEnabled],
    [AccessFailedCount],
	[TenantId]
)
VALUES (
    [UserID],
    [UserName],
    [Email],
    [EmailConfirmed],
    [PasswordHash],
    [SecurityStamp],
    [PhoneNumber],
    [PhoneNumberConfirmed],
    [TwoFactorEnabled],
    [LockoutEndDateUtc],
    [LockoutEnabled],
    [AccessFailedCount],
	[TenantId]
);
GO

SET IDENTITY_INSERT [dbo].[User] OFF;
GO