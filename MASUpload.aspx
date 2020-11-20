<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MASUpload.aspx.cs" Inherits="MASUploadAutomateScript.MASUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 226px;
        }
        .auto-style2 {
            margin-right: 3px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="OuterDiv">
            <table id="tblOuter">
       <tr>
            <td>
                <strong>1.Upload text File
             </strong>
             </td>
           <td class="auto-style1" >
        <asp:FileUpload ID="FileUpload1" runat="server" />
               </td>
          
           <td>
               <asp:Label ID="lblFileUpload" runat="server" visible="false" Text="Label"></asp:Label>
           </td>
            </tr>
                

                <tr>
                    <td class="auto-style1">
                        <strong> 2.Enter the Archive Drive path</strong>

                    </td>
                    <td>
                        <asp:TextBox ID="tbArchiveDrivePath" runat="server"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                         <strong> 3.Enter the path where CCUser wants it to be placed</strong>
                         
                        </td>
                    <td>
                        <asp:TextBox ID="tbUserPath" runat="server"></asp:TextBox>
                    </td>

                </tr>

                <tr>
                    <td>
                         <strong> 4.Enter the name of output file</strong>
                        
                        </td>
                    <td>
                        <asp:TextBox ID="tbOutputfile" runat="server"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td>
    
        <asp:Button ID="Button1" runat="server" Text="UploadFile" OnClick="Generate_DAT_File" />
                        <asp:Label ID="lblWriteStatus" Visible="false" runat="server" Text="Label"></asp:Label>
                        </td>

                </tr>
                <tr>
                        <td>
                         <strong> Enter the command to run on Power Shell</strong>
                            </td>
                    <td>
                            <asp:TextBox ID="tbRunScript" runat="server"></asp:TextBox>
                        
                        </td>
                    <td>
                        <asp:Button ID="btnRunCommand" runat="server" Text="RunScript" OnClick="Run_Power_Command" />
                    </td>
                </tr>
                </table>
            <table>
                <tr>
                    <td>
                        <asp:TextBox ID="tbDisplayScript" runat="server" BackColor="#3333FF" ForeColor="White" Height="483px" TextMode="MultiLine" Width="800px" CssClass="auto-style2"></asp:TextBox>
                        </td>
                </tr>
                </table>
             </div>
    </form>
</body>
</html>
