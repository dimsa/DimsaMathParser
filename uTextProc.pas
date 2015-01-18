unit uTextProc;

interface

uses
  System.SysUtils, System.Generics.Collections;

  function PosFromRight(const ASubStr, AStr: string; AOffset: Integer = 0): Integer;
  function PosFromLeft(const ASubStr, AStr: string;  AOffset: Integer = 1): Integer;
  function ListOfPos(const ASubstr, AStr: String): TList<Integer>;

type
  {Значения для быстрого доступа}
  TStrAndPos = record
    Text: string;
    StartPos, EndPos: Integer;
  end;

implementation

// Дает список поизиций вхождения подстроки
function ListOfPos(const ASubstr, AStr: String): TList<Integer>;
var
  vPos: Integer;
  vRes: TList<Integer>;
//  vN, vArr: Integer;
begin
  vPos := 0;
  vRes := TList<Integer>.Create;
  repeat
    vPos := Pos(ASubstr, AStr, vPos + 1);
    if vPos > 0 then
      vRes.Add(vPos);
  until vPos <= 0;

  Result := vRes;
end;

// Выдает те же значения, что и Pos, но ищет от оффсета включительно влево
// Первый символ так же имеет значени 1, а последний Length(s);
// Если оффсет больше длины, все норм, т.к. стринг как-то контроллирует всё
function PosFromRight(const ASubStr, AStr: string; AOffset: Integer = 0): Integer;
var
  vStrLen, vSubStrLen: Integer;
  vStrI, vSubStrI: Integer; // Счетчики
begin
  vStrLen := Length(AStr);
  vSubStrLen := Length(ASubStr);
  if AOffset = 0 then
    AOffset := vStrLen;

  for vStrI := AOffset downto vSubStrLen do
  begin
    for vSubStrI := vSubStrLen downto 1 do
    begin
      // Если не совпадает, то пропускаем итерацию
      if (AStr[vStrI + vSubStrI - vSubStrLen] <> ASubStr[vSubStrI]) then
        Break;
      // Если новое значение и всё ок, то выходим со значением позиции
      if vSubStrI = 1 then
          Exit(vStrI - vSubStrLen + 1);
    end;
  end;

  Result := 0;
end;

// Работает так же как Pos, но в случае,если указан оффсет 0, выдает результат
function PosFromLeft(const ASubStr, AStr: string; AOffset: Integer = 1): Integer;
var
  vStrLen, vSubStrLen: Integer;
  vStrI, vSubStrI: Integer; // Счетчики
begin
  vStrLen := Length(AStr);
  vSubStrLen := Length(ASubStr);

  for vStrI := AOffset to vStrLen - vSubStrLen do
  begin
    for vSubStrI := 1 to vSubStrLen do
    begin
      // Если не совпадает, то пропускаем итерацию
      if (AStr[vStrI + vSubStrI - vSubStrLen] <> ASubStr[vSubStrI]) then
        Break;
      // Если новое значение и всё ок, то выходим со значением позиции
      if vSubStrI = 1 then
          Exit(vStrI - vSubStrLen + 1);
    end;
  end;

  Result := 0;
end;

end.
