unit logic25;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage;
type Data = record
    X1,X2,X3,Y1,Y2,Y3,P,S: real;//������� ������
    Flag:boolean;
  end;

  mas = array [1..128] of Data;

   TypeFile = file of mas;
 function search(u:mas):byte;//����� ���������� �������� � �������
 Procedure Calculate(var ms: mas; X1,X2,X3,Y1,Y2,Y3:real);// -_-
 procedure save_params(X1,X2,X3,Y1,Y2,Y3: Real; filename: string);
 procedure load_params(var X1,X2,X3,Y1,Y2,Y3: Real; filename: string);
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

Procedure Calculate(var ms: mas; X1,X2,X3,Y1,Y2,Y3:real);// -_-
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
  ms[i].P:=AB+AC+BC;
  Per:=ms[i].P/2;
  ms[i].S:=sqrt(Per*(Per-AB)*(Per-AC)*(Per-BC));

end;


procedure save_params(X1,X2,X3,Y1,Y2,Y3: Real; filename: string);
  var
    f: text;
  begin
       assign(f, filename);
       rewrite(f);
       writeln(f, X1);
       writeln(f, X2);
       writeln(f, X3);
       writeln(f, Y1);
       writeln(f, Y2);
       writeln(f, Y3);

       close(f);
  end;



  procedure load_params(var X1,X2,X3,Y1,Y2,Y3: Real; filename: string);
  var
    //buf: string;
    f: text;
  begin
      assign(f, filename);
      reset(f);
      readln(f,X1);
      readln(f,X2);
      readln(f,X3);
      readln(f,Y1);
      readln(f,Y2);
      readln(f,Y3);

      close(f);
  end;



end.
