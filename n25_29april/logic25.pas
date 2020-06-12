unit logic25;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage;
type Data = record
    X1,X2,X3,Y1,Y2,Y3: real;//������� ������
    Flag:boolean;
  end;

  mas = array [1..128] of Data;

   TypeFile = file of mas;
 function search(u:mas):byte;//����� ���������� �������� � �������
 Procedure Calculate(var ms: mas; X1,X2,X3,Y1,Y2,Y3:real ;var P,S:real);// -_-
 Procedure SaveF(Fn:string;mas:mas);
 procedure OpenF(FName:string;var mas:mas);
 function CheckChicken(var Memo:Tmemo):boolean;
implementation
uses Unit1;

function search(u:mas):byte;//����� ���������� �������� � �������
  var
  i:integer;
  flag:boolean;
  begin
  i:=1;
     flag:=false;
     if u[i].Flag=true then
      search:=i
      else
    while flag<>true  do
      if (u[i].Flag=false) then
      inc(i)
      else
      begin
       flag:=true;
      end;
      search:=i;
  end;

Procedure Calculate(var ms: mas; X1,X2,X3,Y1,Y2,Y3:real; var P,S:real);// -_-
var i:integer;
Per,AB,AC,BC:real;
begin
  i:= search(ms)+1;
   {������ ������ � ������}

  ms[i].X1:=X1;
  ms[i].X2:=X2;
  ms[i].X3:=X3;
  ms[i].Y1:=Y1;
  ms[i].Y2:=Y2;
  ms[i].Y3:=Y3;
  ms[i].Flag:=true ;
  ms[i-1].Flag:=false;
  {������}
  AB:=sqrt(sqr(ms[i].X1-ms[i].X2)+sqr(ms[i].Y1-ms[i].Y2));
  AC:=sqrt(sqr(ms[i].X3-ms[i].X1)+sqr(ms[i].Y3-ms[i].Y1));
  BC:=sqrt(sqr(ms[i].X3-ms[i].X2)+sqr(ms[i].Y3-ms[i].Y2));
  P:=AB+AC+BC;
  Per:=P/2;
  S:=sqrt(Per*(Per-AB)*(Per-AC)*(Per-BC));

end;
Procedure SaveF(Fn:string;mas:mas ) ;
var f:TypeFile;
begin

  AssignFile(f,Fn);
Rewrite(f);
write(f,mas);
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
