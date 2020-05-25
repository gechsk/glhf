unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus,U10;

type
  TForm1 = class(TForm) //<--Наверное это класс
    Calculate: TButton;   //<<--а это объекты
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
    procedure CalculateClick(Sender: TObject);//<<---методы(не совсем понял задание)

   { Найти в модуле формы (обычно это Unit1) класс формы (главного окна). Подписать.
Найти в модуле формы объект (экземпляр) этого класса. Подписать.
Найти поля этого класса. Подсказка: класс должен содержать компоненты, что вы поместили на форму. Это и есть поля класса формы.
Найти методы этого класса: их объявления и определения.
Как в разделе implementation описывается имя метода? Указывается ли там имя класса?}

    procedure Close1Click(Sender: TObject);
    procedure Guide1Click(Sender: TObject);
    procedure Save2Click(Sender: TObject);
    procedure SaveReport2Click(Sender: TObject);
    procedure Open2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CalculateClick(Sender: TObject); //<<--Объявление и определение
{название класса.название процедуры(входные данные)}
begin
  Calculation1;
end;


procedure TForm1.Close1Click(Sender: TObject);
begin
close;
end;

procedure TForm1.Guide1Click(Sender: TObject);
begin
ShowMessage ('Степанов Валерий №10. Определить время падения камня на поверхности земли с высоты h. ');
end;


procedure TForm1.Open2Click(Sender: TObject);

begin
openfile;
end;

procedure TForm1.Save2Click(Sender: TObject);
begin
save;
end;
procedure TForm1.SaveReport2Click(Sender: TObject);
begin
  Time.Lines.SaveToFile( 'ReportFile.txt');
 ShowMessage('the report is saved.');
end;

end.
