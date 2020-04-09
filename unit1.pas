unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  ExtCtrls, Lclintf, ComCtrls, SynEdit, SynHighlighterHTML, SynHighlighterCss,
  SynHighlighterPython;

type

  { TForm1 }

  TForm1 = class(TForm)
    FindDialog1: TFindDialog;
    FontDialog1: TFontDialog;
    MainMenu1: TMainMenu;
    Kopirovat: TMenuItem;
    MenuItem1: TMenuItem;
    StatusBar1: TStatusBar;
    SynCssSyn1: TSynCssSyn;
    SynEdit1: TSynEdit;
    SynHTMLSyn1: TSynHTMLSyn;
    SynPythonSyn1: TSynPythonSyn;
    Tema3: TMenuItem;
    Tema2: TMenuItem;
    Tema1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Oprogramme: TMenuItem;
    ReplaceDialog1: TReplaceDialog;
    SaveDialog1: TSaveDialog;
    Spravka1: TMenuItem;
    Zamenit: TMenuItem;
    Naiti: TMenuItem;
    Tema: TMenuItem;
    Shrift: TMenuItem;
    Vstavit: TMenuItem;
    Virezat: TMenuItem;
    Videlitvse: TMenuItem;
    Vihod: TMenuItem;
    Sohranitkak: TMenuItem;
    Sohranit: TMenuItem;
    Zakrit: TMenuItem;
    Otkrit: TMenuItem;
    Novi: TMenuItem;
    Spravka: TMenuItem;
    Poisk: TMenuItem;
    Vid: TMenuItem;
    Pravka: TMenuItem;
    Memo1: TMemo;
    Fail: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure KopirovatClick(Sender: TObject);
    procedure Memo1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure MenuItem1Click(Sender: TObject);
    procedure NaitiClick(Sender: TObject);
    procedure NoviClick(Sender: TObject);
    procedure OprogrammeClick(Sender: TObject);
    procedure OtkritClick(Sender: TObject);
    procedure ShriftClick(Sender: TObject);
    procedure SohranitkakClick(Sender: TObject);
    procedure Spravka1Click(Sender: TObject);
    procedure Tema1Click(Sender: TObject);
    procedure Tema2Click(Sender: TObject);
    procedure Tema3Click(Sender: TObject);
    procedure TemaClick(Sender: TObject);
    procedure VidelitvseClick(Sender: TObject);
    procedure VihodClick(Sender: TObject);
    procedure VirezatClick(Sender: TObject);
    procedure VstavitClick(Sender: TObject);
    procedure ZamenitClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  SynCh: Real;

implementation
uses Unit2, Unit3;

procedure Ansi_Memo(File_Ansi: string);
var
tfile: TStringList;
str: string;
begin
tfile:= TStringList.Create;
tfile.LoadFromFile(File_Ansi);
str:= tfile.Text;
if SynCh = 0 then Form1.Memo1.Lines.Add(str) else Form1.SynEdit1.Lines.Add(str);
tfile.Free;
end;

procedure Memo_Ansi(File_Ansi: string);
var
tfile: TStringList;
str: string;
begin
tfile:= TStringList.Create;
If SynCh = 0 then str:=Form1.Memo1.text else Form1.SynEdit1.Lines.Add(str);
tfile.Add(str);
tfile.SaveToFile(File_Ansi);
tfile.Free;
end;
{$R *.lfm}

{ TForm1 }

procedure TForm1.OtkritClick(Sender: TObject);
var
File_Ansi:string;
begin
  if OpenDialog1.Execute then
     begin
        File_Ansi:= OpenDialog1.FileName;
        Ansi_Memo(File_Ansi);
     end;
end;

procedure TForm1.ShriftClick(Sender: TObject);
begin
   FontDialog1.Font:=  memo1.Font;
if FontDialog1.execute=true  then
     begin
        if SynCh = 0 then Form1.Memo1.Font := FontDialog1.Font else Form1.SynEdit1.Font := FontDialog1.Font;
     end;
end;

procedure TForm1.NoviClick(Sender: TObject);
begin
  if SynCh = 0 then Memo1.Clear else SynEdit1.Clear;
