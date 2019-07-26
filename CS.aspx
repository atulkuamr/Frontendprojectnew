<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CS.aspx.cs" Inherits="CS" %>
<%@ Register Src="~/Title.ascx" TagPrefix="HeadTitle" TagName="HTitle" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<HeadTitle:HTitle ID="thead" runat="server" />
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
<u>Encrypt</u><br />
<br />
Original Text:
<asp:TextBox ID="txtOriginalText" runat="server" Text="" />
<br />
<br />
Encrypted Text:
<asp:Label ID="lblEncryptedText" runat="server" Text="" />
<br />
<br />
<asp:Button ID="btnEncrypt" OnClick="Encrypt" Text="Encrypt" runat="server" />
<hr />
<u>Decrypt</u>
<br />
<br />
Encrypted Text:
<asp:TextBox ID="txtEncryptedText" runat="server" Text="" />
<br />
<br />
Decrypted Text:
<asp:Label ID="lblDecryptedText" runat="server" Text="" />
<br />
<br />
<asp:Button ID="btnDecrypt" OnClick="Decrypt" Text="Decrypt" runat="server" />
    </form>
</body>
</html>
