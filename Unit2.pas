unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    btnOpen: TButton;
    btnSave: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    OutputFilePathEdit: TEdit;
    btnEncrypt: TButton;
    EncryptionKeyEdit: TEdit;
    InputFilePathEdit: TEdit;
    Button1: TButton;
    procedure btnOpenClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnEncryptClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btnEncryptClick(Sender: TObject);
var
  InputFilePath, OutputFilePath, EncryptionKey : string;
  InputFileStream, OutputFileStream: TFileStream;
  ByteRead, ByteEncrypted: Byte;
  KeyIndex: Integer;
  EncryptionKeyBytes: TBytes;
begin
//Retrieve values from the input fields and controls
  InputFilePath := InputFilePathEdit.Text;
  OutputFilePath := OutputFilePathEdit.Text;
  EncryptionKey := EncryptionKeyEdit.Text;

  //Validate input fields
  if(InputFilePath = '') or (OutputFilePath = '') or (EncryptionKey = '') then
  begin
    ShowMessage ('Please fill in all fields.') ;
    Exit;
  end;

  //Check if the input file exists
  if not FileExists(InputFilePath) then
  begin
    ShowMessage('Input file does not exists.');
    Exit;
  end;

  //Perform Encryption
  try
    //Open input and output file streams
    InputFileStream := TFileStream.Create(InputFilePath, fmOpenRead);
    OutputFileStream := TFileStream.Create(OutputFilePath, fmCreate);

    //Convert the encryption key to bytes
    SetLength(EncryptionKeyBytes, Length(EncryptionKey));
      for KeyIndex := 1 to Length(EncryptionKey) do
        EncryptionKeyBytes[KeyIndex - 1] := Ord(EncryptionKey[KeyIndex]);

    //Encrypt the input file and write to the output file
    KeyIndex := 0;
    while InputFileStream.Position < InputFileStream.Size do
    begin
      InputFileStream.Read(ByteRead,SizeOf(ByteRead));
      ByteEncrypted := ByteRead xor EncryptionKeyBytes[KeyIndex];
      OutputFileStream.Write(ByteEncrypted, SizeOf(ByteEncrypted));

      //Move to the next key byte in a circular fashion
      Inc(KeyIndex);
      if KeyIndex >= Length(EncryptionKeyBytes) then
        KeyIndex := 0;
    end;

    //Displaya success message
    ShowMessage('Encryption complete.');
    except
    on E: Exception do
    begin
      ShowMessage('Error:' + E.Message);
    end;

  end;
  InputFileStream.Free;
  OutputFileStream.Free;
end;



procedure TForm2.btnOpenClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    InputFilePathEdit.Text := OpenDialog1.FileName;
  end;
end;

procedure TForm2.btnSaveClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    OutputFilePathEdit.Text := SaveDialog1.FileName;
  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
 Close;
end;

end.
