unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  ExtCtrls, Lclintf, ComCtrls, SynEdit, SynHighlighterHTML, SynHighlighterCss,
  SynHighlighterPython, StrUtils, LCLTranslator;

type

  { TForm1 }

  TForm1 = class(TForm)
    FindDialog1: TFindDialog;
    FontDialog1: TFontDialog;
    MainMenu1: TMainMenu;
    Kopirovat: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
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
    Timer1: TTimer;
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
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
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
    procedure Timer1Timer(Sender: TObject);
    procedure VidelitvseClick(Sender: TObject);
    procedure VihodClick(Sender: TObject);
    procedure VirezatClick(Sender: TObject);
    procedure VstavitClick(Sender: TObject);
    procedure ZamenitClick(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure ReplaceDialog1Find(Sender: TObject);
    procedure ReplaceDialog1Replace(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  SynCh: Real;
  todayTime: TDateTime;
  todayDate: TDateTime;

implementation
uses Unit2, Unit3, Unit4;

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
  FindDialog1.Execute;
end;

procedure TForm1.FindDialog1Find(Sender: TObject);
var
   Found, StartPos: Integer;
begin
   if Memo1.SelLength <> 0 then // для повторного поиска
      StartPos := Memo1.SelStart + Memo1.SelLength
   else
      StartPos := 0;

   Found := PosEx(FindDialog1.FindText, Memo1.Text, StartPos + 1);
   if Found <> 0 then
   begin
      Memo1.HideSelection := False;
      Memo1.SelStart := Found - 1;
      Memo1.SelLength := Length(FindDialog1.FindText);
   end
   else
      MessageDlg ('Строка ' + FindDialog1.FindText + ' не найдена!', mtConfirmation, [mbYes], 0);
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

  todayTime:=Time;
  todayDate:=Date;

  StatusBar1.Panels[0].Text:=DateToStr(todayDate);
  StatusBar1.Panels[1].Text:=TimeToStr(todayTime);
  StatusBar1.Panels[2].Text:=memo1.Lines[memo1.CaretPos.Y];

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

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  SetDefaultLang('ru');
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  SetDefaultLang('en');
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
  Form4.Show;
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

procedure TForm1.Timer1Timer(Sender: TObject);
var a: string;
begin
  todayTime:=Time;
  todayDate:=Date;

  if SynCh = 0 then a:= IntToStr(SynEdit1.CaretY) else a:= IntToStr(SynEdit1.CaretY);

  StatusBar1.Panels[0].Text:=DateToStr(todayDate);
  StatusBar1.Panels[1].Text:=TimeToStr(todayTime);
  StatusBar1.Panels[2].Text:=a;
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
  ReplaceDialog1.Execute();
end;

procedure TForm1.ReplaceDialog1Find(Sender: TObject);
var
   Found, StartPos: Integer;
begin
   if Memo1.SelLength <> 0 then
      StartPos := Memo1.SelStart + Memo1.SelLength
   else
      StartPos := 0;

   Found := PosEx(FindDialog1.FindText, Memo1.Text, StartPos + 1);
   if Found <> 0 then
   begin
      Memo1.HideSelection := False;
      Memo1.SelStart := Found - 1;
      Memo1.SelLength := Length(FindDialog1.FindText);
   end
   else
      MessageDlg ('Строка ' + FindDialog1.FindText + ' не найдена!', mtConfirmation, [mbYes], 0);
end;

procedure TForm1.ReplaceDialog1Replace(Sender: TObject);
begin
  if frReplaceAll in ReplaceDialog1.Options then
  begin
     Memo1.Text := StringReplace(Memo1.Text, ReplaceDialog1.FindText, ReplaceDialog1.ReplaceText, [rfReplaceAll]);
  end
  else
  begin
    ReplaceDialog1Find(Self);
    if Memo1.SelLength > 0 then Memo1.SelText := ReplaceDialog1.ReplaceText;
  end;
end;


end.

