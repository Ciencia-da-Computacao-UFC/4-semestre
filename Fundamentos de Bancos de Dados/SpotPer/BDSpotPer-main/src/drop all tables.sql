--EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT all';
EXEC sp_MSforeachtable @command1 = 'DROP TABLE ?';
--EXEC sp_MSforeachtable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all';
