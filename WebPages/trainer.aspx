<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/PrivateMasterPage.master" AutoEventWireup="true" CodeFile="trainer.aspx.cs" Inherits="WebPages_trainer" %>

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
                        <asp:Label ID="Label10" runat="server" Text="TRAINER INFO" Font-Bold="true" Font-Size="Large"></asp:Label>
                    </div> 
                    </div>
          <div id="Add" runat="server" visible="false">
                        <div class="row">
                            <div class="col-md-10">
                            </div>
                            <div class="col-md-1">
                                <asp:Button ID="ButtonView1" runat="server" Text="View" Style="background-color:#49d0d5" Font-Bold="true" CssClass="btn-primary" CausesValidation="false" OnClick="ButtonView1_Click" />
                            </div>
                        </div>
         
        <br />
 <div class="row">
     
        <div class="col-md-3">
        </div>
        <div class="col-md-2 aligntext">
              <asp:Label ID="Label17" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label1" runat="server" Text="Trainer Name" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text=":" Font-Bold="true"></asp:Label>
        </div>
        <div class="col-md-5">
            <asp:TextBox ID="Texttrainername" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:requiredfieldvalidator id="RequiredFieldValidator3" runat="server" setfocusonerror="True" errormessage="Enter Name"
                controltovalidate="Texttrainername" causesvalidation="false"></asp:requiredfieldvalidator>
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
            <asp:Label ID="Label12" runat="server" Text="Trainer ID" Font-Bold="true"></asp:Label>
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
                                <asp:Label ID="Label14" runat="server" Text="DOB" Font-Bold="true"></asp:Label>
                                <asp:Label ID="Label15" runat="server" Text=":" Font-Bold="true"></asp:Label>
                            </div>

                            <div class="col-md-4">
                                <asp:TextBox ID="TextDOB" runat="server" CssClass="form-control" CausesValidation="false"></asp:TextBox>
                                

 <cc1:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="TextDOB" Format="dd/MM/yyyy" PopupButtonID="ImgStartDate">
                            </cc1:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" SetFocusOnError="True" ErrorMessage="Enter DOB "
                                    ControlToValidate="TextDOB" CausesValidation="false"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-1">
                            </div>
                        </div>
                        <br />
         <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-2 aligntext">
               <asp:Label ID="Label18" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label5" runat="server" Text="Mobile No" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label6" runat="server" Text=":"></asp:Label>
        </div>
        
        <div class="col-md-5">
            <asp:TextBox ID="TextMobile" runat="server" CssClass="form-control"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                                    FilterType="Numbers" ValidChars=" .'"
                                    TargetControlID="TextMobile">
                                </cc1:FilteredTextBoxExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" SetFocusOnError="True" ErrorMessage="Enter Mobile Number" ControlToValidate="TextMobile"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                    ControlToValidate="TextMobile" ErrorMessage="Enter Valid Mobile Number"
                                    ValidationExpression="[0-9]{10}" CausesValidation="false"></asp:RegularExpressionValidator>
        </div>
        <div class="col-md-2">
        </div>
    </div>
<br />
         <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-2 aligntext">
               <asp:Label ID="Label19" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label3" runat="server" Text="Email" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label4" runat="server" Text=":"></asp:Label>
        </div>
        
        <div class="col-md-5">
            <asp:TextBox ID="TextEmail" runat="server" CssClass="form-control"></asp:TextBox>
                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender19" runat="server"
                                    FilterType="Numbers,LowercaseLetters,Custom" ValidChars=".@"
                                    TargetControlID="TextEmail">
                                </cc1:FilteredTextBoxExtender>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextEmail"
                                    CssClass="LabelStyleRequired" ErrorMessage="Enter Valid Email Id" SetFocusOnError="True"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic">
                                </asp:RegularExpressionValidator>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" SetFocusOnError="True" ErrorMessage="Enter Email Id"
                                    ControlToValidate="TextEmail" CausesValidation="false"></asp:RequiredFieldValidator>

        </div>
        <div class="col-md-2">
        </div>
    </div>
<br />
         <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-2 aligntext">
               <asp:Label ID="Label20" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label7" runat="server" Text="Address" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label8" runat="server" Text=":"></asp:Label>
        </div>
        
        <div class="col-md-5">
            <asp:TextBox ID="TextAddress" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" SetFocusOnError="True" ErrorMessage="Enter Address"
                                    ControlToValidate="TextAddress" CausesValidation="false"  ></asp:RequiredFieldValidator>
        </div>
        <div class="col-md-2">
        </div>
    </div>