end;

procedure TForm1.NaitiClick(Sender: TObject);
begin
   if FindDialog1.execute=true then
        begin
           if SynCh = 0 then Form1.Memo1.Text :=FindDialog1.FindText else Form1.SynEdit1.Text :=FindDialog1.FindText;
        end;
end;

procedure TForm1.KopirovatClick(Sender: TObject);
begin
  if SynCh = 0 then Memo1.CopytoClipboard else SynEdit1.CopytoClipboard;
end;

//На старте виден лишь memo
procedure TForm1.FormCreate(Sender: TObject);
begin
  SynEdit1.Hide();
  SynEdit1.Text:='';
  SynCh:= 0;
end;

procedure TForm1.Memo1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var Row, Col: Integer;
begin
  //Row := SendMessage(Memo1.Handle, EM_LINEFROMCHAR, Memo1.SelStart, 0);
  //Col := Memo1.SelStart - SendMessage(Memo1.Handle, EM_LINEINDEX, Row, 0);
  //StatusBar1.Panels[0].Text := 'Row= ' + IntToStr(Row+1) + ' Col= ' + IntToStr(Col+1);
  //StatusBar1.Panels[0].Text := CaretPos.Y;
  StatusBar1.Panels[1].Text := FormatDateTime('hh.mm.ss', Time);
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  if SynCh = 0 then
       begin
          Memo1.Hide;
          SynEdit1.Show;
          SynCh:= 1;
          Form3.Show;
       end else
       begin
         SynEdit1.Hide;
         Memo1.Show;
         SynCh:= 0;
         Form3.Hide;
       end;
end;

procedure TForm1.OprogrammeClick(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.SohranitkakClick(Sender: TObject);
var
File_Ansi:string;
begin
  if SaveDialog1.Execute then
    begin
       File_Ansi:=SaveDialog1.FileName;
       //File_Ansi:= UTF8ToSys(File_Ansi);
       Memo_Ansi(File_Ansi);
    end;
end;

procedure TForm1.Spravka1Click(Sender: TObject);
begin
  openURL('http:\\freepascal.ru');
end;

procedure TForm1.Tema1Click(Sender: TObject);
begin
  if SynCh = 0 then
    begin
       Memo1.Color := clWhite;
       Memo1.Font.Color :=clBlack;
    end else
    begin
      SynEdit1.Color := clWhite;
      SynEdit1.Font.Color :=clBlack;
    end;

end;

procedure TForm1.Tema2Click(Sender: TObject);
begin
  if SynCh = 0 then
    begin
       Memo1.Color := clBlack;
       Memo1.Font.Color :=clWhite;
    end else
    begin
      SynEdit1.Color := clBlack;
      SynEdit1.Font.Color :=clWhite;
    end;
end;

procedure TForm1.Tema3Click(Sender: TObject);
begin
  if SynCh = 0 then
    begin
       Memo1.Color := clGray;
       Memo1.Font.Color :=clWhite;
    end else
    begin
      SynEdit1.Color := clGray;
      SynEdit1.Font.Color :=clWhite;
    end;
end;

procedure TForm1.TemaClick(Sender: TObject);
begin

end;

procedure TForm1.VidelitvseClick(Sender: TObject);
begin
  if SynCh = 0 then Memo1.SelectAll else SynEdit1.SelectAll;
end;

procedure TForm1.VihodClick(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.VirezatClick(Sender: TObject);
begin
  if SynCh = 0 then Memo1.CuttoClipboard else SynEdit1.CuttoClipboard;
end;

procedure TForm1.VstavitClick(Sender: TObject);
begin
   if SynCh = 0 then Memo1.PasteFromClipboard else SynEdit1.PasteFromClipboard;
end;

procedure TForm1.ZamenitClick(Sender: TObject);
begin
  if ReplaceDialog1.Execute then
    begin
       If SynCh = 0 then Form1.Memo1.Text :=ReplaceDialog1.ReplaceText else Form1.SynEdit1.Text :=ReplaceDialog1.ReplaceText;
    end;
end;

end.

