<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Phonebook.aspx.cs" Inherits="Phonebook.Phonebook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Repeater ID="rptPhonebookTabel" runat="server">
                <HeaderTemplate>
                    <table>
                        <tr class="pb-header">
                            <th scope="col">ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Edit</th>
                            <th scope="col">Delete</th>
                        </tr>
                </HeaderTemplate>
                <AlternatingItemTemplate>
                    <tr class="pb-altRow">
                        <td><%# Eval("PersonID") %></td>
                        <td><%# Eval("FirstName") %> <%# Eval("LastName") %></td>
                        <td><a href='PhoneNumbers.aspx?id=<%# Eval("PersonID") %>'>Phone</a></td>
                        <td><a href='EditPerson.aspx?id=<%# Eval("PersonID") %>'>Edit</a></td>
                        <td><asp:LinkButton ID="lbtn_Delete" runat="server" OnCommand="lbtn_Delete_Command" CommandArgument='<%# Eval("PersonID") %>'>Delete</asp:LinkButton></td>
                    </tr>
                </AlternatingItemTemplate>
                <ItemTemplate>
                    <tr class="pb-row">
                        <td><%# Eval("PersonID") %></td>
                        <td><%# Eval("FirstName") %> <%# Eval("LastName") %></td>
                        <td><a href='PhoneNumbers.aspx?id=<%# Eval("PersonID") %>'>Phone</a></td>
                        <td><a href='EditPerson.aspx?id=<%# Eval("PersonID") %>'>Edit</a></td>
                        <td><asp:LinkButton ID="lbtn_Delete" runat="server" OnCommand="lbtn_Delete_Command" CommandArgument='<%# Eval("PersonID") %>'>Delete</asp:LinkButton></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <br />
            <asp:Button ID="btn_InsertNewPerson" runat="server" Text="Insert New Person" OnClick="btn_InsertNewPerson_Click" />
        </div>
    </form>
</body>
</html>
