unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioGroup1: TRadioGroup;
    procedure RadioButton2Click(Sender: TObject);
  private

  public

  end;

var
  Form3: TForm3;

implementation
uses
  Unit1;

{$R *.lfm}

{ TForm3 }

procedure TForm3.RadioButton2Click(Sender: TObject);
begin
  if RadioButton1.Checked=true then Form1.SynEdit1.Highlighter:=Form1.SynHTMLSyn1;
  if RadioButton2.Checked=true then Form1.SynEdit1.Highlighter:=Form1.SynCssSyn1;
  if RadioButton3.Checked=true then Form1.SynEdit1.Highlighter:=Form1.SynPythonSyn1;
end;

end.

