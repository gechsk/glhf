
unit U10;

interface

Uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;
 Procedure Calculation1;
 Procedure openfile;
 Procedure save;

implementation
{я умирал меня будили}
 uses Unit1;
Procedure Calculation1;//входные данные: высота, время
 Const g=9.8;
 var h,t:real;
 a:single;
 begin
 if(TryStrToFloat(Form1.height.Lines[0],a)=false) then
 begin
   ShowMessage('Height entered incorrectly.');
   exit;
 end;

 h:=StrToFloat(copy(Form1.height.text,1,(length(Form1.height.Lines[0]))));
 t:=sqrt(2*h/g);
 Form1.Time.text:=FloatToStr(t);
 end;

 Procedure openfile;
 var f: TextFile;
FName,s: string;
begin
if Form1.opendialog1.Execute then
begin
FName:= Form1.OpenDialog1.FileName;
AssignFile (f,FName);
reset(f);
end;
readln(f,s);
Form1.height.Text:=s;
closefile(f);
end;

Procedure save;
 var f: TextFile;
FName,s : string;
begin
if Form1.SaveDialog1.Execute then
FName:= Form1.SaveDialog1.FileName;
AssignFile(f,Fname);
Rewrite(f);
 s:=Form1.height.Text;
 Writeln(f,s);
 CloseFile(f);
end;



// проверка входных данных

end.
