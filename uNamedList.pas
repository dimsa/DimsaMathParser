// TNamedList is the generic TList where some Items can to have names and
// can be called by the name. Author: Dmitry Sorokin

unit uNamedList;

interface

Uses
  System.SysUtils, Generics.Collections;

type
  TNameAndValue = record
    Name: String;
    Index: Integer;
  end;

  TNamedList<T> = class(TList<T>)
  strict private
    FNames: TList<TNameAndValue>;
    function GetItemS(Name: String): T;
    procedure SetItemS(Name: String; const Value: T);
  public
    property Items[Name: String]: T read GetItemS write SetItemS; default;
    function Add(const AName: String; Const AValue: T): Integer; reintroduce; overload;
    procedure Delete(const AName: String); reintroduce; overload;

    function CountNames: Integer;
    function ByName(const AName: String): T;
    function IsHere(const AName: String): Boolean;
    function IndexOf(const AName: String): Integer; overload;
    procedure AddName(const AIndex: Integer; AName: String); overload;
    procedure AddName(const AValue: T; AName: String); overload;
    procedure Clear; reintroduce;

    constructor Create; virtual;
    destructor Destroy; override;
  const
    CClassName = 'TNamedList';
end;


implementation

procedure TNamedList<T>.AddName(const AIndex: Integer; AName: String);
var
  vValue: TNameAndValue;
begin
  vValue.Index := AIndex;
  vValue.Name := AName;
  FNames.Add(vValue);
end;

function TNamedList<T>.Add(const AName: String;
  const AValue: T): Integer;
var
  vValue: TNameAndValue;
begin
  vValue.Index := self.Add(AValue);
  vValue.Name := AName;
  FNames.Add(vValue);
  Result := vValue.Index;
end;

procedure TNamedList<T>.AddName(const AValue: T; AName: String);
var
  vValue: TNameAndValue;
  vS: String;
begin
  vValue.Index := self.IndexOf(AValue);
  vValue.Name := AName;

  if vValue.Index < 0 then
  begin
    vS := 'Error in adding name "' + AName +
          '". Object not fount in the list in class "' + CClassName + '"';
    Raise Exception.Create(vS);
  end;

  FNames.Add(vValue);
end;

function TNamedList<T>.ByName(const AName: String): T;
var
  vN, i: Integer;
  vS: String;
begin
  vN := FNames.Count - 1;
  for i := 0 to vN do
    if FNames[i].Name = AName then
      Exit(Self[i]);

  // If value with name not found
  vS := 'Can not find name "' + AName +
        '". in class "' + CClassName + '"';
  Raise Exception.Create(vS);
end;

procedure TNamedList<T>.Clear;
begin
  FNames.Clear;
  Self.Count := 0;
  Self.Capacity := 0;
end;

function TNamedList<T>.CountNames: Integer;
begin
  Result := FNames.Count;
end;

constructor TNamedList<T>.Create;
begin
  Inherited Create;
  FNames := TList<TNameAndValue>.Create;
end;

procedure TNamedList<T>.Delete(const AName: String);
var
  vN, i: Integer;
begin
  vN := FNames.Count - 1;

  for i := 0 to vN do
    if FNames[i].Name = AName then
    begin
      Self.Delete(FNames[i].Index);
      Self.FNames.Delete(i);
    end;
end;

destructor TNamedList<T>.Destroy;
begin
  FNames.Free;
  inherited;
end;

function TNamedList<T>.GetItemS(Name: String): T;
begin
  Result := Self.Items[IndexOf(Name)];
end;

function TNamedList<T>.IndexOf(const AName: String): Integer;
var
  vN, i: Integer;
begin
  vN := FNames.Count - 1;
  for i := 0 to vN do
    if FNames[i].Name = AName then
      Exit(FNames[i].Index);
  Result := -1;
end;

function TNamedList<T>.IsHere(const AName: String): Boolean;
var
  vN, i: Integer;
begin
  vN := FNames.Count - 1;
  for i := 0 to vN do
    if FNames[i].Name = AName then
      Exit(True);
  Result := False;
end;

procedure TNamedList<T>.SetItemS(Name: String; const Value: T);
begin
  Self.Items[IndexOf(Name)] := Value;
end;

end.