<br />
         <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-2 aligntext">
               <asp:Label ID="Label21" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label9" runat="server" Text="Type" Font-Bold="true"></asp:Label>
            <asp:Label ID="Label11" runat="server" Text=":"></asp:Label>
        </div>
        
        <div class="col-md-5">
           <%-- <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>--%>
            <%--<asp:RadioButtonList ID="RadioType" runat="server"CellSpacing="10" Width="50%" RepeatDirection="Horizontal" CausesValidation="false"> 
            <asp:ListItem>Part Time</asp:ListItem>
            <asp:ListItem>Full Time</asp:ListItem>
            </asp:RadioButtonList>--%>
               
            <asp:RadioButtonList ID="RadioType" runat="server" CellSpacing="10" Width="50%" RepeatDirection="Horizontal" CausesValidation="false">
                <asp:ListItem>Part Time</asp:ListItem>
                <asp:ListItem>Full Time</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" SetFocusOnError="True" ErrorMessage="Enter Type"
                                    ControlToValidate="RadioType" CausesValidation="false"  ></asp:RequiredFieldValidator>
        </div>
        <div class="col-md-2">
        </div>
    </div>
<br />

         <div class="row">
        <div class="col-md-5">
        </div>
        <div class="col-md-4">
            <asp:Button ID="ButtonEnter" runat="server" Text="Enter" style="background-color:#49d0d5" CssClass="btn-primary" Font-Bold="true" OnClick="ButtonEnter_Click"  />
             <asp:Button ID="ButtonReset"  runat="server" Text="Reset"  style="background-color:#49d0d5" CssClass="btn-primary" Font-Bold="true" OnClick="ButtonReset_Click" />

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
                                <asp:Label ID="Lblvwname" runat="server" Text="Name :" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="TxtName" runat="server" AutoComplete="off" Width="60%" CssClass="form-control Textbox"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server"
                                    FilterType="UpperCaseLetters,LowerCaseLetters,Custom" ValidChars=" .'"
                                    TargetControlID="TxtName">
                                </cc1:FilteredTextBoxExtender>
                            </div>

                            <div class="col-md-4">
                                <asp:Label ID="Lblvwmblno" runat="server" Text="Mobile Number :" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="Txtmblno" runat="server" AutoComplete="off" Width="60%" MaxLength="10" CssClass="form-control Textbox"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" runat="server"
                                    FilterType="Numbers" ValidChars=" .'"
                                    TargetControlID="Txtmblno">
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
                                    <asp:Label ID="lblExportHead" runat="server" Font-Bold="true" Text="TRAINER DETAILS"
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
                                                    <asp:LinkButton ID="lnkEdt" runat="server" CommandName="Edt" CommandArgument='<%# Eval("Trainer_MasterId") %>' OnClientClick="return confirm('Are you sure you want to Edit? '); aspnetForm.target ='_self'"><i class="fa fa-edit" style="color:#422f0f; font-size:1.5em;"></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGname" runat="server" Text='<%# Eval("Trainer_Name") %>' Style="word-break: break-all; word-wrap: break-word" Width="150px"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGID" runat="server" Text='<%# Eval("Trainer_ID") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                                </asp:TemplateField>
                                            
                                                <asp:TemplateField HeaderText="DOB">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblremarks" runat="server" Text='<%# Eval("DOB1") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>

                            

                                            <asp:TemplateField HeaderText="Mobile Number">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGContactNumber" runat="server" Text='<%# Eval("Trainer_Mobile") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>
                                                
                                             
                                            <asp:TemplateField HeaderText="Email Id">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGEmailId" runat="server" Text='<%# Eval("Trainer_Email") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>

                                       

                                            <asp:TemplateField HeaderText="Address">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGQualification" runat="server" Text='<%# Eval("Trainer_Address") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                            </asp:TemplateField>

                                            

                                            <asp:TemplateField HeaderText="Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGAddress" runat="server" Text='<%# Eval("Trainer_Type") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle />
                                                </asp:TemplateField>


                                            <asp:TemplateField HeaderText="Delete">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkDel" runat="server" CommandName="Del" CommandArgument='<%# Eval("Trainer_MasterId") %>' OnClientClick="return confirm('Are you sure you want to delete? '); aspnetForm.target ='_self'"><i class="fa fa-trash" style="color:red; font-size:1.5em;"></i></asp:LinkButton>
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
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>
