unit uOperandGroup;

interface

uses
  uParserValue;

type
 {Операции сложения, вычитания и т.д.}
  TOperand = class(TValue)
  protected
    FValue1, FValue2: TValue;
  public
    constructor Create(const AValue1, AValue2: TValue); reintroduce; virtual;
  end;

 {Типы операндов}
  TOperands = class of TOperand;

  {Скобки. Набор операндов}
  TAddition = class(TOperand)
  public
    function Value: Double; override;
  end;

  TSubtraction = class(TOperand)
  public
    function Value: Double; override;
  end;

  TMultiplication = class(TOperand)
  public
    function Value: Double; override;
  end;

  TDivision = class(TOperand)
  public
    function Value: Double; override;
  end;

  const
    Operands: array[0..3] of char = ('/','*','-','+');
    OperandCount = 4;
    OperandChar: array[0..5] of char = ('/','*','-','+','(',')');
    OperandCharCount = 6;
    FastOperandClass: array[0..3] of TOperands = (TDivision, TMultiplication, TSubtraction, TAddition);

implementation

{ TOperand }

constructor TOperand.Create(const AValue1, AValue2: TValue);
begin
  FValue1 := AValue1;
  FValue2 := AValue2;
end;

{ TAddition }

function TAddition.Value: Double;
begin
  Result := FValue1.Value + FValue2.Value;
end;

{ TSubtraction }

function TSubtraction.Value: Double;
begin
  Result := FValue1.Value - FValue2.Value;
end;

{ TMultiplication }

function TMultiplication.Value: Double;
begin
  Result := FValue1.Value * FValue2.Value;
end;

{ TDivision }

function TDivision.Value: Double;
begin
  Result := FValue1.Value / FValue2.Value;
end;


end.
