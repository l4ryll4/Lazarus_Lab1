unit lr1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls;

type

  { TForm4 }

  TForm4 = class(TForm)
    FontDialog1: TFontDialog;
    MainMenu1: TMainMenu;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Tekst: TMemo;
    Fail: TMenuItem;
    Spavka2: TMenuItem;
    Oprogramme: TMenuItem;
    Naiti: TMenuItem;
    Zamenit: TMenuItem;
    Shrift: TMenuItem;
    Tema: TMenuItem;
    Videlitvse: TMenuItem;
    Virezat: TMenuItem;
    Kopirovat: TMenuItem;
    Vstavit: TMenuItem;
    Sohranitkak: TMenuItem;
    Vihod: TMenuItem;
    Sohranit: TMenuItem;
    Pravka: TMenuItem;
    Vid: TMenuItem;
    Poisk: TMenuItem;
    Spavka: TMenuItem;
    Novyi: TMenuItem;
    Otkrit: TMenuItem;
    Zakrit: TMenuItem;
    procedure NovyiClick(Sender: TObject);
    procedure OtkritClick(Sender: TObject);
    procedure SohranitClick(Sender: TObject);
    procedure SohranitkakClick(Sender: TObject);
  private

  public

  end;

var
  Form4: TForm4;

implementation

{$R *.lfm}

{ TForm4 }
procedure Ansi_Memo(File_Ansi: string);
   // Загрузка текста из файла в memo-поле на форме
   var
   tfile: TStringList;
   str: string;
   begin
   tfile:= TStringList.Create; // создать список строк
   // загрузить текст из файла в список  строк
   tfile.LoadFromFile(File_Ansi);
   str:= tfile.Text;
   // загрузить текст из списка в memo-поле
   Form4.Tekst.Lines.Add(str);
   tfile.Free;
   end;
   procedure Memo_Ansi(File_Ansi: string);
   // Сохранение текста из memo-поля в файле на диске
   var
   tfile: TStringList;
   str: string;
   begin
   tfile:= TStringList.Create; // создать список строк
   str:=Form4.Tekst.text;
   // преобразовать текст в системную кодировку
   //str:= UTF8ToSys(str);
   //tfile.Add(str);
   // сохранить в файле
   tfile.SaveToFile(File_Ansi);
   tfile.Free;
   end;
procedure TForm4.NovyiClick(Sender: TObject);
begin

end;

procedure TForm4.OtkritClick(Sender: TObject);
var
File_Ansi:string;
begin
  if OpenDialog1.Execute then
   begin
      File_Ansi:= OpenDialog1.FileName;
      Ansi_Memo(File_Ansi);
   end;
end;


procedure TForm4.SohranitClick(Sender: TObject);
begin

end;

procedure TForm4.SohranitkakClick(Sender: TObject);
var
File_Ansi:string;
begin
    if SaveDialog1.Execute then
   begin
      File_Ansi:=SaveDialog1.FileName;
      Memo_Ansi(File_Ansi);
   end;
end;

end.

