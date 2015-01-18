unit uFunctionGroup;

interface

uses
  uParserValue, uExpressionParser;

type
  TFunction = class(TExpression)
  protected
    procedure SetText(const AValue: String); override;
  end;

  TFunctionType = class of TFunction;

  TSin = class(TFunction)
  public
    function Value: Double; override;
  end;

  TCos = class(TFunction)
  public
    function Value: Double; override;
  end;

  TSqr = class(TFunction)
  public
    function Value: Double; override;
  end;

  TSqrt = class(TFunction)
  public
    function Value: Double; override;
  end;

  const
    CFuncNames: array[0..3] of string = ('sin','cos','sqr','sqrt');
    CFuncNamesCount = 4;
    CFastFuncNames: array[0..3] of TFunctionType = (TSin, TCos, TSqr, TSqrt);

implementation

{ TSin }

function TSin.Value: Double;
begin
  Result := Sin(Inherited);
end;

{ TCos }

function TCos.Value: Double;
begin
  Result := Cos(Inherited);
end;

{ TSqr }

function TSqr.Value: Double;
begin
  Result := Sqr(Inherited);
end;

{ TSqrt }

function TSqrt.Value: Double;
begin
  Result := Sqrt(Inherited);
end;

{ TFunction }

procedure TFunction.SetText(const AValue: String);
var
  vText: string;
begin
  inherited;

  vText := Expression;
  Delete(vText, 1, Pos('(', vText));
  Delete(vText, Length(vText), 1);
  FExpression := vText;
end;

end.
