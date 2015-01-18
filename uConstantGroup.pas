unit uConstantGroup;

interface

uses
  System.SysUtils,
  uParserValue;

type
  // Несчитаемое значение, переменная или константа
  TConstantValue = class(TValue)
  public
    constructor Create(const AValue: String); reintroduce; virtual;
  end;

  TVariable = class(TConstantValue)
  strict private
    FPlacedValue: Double;
    FPlaced: Boolean;
    function GetName: string;// Просто выдает Text
  public
    property Name: string read GetName; // Название это по сути текст переменной
    procedure PlaceValue(const AValue: Double);
    function Value: Double; override;
    constructor Create(const AValue: String); override;
  end;

  TDouble = class(TConstantValue)
  public
    function Value: Double; override;
  end;

implementation

{ TVariable }

constructor TVariable.Create(const AValue: String);
begin
  inherited;
  Text := AValue;
  FPlaced := False;
  Self.BoundLeft := 1;
  Self.BoundRight := Length(AValue)
end;

function TVariable.GetName: string;
begin
  Result := Self.Text;
end;

procedure TVariable.PlaceValue(const AValue: Double);
begin
  FPlaced := True;
  FPlacedValue := AValue;
end;

function TVariable.Value: Double;
begin
  if FPlaced then
    Result := FPlacedValue
  else
    raise Exception.Create('На задано значение переменной «' + Name + '»');
end;

{ TDouble }

function TDouble.Value: Double;
var
  vA: Double;
  vErr: Integer;
begin
  Val(Text, vA, vErr);

  if vErr = 0 then
    Result := vA
  else
    raise Exception.Create('Ошибка константового значения, невозможно перевести в число с плавающей точкой «' + Text + '»');
end;

{ TConstantValue }

constructor TConstantValue.Create(const AValue: String);
begin
  Text := AValue;
end;

end.
