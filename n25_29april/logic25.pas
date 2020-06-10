unit logic25;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage;
type ff= record
    X1,X2,X3,Y1,Y2,Y3: real;//входные данные
    P,S:real; // резудьтат
    Flag:boolean;
  end;

  mas = array [1..128] of ff;

   TypeFile = file of mas;
 function search(u:mas):byte;//поиск последнего элемента в массиве
 Procedure Calculate(var ms: mas; X1,X2,X3,Y1,Y2,Y3:string);// -_-
 Procedure SaveF(Fn:string;mas:mas);
 procedure OpenF(FName:string;var mas:mas);
 Procedure SaveReport;
implementation
uses Unit1;

function search(u:mas):byte;//поиск последнего элемента в массиве
  var
  i:integer;
  flag:boolean;
  begin
  i:=1;
     flag:=false;
    while flag=false  do
      if (u[i].Flag=true) then
      inc(i)
      else
      begin
       flag:=true;
      end;
      search:=i;
  end;

Procedure Calculate(var ms: mas; X1,X2,X3,Y1,Y2,Y3:string);// -_-
var i:integer;
Per,AB,AC,BC:real;
begin
  i:= search(ms);
   {¬водим данные в массив}
  ms[i].X1:=StrToFloat(X1);
  ms[i].X2:=StrToFloat(X2);
  ms[i].X3:=StrToFloat(X3);
  ms[i].Y1:=StrToFloat(Y1);
  ms[i].Y2:=StrToFloat(Y2);
  ms[i].Y3:=StrToFloat(Y3);
  ms[i].Flag:=true;
  {расчЄт}
  AB:=sqrt(sqr(ms[i].X1-ms[i].X2)+sqr(ms[i].Y1-ms[i].Y2));
  AC:=sqrt(sqr(ms[i].X3-ms[i].X1)+sqr(ms[i].Y3-ms[i].Y1));
  BC:=sqrt(sqr(ms[i].X3-ms[i].X2)+sqr(ms[i].Y3-ms[i].Y2));
  ms[i].P:=AB+AC+BC;
  Per:=ms[i].P/2;
  ms[i].S:=sqrt(Per*(Per-AB)*(Per-AC)*(Per-BC));

end;
Procedure SaveF(Fn:string;mas:mas ) ;
var f:TypeFile;
begin

  AssignFile(f,Fn);
Rewrite(f);
write(f,gege);
CloseFile(f);
end;

procedure OpenF(FName:string;var mas:mas);
var f:TypeFile;
begin
AssignFile (f,FName);
Reset (f);
Read(f,mas);
CloseFile(f);
end;
Procedure SaveReport;
begin
Form1.TSG.cols[1].SaveToFile('ReportFilesss.txt');
end;


end.
