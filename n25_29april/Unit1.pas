unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.Grids, Vcl.Imaging.jpeg,logic25;

type
  TForm1 = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    �alculate: TButton;
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
    N1: TMenuItem;
    procedure �alculateClick(Sender: TObject);
    procedure Clise1Click(Sender: TObject);
    procedure Guide1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Save2Click(Sender: TObject);
    procedure SaveReport2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  gege:mas;
  f: TypeFile;

implementation

{$R *.dfm}

procedure TForm1.Clise1Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Form1.BorderStyle := bsSingle;
Form1.TSG.ColCount:=5;//�������(X)
   Form1.TSG.RowCount:=3;//������(Y)
   Form1.TSG.cells[0,1]:='��������(P):';
   Form1.TSG.Cells[0,2]:='�������(S):';
   Form1.TSG.Cells[1,0]:='���������';
   Form1.TSG.Cells[2,0]:='����� A';
   Form1.TSG.Cells[3,0]:='����� B';
   Form1.TSG.Cells[4,0]:='����� C';
   Form1.TSG.Cells[2,1]:='X';
   Form1.TSG.Cells[2,2]:='Y';
   Form1.TSG.Cells[3,1]:='X';
   Form1.TSG.Cells[3,2]:='Y';
   Form1.TSG.Cells[4,1]:='X';
   Form1.TSG.Cells[4,2]:='Y';
end;

procedure TForm1.Guide1Click(Sender: TObject);
begin
 ShowMessage('�������� ������� �25. ����������� ����� ������������ ����� ������. �����: �) �������� ������������; �) ������� ������������; http://�����.��/zadachnik/Glava01/index01.htm#z25 ');
end;

procedure TForm1.N1Click(Sender: TObject);
var
i:integer;
begin
i:=StrToInt(inputbox('Choise','enter the calculation number','2'));
  X1.Lines[0]:=FloatToStr(gege[i].X1);
  X2.Lines[0]:=FloatToStr(gege[i].X2);
  X3.Lines[0]:=FloatToStr(gege[i].X3);
  Y1.Lines[0]:=FloatToStr(gege[i].Y1);
  Y2.Lines[0]:=FloatToStr(gege[i].Y2);
  Y3.Lines[0]:=FloatToStr(gege[i].Y3);
 TSG.cells[0,1]:='��������(P):';
   TSG.Cells[0,2]:='�������(S):';
  TSG.Cells[1,0]:='���������';
   TSG.Cells[2,0]:='����� A';
   TSG.Cells[3,0]:='����� B';
   TSG.Cells[4,0]:='����� C';
   TSG.Cells[2,1]:='X';
   TSG.Cells[2,2]:='Y';
   TSG.Cells[3,1]:='X';
   TSG.Cells[3,2]:='Y';
   TSG.Cells[4,1]:='X';
   TSG.Cells[4,2]:='Y';
  TSG.Cells[2,1]:=Form1.TSG.Cells[2,1]+':'+FloatToStr(gege[i].X1);
  TSG.Cells[2,2]:=Form1.TSG.Cells[2,2]+':'+FloatToStr(gege[i].Y1);
  TSG.Cells[3,1]:=Form1.TSG.Cells[3,1]+':'+FloatToStr(gege[i].X2);
  TSG.Cells[3,2]:=Form1.TSG.Cells[3,2]+':'+FloatToStr(gege[i].Y2);
  TSG.Cells[4,1]:=Form1.TSG.Cells[4,1]+':'+FloatToStr(gege[i].X3);
  TSG.Cells[4,2]:=Form1.TSG.Cells[4,2]+':'+FloatToStr(gege[i].Y3);
  Form1.TSG.Cells[1,1]:=FormatFloat('#####.###',gege[i].P);//����������� ���������� ������ ����� �������
  Form1.TSG.Cells[1,2]:=FormatFloat('#####.###',gege[i].S);
end;

procedure TForm1.Open1Click(Sender: TObject);

var
FName: string;
begin
if Form1.opendialog2.Execute then
begin
FName:= Form1.OpenDialog2.FileName;
OpenF(FName,gege);
end;
end;
procedure TForm1.Save2Click(Sender: TObject);
var
Fname:string;
begin
if Form1.SaveDialog1.Execute then
begin
FName:= Form1.SaveDialog1.FileName;
SaveF(FName,gege);
end;
end;

procedure TForm1.SaveReport2Click(Sender: TObject);
begin
SaveReport;
end;



procedure TForm1.�alculateClick(Sender: TObject);
var i:integer;
a:single;
begin
if (TryStrToFloat(X1.lines[0],a)=false) then
begin
  ShowMessage('Oh, you entered X1 wrong);');
  exit;
end;

if (TryStrToFloat(X2.lines[0],a)=false) then
begin
  ShowMessage('Oh, you entered X2 wrong);');
  exit;
end;
if (TryStrToFloat(X3.lines[0],a)=false) then
begin
  ShowMessage('Oh, you entered X3 wrong);');
  exit;
end;
if (TryStrToFloat(Y1.lines[0],a)=false) then
begin
  ShowMessage('Oh, you entered Y1 wrong);');
  exit;
end;
if (TryStrToFloat(Y2.lines[0],a)=false) then
begin
  ShowMessage('Oh, you entered Y2 wrong);');
  exit;
end;
if (TryStrToFloat(Y3.lines[0],a)=false) then
begin
  ShowMessage('Oh, you entered Y3 wrong);');
  exit;
end;
 Calculate(gege, X1.Lines[0],X2.Lines[0],X3.Lines[0],Y1.Lines[0],Y2.Lines[0],Y3.Lines[0]);
 i:= search(gege)-1;
  TSG.cells[0,1]:='��������(P):';
   TSG.Cells[0,2]:='�������(S):';
  TSG.Cells[1,0]:='���������';
   TSG.Cells[2,0]:='����� A';
   TSG.Cells[3,0]:='����� B';
   TSG.Cells[4,0]:='����� C';
   TSG.Cells[2,1]:='X';
   TSG.Cells[2,2]:='Y';
   TSG.Cells[3,1]:='X';
   TSG.Cells[3,2]:='Y';
   TSG.Cells[4,1]:='X';
   TSG.Cells[4,2]:='Y';
  TSG.Cells[2,1]:=Form1.TSG.Cells[2,1]+':'+FloatToStr(gege[i].X1);
  TSG.Cells[2,2]:=Form1.TSG.Cells[2,2]+':'+FloatToStr(gege[i].Y1);
  TSG.Cells[3,1]:=Form1.TSG.Cells[3,1]+':'+FloatToStr(gege[i].X2);
  TSG.Cells[3,2]:=Form1.TSG.Cells[3,2]+':'+FloatToStr(gege[i].Y2);
  TSG.Cells[4,1]:=Form1.TSG.Cells[4,1]+':'+FloatToStr(gege[i].X3);
  TSG.Cells[4,2]:=Form1.TSG.Cells[4,2]+':'+FloatToStr(gege[i].Y3);
  Form1.TSG.Cells[1,1]:=FormatFloat('#####.###',gege[i].P);//����������� ���������� ������ ����� �������
  Form1.TSG.Cells[1,2]:=FormatFloat('#####.###',gege[i].S);

end;

end.