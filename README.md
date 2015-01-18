# DimsaMathParser
Parser for Math Expression with easy adding of new functions and operands. Written on Delphi XE5
Парсер для математических выражений. Позволяет легко добавлять функции и операнды, полное ООП короче
<br />

Using:<br />
<br />
<Code>
<<<<<<< HEAD
Uses<br />
	uExpressionParser;<br />
var<br />
	vExp: TExpression;<br />
Begin<br />
	vExp := TExpression.Create;<br />
	// It can parse variables too. But now it is not done<br />
	// Также позволяет задавать переменные. Но пока он их парсит, но не задаёт)<br />
	vExp := '2+4*(5*5-45*(8 / 1.6)+Sin(3.14 / 2))';<br />
	WriteLn(vExp.Value);<br />
End;<br />
=======
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
End;
>>>>>>> cfa3f7e4608cd9277bb2ce2a58d019ccdd65f2ef
</Code>

