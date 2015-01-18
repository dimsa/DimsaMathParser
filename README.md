# DimsaMathParser
Parser for Math Expression with easy adding of new functions and operands. Written on Delphi XE5
Парсер для математических выражений. Позволяет легко добавлять функции и операнды, полное ООП короче
<br />

Using:<br />

<b>Uses</b><br />
&emsp;uExpressionParser;<br />
<b>var</b><br />
&emsp;vExp: TExpression;<br />
&emsp;vStack: TValueStack;<br />
<b>Begin</b><br />
&emsp;vExp := TExpression.Create;<br />
&emsp;<i>// It can parse variables too. If variables are not defined you will get exception</i><br />
&emsp;<i>// Также позволяет задавать переменные. Если переменные не определены, вы получить эксепшн)</i><br />
&emsp;vStack := TValueStack.Create;<br />
&emsp;vStack.Add('big', 20);<br />
&emsp;vStack.Add('small', 16);<br />
&emsp;vExp.ValueStack := vStack;<br />
&emsp;vExp := '2.5+4*(5*big-45*(8/sqrt(small)))';<br />
&emsp;<i>// Ответ будет 42.5</i><br />
&emsp;WriteLn(vExp.Value);<br />
<b>End.</b><br />



