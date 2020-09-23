DECLARE @tinggi int;
SET @tinggi = 210;
IF @tinggi < 140
	Print 'TIDAK MASUK KUALIFIKASI';
ELSE
  BEGIN
    IF @tinggi < 190
	Print 'POINT GUARD, CENTER, SHOOTING GUARD';
	ELSE
	Print 'BIG MAN';
 END;
GO