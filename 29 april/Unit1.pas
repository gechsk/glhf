unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Menus,U25, Vcl.Grids, Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Сalculate: TButton;
    Label1: TLabel;
    Image1: TImage;
    MainMenu1: TMainMenu;
    Clise1: TMenuItem;
    OpenDialog2: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Guide1: TMenuItem;
    X1: TMemo;
    X2: TMemo;
    X3: TMemo;
    Y1: TMemo;
    Y2: TMemo;
    Y3: TMemo;
    N2: TMenuItem;
    Open1: TMenuItem;
    Save2: TMenuItem;
    SaveReport2: TMenuItem;
    TSG: TStringGrid;
    procedure СalculateClick(Sender: TObject);
    procedure Clise1Click(Sender: TObject);
    procedure Guide1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Save2Click(Sender: TObject);
    procedure SaveReport2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Clise1Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Form1.BorderStyle := bsSingle;
InitialFillingInTheTable;
end;

procedure TForm1.Guide1Click(Sender: TObject);
begin
 ShowMessage('Степанов Валерий №25. Треугольник задан координатами своих вершин. Найти: а) периметр треугольника; б) площадь треугольника; http://чибгу.рф/zadachnik/Glava01/index01.htm#z25 ');
end;

procedure TForm1.Open1Click(Sender: TObject);

var f: TextFile;
FName,s1,s2,s3,s4,s5,s6 : string;
begin
if Form1.opendialog2.Execute then
begin
FName:= Form1.OpenDialog2.FileName;
AssignFile (f,FName);

Reset (f);
 readln(f,s1); //считываем
 readln(f,s2);
 readln(f,s3);
 readln(f,s4);
 readln(f,s5);
 readln(f,s6);
 X1.lines[0]:= s1; //заполняем
 X2.lines[0]:= s2;
 X3.lines[0]:= s3;
 Y1.lines[0]:= s4;
 Y2.lines[0]:= s5;
 Y3.lines[0]:= s6;
CloseFile(f);
end;
end;
procedure TForm1.Save2Click(Sender: TObject);
begin
SaveFile;
end;

procedure TForm1.SaveReport2Click(Sender: TObject);
begin
SaveReport;
end;



procedure TForm1.СalculateClick(Sender: TObject);
begin
 Calculate;
 FillingInTheTable;
end;

end.
