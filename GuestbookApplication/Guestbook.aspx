<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Guestbook.aspx.cs" Inherits="GuestbookApplication.Guestbook" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .textBoxWidth {
            width: 300px;
        }
        .textBoxHeight {
            height: 100px;
        }
        .gridViewWidth {
            width: 650px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                Please leave a message in our guestbook:</h3>
            <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" Width="450px">
                <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
                    <HeaderTemplate>
                        Name
                    </HeaderTemplate>
                    <ContentTemplate>
                        <table class="auto-style1">
                            <tr>
                                <td>Name:</td>
                                <td>
                                    <asp:TextBox ID="nameTextBox" runat="server" CssClass="textBoxWidth"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="nameFieldValidator" runat="server" ControlToValidate="nameTextBox" Display="None" ErrorMessage="Enter a name" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <ajaxToolkit:ValidatorCalloutExtender ID="nameFieldValidator_ValidatorCalloutExtender" runat="server" BehaviorID="nameFieldValidator_ValidatorCalloutExtender" TargetControlID="nameFieldValidator">
                                    </ajaxToolkit:ValidatorCalloutExtender>
                                    <asp:RegularExpressionValidator ID="nameExpValidator" runat="server" ControlToValidate="nameTextBox" Display="None" ErrorMessage="Enter name in correct format" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
                                    <ajaxToolkit:ValidatorCalloutExtender ID="nameExpValidator_ValidatorCalloutExtender" runat="server" BehaviorID="nameExpValidator_ValidatorCalloutExtender" TargetControlID="nameExpValidator">
                                    </ajaxToolkit:ValidatorCalloutExtender>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
                <ajaxToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
                    <HeaderTemplate>
                        Contact
                    </HeaderTemplate>
                    <ContentTemplate>
                        <table class="auto-style1">
                            <tr>
                                <td>Email:</td>
                                <td>
                                    <asp:TextBox ID="emailTextBox" runat="server" CssClass="textBoxWidth"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="emailFieldValidator" runat="server" ControlToValidate="emailTextBox" Display="None" ErrorMessage="Enter an email" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <ajaxToolkit:ValidatorCalloutExtender ID="emailFieldValidator_ValidatorCalloutExtender" runat="server" BehaviorID="emailFieldValidator_ValidatorCalloutExtender" TargetControlID="emailFieldValidator">
                                    </ajaxToolkit:ValidatorCalloutExtender>
                                    <asp:RegularExpressionValidator ID="emailExpValidator" runat="server" ControlToValidate="emailTextBox" Display="None" ErrorMessage="Enter email in correct format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    <ajaxToolkit:ValidatorCalloutExtender ID="emailExpValidator_ValidatorCalloutExtender" runat="server" BehaviorID="emailExpValidator_ValidatorCalloutExtender" TargetControlID="emailExpValidator">
                                    </ajaxToolkit:ValidatorCalloutExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>Leave some feedback:</td>
                                <td>
                                    <asp:TextBox ID="messageTextBox" runat="server" CssClass="textBoxWidth textBoxHeight" TextMode="MultiLine"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="messageFieldValidator" runat="server" ControlToValidate="messageTextBox" Display="None" ErrorMessage="Enter a message" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <ajaxToolkit:ValidatorCalloutExtender ID="messageFieldValidator_ValidatorCalloutExtender" runat="server" BehaviorID="messageFieldValidator_ValidatorCalloutExtender" TargetControlID="messageFieldValidator">
                                    </ajaxToolkit:ValidatorCalloutExtender>
                                    <asp:RegularExpressionValidator ID="messageExpValidator" runat="server" ControlToValidate="messageTextBox" Display="None" ErrorMessage="Enter a message in correct format" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
                                    <ajaxToolkit:ValidatorCalloutExtender ID="messageExpValidator_ValidatorCalloutExtender" runat="server" BehaviorID="messageExpValidator_ValidatorCalloutExtender" TargetControlID="messageExpValidator">
                                    </ajaxToolkit:ValidatorCalloutExtender>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </ajaxToolkit:TabPanel>
            </ajaxToolkit:TabContainer>
            <br />
                        <asp:Button ID="submitButton" runat="server" OnClick="submitButton_Click" Text="Submit" />
                        &nbsp;
                        <asp:Button ID="clearButton" runat="server" CausesValidation="False" OnClick="clearButton_Click" Text="Clear" />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <br />
                    <h4>
                        <asp:Label ID="outputLabel" runat="server" Text="Label" Visible="False"></asp:Label>
                        <asp:GridView ID="messagesGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="gridViewWidth" DataKeyNames="MessageID" DataSourceID="messagesEntityDataSource" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                <asp:BoundField DataField="Message1" HeaderText="Message" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </h4>
                </ContentTemplate>
            </asp:UpdatePanel>
            <p>
                <asp:EntityDataSource ID="messagesEntityDataSource" runat="server" ConnectionString="name=GuestbookEntities" DefaultContainerName="GuestbookEntities" EnableFlattening="False" EntitySetName="Messages">
                </asp:EntityDataSource>
            </p>
        </div>
    </form>
</body>
</html>
