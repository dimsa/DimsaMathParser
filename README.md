# DimsaMathParser
Parser for Math Expression with easy adding of new functions and operands. Written on Delphi XE5
Парсер для математических выражений. Позволяет легко добавлять функции и операнды, полное ООП короче
<br />

Using:<br />

Uses<br />
&emsp;uExpressionParser;<br />
var<br />
&emsp;vExp: TExpression;<br />
Begin<br />
&emsp;vExp := TExpression.Create;<br />
&emsp;// It can parse variables too. But now it is not done<br />
&emsp;// Также позволяет задавать переменные. Но пока он их парсит, но не задаёт)<br />
&emsp;vExp := '2+4*(5*5-45*(8 / 1.6)+Sin(3.14 / 2))';<br />
&emsp;WriteLn(vExp.Value);<br />
End.<br />



