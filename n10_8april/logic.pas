unit logic;

interface
Uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;


  type Data = record
    Height :real;//������� ������
  end;

  mas = array [1..128] of Data;

   TypeFile = file of mas;
   var Point:integer;

    Function CalculateTime(H:Real):Real;
    function search(u:mas):byte;//����� ���������� �������� � �������
    procedure UpdateMas (var gg: mas;H:Real);//��������� ����� ������ � ������
    Procedure SaveF(var FName:string;gg:mas );
    Function WriteNumber(n:string;m:mas):string;
    procedure WriteReport(Var Result:Tmemo; Height:string; Time:real) ;
    function CheckChicken(var Memo:Tmemo):boolean;
implementation

uses Unit1;

Function CalculateTime(H:Real): Real;
const
G=9.8;
  begin
   CalculateTime:=sqrt(2*H/G);
   UpdateMas(DataPoint,H);
  end;


  function search(u:mas):byte;//����� ���������� �������� � �������
  var
  i:integer;
  flag:boolean;
  begin
  i:=1;
     flag:=false;
    while flag=false  do
      if (u[i].Height>0) then
      inc(i)
      else
      begin
       flag:=true;
      end;
      search:=i;
  end;

  procedure UpdateMas (var gg: mas;H:Real);//��������� ����� ������ � ������
  var i:integer;
     begin
       inc(Point);
      gg[Point].Height:=H;

     end;


     Procedure SaveF(var FName:string;gg:mas );
     var f:TypeFile;
     begin
     AssignFile(f,FName);
     Rewrite(f);
        Write(f,gg);
     CloseFile(f);
     end;

     Function WriteNumber(n:string;m:mas):string;
     var
      nf:integer;
     begin
      nf:=StrToInt(n);
      WriteNumber:=FloatToStr(m[nf].Height);
     end;

     procedure WriteReport(Var Result:Tmemo; Height:string; Time:real) ;
     var c: integer;
     begin
     c:=1;
           while (result.Lines[c]<>'') do
            inc(c);

            result.Lines[c]:='Height='+Height;
             result.Lines[c+1]:='Time='+FloatToStr(Time)+'(second)';
              result.Lines[c+2]:='___________________________';
     end;

       function CheckChicken(var Memo:Tmemo):boolean;
var i,c:integer;
P,S:real;
a:single;
  begin
     CheckChicken:=false;
     if (TryStrToFloat(memo.lines[0],a)=false) then
    begin
      memo.Color:=clred;
       ShowMessage('Oh, you entered the data incorrectly);');
       exit
     end
  else
   memo.Color:=clwhite;
   CheckChicken:=true;
  end;
      end.


