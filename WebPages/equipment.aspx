<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/PrivateMasterPage.master" AutoEventWireup="true" CodeFile="equipment.aspx.cs" Inherits="WebPages_equipment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
       <br />
    <div class="container">
        <div class="row">
            <div class="col-md-1"></div>
    <div class="col-md-10" style="border-style:dotted; border-color:black;border-width:thick;border-spacing:initial">
        <br />
        <div class="row">
                    <div class="col-md-12 col-xs-12" style="text-align:center;">
                        <asp:Label ID="Label10" runat="server" Text="EQUIPMENTS" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </div> 
                    </div>
          <div id="Add" runat="server" visible="false">
                        <div class="row">
                            <div class="col-md-10">
                            </div>
                            <div class="col-md-1">
                                <asp:Button ID="ButtonView2" runat="server" Text="View" Style="background-color:#49d0d5" Font-Bold="true" CssClass="btn-primary" CausesValidation="false" OnClick="ButtonView2_Click" />
                            </div>
                        </div>
         
        <br />

               <div class="row">
     
        <div class="col-md-3">
        </div>
        <div class="col-md-2 aligntext">
              <asp:Label ID="Label17" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label1" runat="server" Text="Equipment Name" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text=":" Font-Bold="true"></asp:Label>
        </div>
        <div class="col-md-5">
            <asp:TextBox ID="Textequipname" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:requiredfieldvalidator id="RequiredFieldValidator3" runat="server" setfocusonerror="True" errormessage="Enter Equipment Name"
                controltovalidate="Textequipname" causesvalidation="false"></asp:requiredfieldvalidator>
        </div>
        <div class="col-md-2">
        </div>
    </div>
        <br />
               <div class="row">
     
        <div class="col-md-3">
        </div>
        <div class="col-md-2 aligntext">
              <asp:Label ID="Label16" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label12" runat="server" Text="Equipment ID" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label13" runat="server" Text=":" Font-Bold="true"></asp:Label>
        </div>
        <div class="col-md-5">
            <asp:TextBox ID="TextID" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:requiredfieldvalidator id="RequiredFieldValidator6" runat="server" setfocusonerror="True" errormessage="Enter ID"
                controltovalidate="TextID" causesvalidation="false"></asp:requiredfieldvalidator>
        </div>
        <div class="col-md-2">
        </div>
    </div>
        <br  />
              <div class="row">
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-2 aligntext">
                                <asp:Label ID="Label28" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label14" runat="server" Text="DOP" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label15" runat="server" Text=":" Font-Bold="true"></asp:Label>
                            </div>

                            <div class="col-md-4">
                                <asp:TextBox ID="TextDOP" runat="server" CssClass="form-control" CausesValidation="false"></asp:TextBox>
                                

 <cc1:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="TextDOP" Format="dd/MM/yyyy" PopupButtonID="ImgStartDate">
                            </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" SetFocusOnError="True" ErrorMessage="Enter DOP "
                                    ControlToValidate="TextDOP" CausesValidation="false"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-1">
                            </div>
                        </div>
                        <br />
               <div class="row">
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-2 aligntext">
                                <asp:Label ID="Label37" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label38" runat="server" Text="Cost" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label39" runat="server" Text=":" Font-Bold="true"></asp:Label>
                            </div>

                            <div class="col-md-4">
                                <asp:DropDownList ID="DropDownCost" runat="server" CssClass="form-control" CausesValidation="false">
                                    <asp:ListItem>--Select--</asp:ListItem>
                                    <asp:ListItem>1k-5k</asp:ListItem>
                                    <asp:ListItem>6k-10k</asp:ListItem>
                                    <asp:ListItem>11k-20k-</asp:ListItem>
                                    <asp:ListItem>21k-30k</asp:ListItem>
                                    <asp:ListItem>31k-40k</asp:ListItem>
                                    <asp:ListItem>41k-50k</asp:ListItem>
                                    <asp:ListItem>51k-1L</asp:ListItem>
                                    <asp:ListItem>1L+</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" SetFocusOnError="True" ErrorMessage="Select Cost"
                                    ControlToValidate="DropDownCost" InitialValue="--Select--" CausesValidation="false"></asp:RequiredFieldValidator>



                            </div>
                            <div class="col-md-1">
                            </div>
                        </div>
                        <br />
                <div class="row">
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-2 aligntext">
                                <asp:Label ID="Label27" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label5" runat="server" Text="Quantity" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label6" runat="server" Text=":" Font-Bold="true"></asp:Label>
                            </div>

                            <div class="col-md-4">
                                <asp:TextBox ID="TextQuantity" CssClass="form-control" runat="server" CausesValidation="false" ></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" SetFocusOnError="True" ErrorMessage="Enter Quantity"
                                    ControlToValidate="TextQuantity" CausesValidation="false"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-1">
                            </div>
                        </div>
                        <br />
                 <div class="row">
                            <div class="col-md-5">
                            </div>
                            <div class="col-md-4">
                                <asp:Button ID="ButtonSubmit1" runat="server" Text="Submit" Style="background-color: #49d0d5" CssClass="btn-primary" Font-Bold="true" OnClick="ButtonSubmit1_Click"/>
                                   <%-- <asp:Button ID="Btnupdate" runat="server" Text="Submit" Style="background-color: #b7c268" CssClass="btn-primary" Font-Bold="true" Visible="false" OnClick="Btnupdate_Click"/>--%>
                                <asp:Button ID="ButtonRefresh2" runat="server" Text="Refresh" Style="background-color: #49d0d5" CssClass="btn-primary" Font-Bold="true" CausesValidation="false" OnClick="ButtonRefresh2_Click" />
                            </div>
                            <div class="col-md-2">
                            </div>
                        </div>

                        <br />
               <div class="col-md-1"> 
                        </div>
                    </div>
         <div id="divViewMaster" runat="server" visible="true">
                        <div class="row">
                            <div class="col-md-10"></div>
                            <div class="col-md-1">
                                <asp:Button ID="buttonAdd1" Text="Add" runat="server" Style="background-color:#49d0d5" Font-Bold="true" CssClass="btn-primary" CausesValidation="false" OnClick="buttonAdd1_Click"  />
                            </div>
                        </div>
                        <br />
              <asp:Label ID="lblmid" runat="server" Visible="false" Text="Label"></asp:Label>
             <div class="row">
                            <div class="col-md-4">
                                <asp:Label ID="Lblvwname" runat="server" Text="Equipment Name :" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="TxtName" runat="server" AutoComplete="off" Width="60%" CssClass="form-control Textbox"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server"
                                    FilterType="UpperCaseLetters,LowerCaseLetters,Custom" ValidChars=" .'"
                                    TargetControlID="TxtName">
                                </cc1:FilteredTextBoxExtender>
                            </div>
                 
                            <div class="col-md-6">
                                <br />
                                <asp:Button ID="buttonSearch1" Text="Search" runat="server" Style="background-color:#49d0d5" Font-Bold="true" CssClass="btn-primary" CausesValidation="false" OnClick="buttonSearch1_Click" />&nbsp
                     
            <asp:Button ID="buttonReset1" Text="Reset" runat="server" Style="background-color:#49d0d5" Font-Bold="true" CssClass="btn-primary" CausesValidation="false" OnClick="buttonReset1_Click" />&nbsp
                            </div>
                            <div class="col-md-2"></div>
                            <br />
                  <div class="row">
                                <div class="col-md-9" align="left">
                                </div>
                                <div class="col-md-3" align="center">
                                    <asp:Label ID="lblCount" runat="server" Font-Bold="true" Text="0 Records Found"></asp:Label>
                                </div>
                            </div>
                         <div class="row">
                                <div class="col-md-12" align="center" id="DivExport" style="overflow-x: scroll" runat="server">
                                    <br />
                                    <asp:Label ID="lblExportHead" runat="server" Font-Bold="true" Text="EQUIPMENT DETAILS"
                                        Font-Size="X-Large" Visible="false">
                                    </asp:Label>
                                    <asp:GridView ID="Gvintroducer1" runat="server" AutoGenerateColumns="False" CssClass="Admingridtable1"
                                        EmptyDataText="No Records Found!!!" Width="64%" EnableModelValidation="True" OnRowCommand="Gvintroducer1_RowCommand">

                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="slno" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Edit">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkEdt" runat="server" CommandName="Edt" CommandArgument='<%# Eval("Equip_MasterId") %>' OnClientClick="return confirm('Are you sure you want to Edit? '); aspnetForm.target ='_self'"><i class="fa fa-edit" style="color:#422f0f; font-size:1.5em;"></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Equipment Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGname" runat="server" Text='<%# Eval("Equip_Name") %>' Style="word-break: break-all; word-wrap: break-word" Width="150px"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGID" runat="server" Text='<%# Eval("Equip_ID") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="DOP">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblremarks" runat="server" Text='<%# Eval("DOP1") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>

                            

                                            <asp:TemplateField HeaderText="Cost">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGCost" runat="server" Text='<%# Eval("Equip_Cost") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>
                                                
                                             
                                            <asp:TemplateField HeaderText="Quantity">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGQuantity" runat="server" Text='<%# Eval("Equip_Quantity") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>

 
                                           

                                            <asp:TemplateField HeaderText="Delete">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkDel" runat="server" CommandName="Del" CommandArgument='<%# Eval("Equip_MasterId") %>' OnClientClick="return confirm('Are you sure you want to delete? '); aspnetForm.target ='_self'"><i class="fa fa-trash" style="color:red; font-size:1.5em;"></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>

