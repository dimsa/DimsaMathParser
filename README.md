# DimsaMathParser
Parser for Math Expression with easy adding of new functions and operands. Written on Delphi XE5
Парсер для математических выражений. Позволяет легко добавлять функции и операнды, полное ООП короче
<br />

Using:<br />

<style type="text/css">
span {
	font-family: 'Courier New';
	font-size: 10pt;
	color: #000000;
}
.sc0 {
	color: #808080;
}
.sc1 {
}
.sc4 {
	color: #008080;
}
.sc9 {
	font-weight: bold;
	color: #0000FF;
}
.sc10 {
	color: #808080;
}
.sc13 {
	font-weight: bold;
	color: #000080;
}
</style>
</head>
<body>
<div style="float: left; white-space: pre; line-height: 1; background: #FFFFFF; "><span class="sc1">Using</span><span class="sc13">:</span><span class="sc0">

</span><span class="sc9">Uses</span><span class="sc0">
    </span><span class="sc1">uExpressionParser</span><span class="sc13">;</span><span class="sc0">
</span><span class="sc9">var</span><span class="sc0">
    </span><span class="sc1">vExp</span><span class="sc13">:</span><span class="sc0"> </span><span class="sc1">TExpression</span><span class="sc13">;</span><span class="sc0">
</span><span class="sc9">Begin</span><span class="sc0">
    </span><span class="sc1">vExp</span><span class="sc0"> </span><span class="sc13">:=</span><span class="sc0"> </span><span class="sc1">TExpression</span><span class="sc13">.</span><span class="sc1">Create</span><span class="sc13">;</span><span class="sc0">
    </span><span class="sc4">// It can parse variables too. But now it is not done
</span><span class="sc0">    </span><span class="sc4">// Также позволяет задавать переменные. Но пока он их парсит, но не задаёт)
</span><span class="sc0">    </span><span class="sc1">vExp</span><span class="sc0"> </span><span class="sc13">:=</span><span class="sc0"> </span><span class="sc10">'2+4*(5*5-45*(8 / 1.6)+Sin(3.14 / 2))'</span><span class="sc13">;</span><span class="sc0">
    </span><span class="sc1">WriteLn</span><span class="sc13">(</span><span class="sc1">vExp</span><span class="sc13">.</span><span class="sc1">Value</span><span class="sc13">);</span><span class="sc0">
</span><span class="sc9">End</span><span class="sc13">.</span><span class="sc0">

</span></div></body>
</html>

