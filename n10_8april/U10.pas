
unit U10;

interface

Uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus;
 Procedure openfile;
 Procedure save;
 type FF= record
    h:real;
    t:real;
 end;

implementation
{я умирал меня будили}
 uses Unit1;

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
