unit U25;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Menus;
   Procedure OpenFile;
   procedure SaveFile;
   Procedure SaveReport;
   Procedure Calculate;
   Procedure FillingInTheTable;
   Procedure InitialFillingInTheTable;

implementation
uses unit1;
Procedure OpenFile;
  var f: TextFile;
FName,s1,s2,s3,s4,s5,s6 : string;
begin
if Form1.opendialog2.Execute then
begin
FName:= Form1.OpenDialog2.FileName;
AssignFile (f,FName);

Reset (f);
 readln(f,s1); //���������
 readln(f,s2);
 readln(f,s3);
 readln(f,s4);
 readln(f,s5);
 readln(f,s6);
 Form1.X1.lines[0]:= s1; //���������
 Form1.X2.lines[0]:= s2;
 Form1.X3.lines[0]:= s3;
 Form1.Y1.lines[0]:= s4;
 Form1.Y2.lines[0]:= s5;
 Form1.Y3.lines[0]:= s6;



CloseFile(f);
end;

end;

Procedure SaveFile;
  var f: TextFile;
FName,s1,s2,s3,s4,s5,s6 : string;
begin
if Form1.SaveDialog1.Execute then
FName:= Form1.SaveDialog1.FileName;
AssignFile(f,Fname);
Rewrite(f);
 s1:=Form1.X1.lines[0]; //���������
 s2:=Form1.X2.lines[0];
 s3:=Form1.X3.lines[0];
 s4:=Form1.Y1.lines[0];
 s5:=Form1.Y2.lines[0];
 s6:=Form1.Y3.lines[0];
 Writeln(f,s1); //��������� ����
 Writeln(f,s2);
 Writeln(f,s3);
 Writeln(f,s4);
 Writeln(f,s5);
 Writeln(f,s6);
 CloseFile(f);
end;
Procedure SaveReport;
begin
Form1.TSG.cols[1].SaveToFile('ReportFilesss.txt');
end;

Procedure Calculate;
var ax,ay,bx,by,cx,cy,Per,PR,Pl,AB,AC,BC:real;
a:single;
begin

if (TryStrToFloat(Form1.X1.lines[0],a)=false) then
begin
  ShowMessage('Oh, you entered X1 wrong);');
  exit;
end;

if (TryStrToFloat(Form1.X2.lines[0],a)=false) then
begin
  ShowMessage('Oh, you entered X2 wrong);');
  exit;
end;
if (TryStrToFloat(Form1.X3.lines[0],a)=false) then
begin
  ShowMessage('Oh, you entered X3 wrong);');
  exit;
end;
if (TryStrToFloat(Form1.Y1.lines[0],a)=false) then
begin
  ShowMessage('Oh, you entered Y1 wrong);');
  exit;
end;
if (TryStrToFloat(Form1.Y2.lines[0],a)=false) then
begin
  ShowMessage('Oh, you entered Y2 wrong);');
  exit;
end;
if (TryStrToFloat(Form1.Y3.lines[0],a)=false) then
begin
  ShowMessage('Oh, you entered Y3 wrong);');
  exit;
end;



ax:= StrToFloat(Form1.X1.lines[0]);
ay:= StrToFloat(Form1.Y1.lines[0]);
bx:= StrToFloat(Form1.X2.lines[0]);
by:= StrToFloat(Form1.Y2.lines[0]);
cx:= StrToFloat(Form1.X3.lines[0]);
cy:= StrToFloat(Form1.Y3.lines[0]);
AB:=sqrt(sqr(ax-bx)+sqr(ay-by));
AC:=sqrt(sqr(cx-ax)+sqr(cy-ay));
BC:=sqrt(sqr(cx-bx)+sqr(cy-by));
PR:=AB+AC+BC;
Per:=PR/2;
PL:=sqrt(Per*(Per-AB)*(Per-AC)*(Per-BC));
Form1.TSG.Cells[1,1]:=FormatFloat('#####.###',PR);//����������� ���������� ������ ����� �������
Form1.TSG.Cells[1,2]:=FormatFloat('#####.###',PL);
end;
  Procedure FillingInTheTable;
  begin
   Form1.TSG.Cells[2,1]:=Form1.TSG.Cells[2,1]+':'+Form1.X1.text;
   Form1.TSG.Cells[2,2]:=Form1.TSG.Cells[2,2]+':'+Form1.Y1.text;
   Form1.TSG.Cells[3,1]:=Form1.TSG.Cells[3,1]+':'+Form1.X2.text;
   Form1.TSG.Cells[3,2]:=Form1.TSG.Cells[3,2]+':'+Form1.Y2.text;
   Form1.TSG.Cells[4,1]:=Form1.TSG.Cells[4,1]+':'+Form1.X3.text;
   Form1.TSG.Cells[4,2]:=Form1.TSG.Cells[4,2]+':'+Form1.Y3.text;
  end;
  Procedure InitialFillingInTheTable; //���������� ����������� � �������
  begin
   Form1.TSG.ColCount:=5;//�������(X)
   Form1.TSG.RowCount:=3;//������(Y)
   Form1.TSG.cells[0,1]:='��������(P):';
   Form1.TSG.Cells[0,2]:='�������(S):';
   Form1.TSG.Cells[1,0]:='���������';
   Form1.TSG.Cells[2,0]:='����� A';
   Form1.TSG.Cells[3,0]:='����� B';
   Form1.TSG.Cells[4,0]:='����� C';
   Form1.TSG.Cells[2,1]:='X';
   Form1.TSG.Cells[2,2]:='Y';
   Form1.TSG.Cells[3,1]:='X';
   Form1.TSG.Cells[3,2]:='Y';
   Form1.TSG.Cells[4,1]:='X';
   Form1.TSG.Cells[4,2]:='Y';


  end;
end.
