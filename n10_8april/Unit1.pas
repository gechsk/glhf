unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus,logic;

type
  TForm1 = class(TForm) //<--�������� ��� �����
    Calculate: TButton;   //<<--� ��� �������
    HeightLabel: TLabel;
    TimeLabel: TLabel;
    Time: TMemo;
    MainMenu1: TMainMenu;
    Close1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Guide1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    N1: TMenuItem;
    Save2: TMenuItem;
    SaveReport2: TMenuItem;
    Open2: TMenuItem;
    height: TMemo;
    Label3: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    procedure CalculateClick(Sender: TObject);//<<---������(�� ������ ����� �������)

   { ����� � ������ ����� (������ ��� Unit1) ����� ����� (�������� ����). ���������.
����� � ������ ����� ������ (���������) ����� ������. ���������.
����� ���� ����� ������. ���������: ����� ������ ��������� ����������, ��� �� ��������� �� �����. ��� � ���� ���� ������ �����.
����� ������ ����� ������: �� ���������� � �����������.
��� � ������� implementation ����������� ��� ������? ����������� �� ��� ��� ������?}

    procedure Close1Click(Sender: TObject);
    procedure Guide1Click(Sender: TObject);
    procedure Save2Click(Sender: TObject);
    procedure SaveReport2Click(Sender: TObject);
    procedure Open2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;
  gege: mas;
  FName:string;

implementation

{$R *.dfm}

 procedure TForm1.Button1Click(Sender: TObject);
 var
 a:single;
 begin
 if(TryStrToFloat(Edit1.text,a)=false) then
 begin
   ShowMessage('Number entered incorrectly.');
   exit;
 end
 else
 begin
  height.Lines[0]:=WriteNumber(Edit1.Text,gege);
  time.Lines[0]:=WriteNumber2(Edit1.Text,gege);

 end;
 end;

procedure TForm1.CalculateClick(Sender: TObject); //<<--���������� � �����������
{�������� ������.�������� ���������(������� ������)}
var
 a:single;
 begin
 if(TryStrToFloat(Form1.height.Lines[0],a)=false) then
 begin
   ShowMessage('Height entered incorrectly.');
   exit;
 end
 else
   begin
    Time.text:=Calculatee(height.Lines[0]);
    UpdateMas(gege,height.Lines[0],time.Lines[0]);
   end;

end;


procedure TForm1.Close1Click(Sender: TObject);
begin
close;
end;

procedure TForm1.Guide1Click(Sender: TObject);
begin
ShowMessage ('�������� ������� �10. ���������� ����� ������� ����� �� ����������� ����� � ������ h. ');
end;


procedure TForm1.Open2Click(Sender: TObject);
 var f:TypeFile;
begin
if Form1.opendialog1.Execute then
begin
FName:= Form1.OpenDialog1.FileName;
AssignFile (f,FName);
reset(f);
end;
read(f,gege);
end;

procedure TForm1.Save2Click(Sender: TObject);
begin
if Form1.SaveDialog1.Execute then
FName:= Form1.SaveDialog1.FileName;
SaveF(FName,gege);
end;
procedure TForm1.SaveReport2Click(Sender: TObject);
begin
  Time.Lines.SaveToFile( 'ReportFile.txt');
 ShowMessage('the report is saved.');
end;

end.
