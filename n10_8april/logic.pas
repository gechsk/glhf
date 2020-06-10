unit logic;

interface
Uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;


  type ff= record
    HH :real;//входные данные
    TT :real; // резудьтат
  end;

  mas = array [1..128] of ff;

   TypeFile = file of mas;

    function Calculatee(H:string):string;
    function search(u:mas):byte;//поиск первого последнего элемента в массиве
    procedure UpdateMas (var gg: mas;H:string;T:string);//добавляет новые данные в запись
    Procedure SaveF(var FName:string;gg:mas );
    Function WriteNumber(n:string;m:mas):string;
    Function WriteNumber2(n:string;m:mas):string;
implementation

uses Unit1;


function Calculatee(H:string):string;
const
G=9.8;
var Hf:real;
  begin
   Hf:=StrToFloat(H);
   Calculatee:=FloatToStr(sqrt(2*Hf/G));
  end;


  function search(u:mas):byte;//поиск последнего элемента в массиве
  var
  i:integer;
  flag:boolean;
  begin
  i:=1;
     flag:=false;
    while flag=false  do
      if (u[i].HH>0) then
      inc(i)
      else
      begin
       flag:=true;
      end;
      search:=i;
  end;

  procedure UpdateMas (var gg: mas;H:string;T:string);//добавляет новые данные в запись
  var i:integer;
     begin
       i:=search(gg);
      gg[i].HH:=StrToFloat(H);
      gg[i].TT:=StrToFloat(T);

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
      WriteNumber:=FloatToStr(m[nf].HH);
     end;

     Function WriteNumber2(n:string;m:mas):string;
      var
      nf:integer;
       begin
        nf:=StrToInt(n);
        WriteNumber2:=FloatToStr(m[nf].TT);
       end;
end.
