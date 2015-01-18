# DimsaMathParser
Parser for Math Expression with easy adding of new functions and operands. Written on Delphi XE5
Парсер для математических выражений. Позволяет легко добавлять функции и операнды, полное ООП короче
<br />

Using:<br />

Using:

Uses
	uExpressionParser;
var
	vExp: TExpression;
Begin
	vExp := TExpression.Create;
	// It can parse variables too. But now it is not done
	// Также позволяет задавать переменные. Но пока он их парсит, но не задаёт)
	vExp := '2+4*(5*5-45*(8 / 1.6)+Sin(3.14 / 2))';
	WriteLn(vExp.Value);
End.



