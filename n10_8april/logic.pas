unit logic;

interface
Uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;


  type Data = record
    Height :real;//входные данные
    Time:real;
  end;

  mas = array [1..128] of Data;

   TypeFile = file of mas;
   var Point:integer;

    Function CalculateTime(H:Real):Real;
    function search(u:mas):byte;//поиск последнего элемента в массиве
    procedure UpdateMas (var gg: mas;H,TM:Real);//добавляет новые данные в запись
    Function WriteNumber(n:string;m:mas):string;
    procedure WriteReport(Var Result:Tmemo; Height:string; Time:real) ;
     procedure save_params(H: Real; filename: string);
     procedure load_params(var H: Real; filename: string);
implementation

uses Unit1;

Function CalculateTime(H:Real): Real;
const
G=9.8;
var TM:real;
  begin
   TM:=sqrt(2*H/G);
   CalculateTime:=TM;
   UpdateMas(DataPoint,H,TM);
  end;


  function search(u:mas):byte;//поиск последнего элемента в массиве
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

  procedure UpdateMas (var gg: mas;H,TM:Real);//добавляет новые данные в запись
  var i:integer;
     begin
       inc(Point);
      gg[Point].Height:=H;
      gg[Point].Time:=TM;

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


  procedure save_params(H: Real; filename: string);
  var
    f: text;
  begin
       assign(f, filename);
       rewrite(f);
       writeln(f, H);
       close(f);
  end;

  procedure load_params(var H: Real; filename: string);
  var
    //buf: string;
    f: text;
  begin
      assign(f, filename);
      reset(f);
      readln(f, H);
      close(f);
  end;

      end.


