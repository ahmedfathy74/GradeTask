<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="GradeTask.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 23px;
        margin-top: 8px;
    }
    </style>
    
    </head>
<body> 
   
      <form id="form1" runat="server">

        
    <div class="div-wrapper" style="position: relative; height:45px;">
         <img src="images/image1.png" style="width: 42px; height: 42px; -webkit-border-radius: 100%; border-radius: 100%; position: absolute; left: 0;"" />
        <span style="padding-left:50px; padding-top:50px; ">Grades</span>
         <img src="images/image2.png" style="width: 42px; height: 42px; -webkit-border-radius: 100%; border-radius: 100%; float:left;position: absolute; right:0;"  />
    </div>
          <%-- DataSourceID="SqlDataSource1" --%>

            <div>
        <asp:GridView ID="GridView1"
            AutoGenerateColumns="False"
            DataKeyNames="Grade" 
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
           OnPageIndexChanging="OnPageIndexChanging"
            AllowPaging="True"
            Width="100%"
            runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
               <%-- <asp:TemplateField HeaderText="Grade">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" OnCommand="LinkButton1_Click" CommandArgument='<%# Eval("Grade") %>' Text='<%# Eval("Grade") %>'
                             runat="server" Width="0"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>--%>
                        <asp:ButtonField Text="Select"  DataTextField="Grade"
                    HeaderText="Code"
                    CommandName="Select"/>
                                <asp:TemplateField HeaderText="Country" Visible="false">
                <ItemTemplate>
                    <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Grade") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
                 <asp:ButtonField Text="Select"  DataTextField="GradeName"
                    HeaderText="GradeName"
                    CommandName="Select"/>
              <%--  <asp:BoundField ItemStyle-Width="150px" DataField="GradeName" HeaderText="GradeName" SortExpression="GradeName" >
<ItemStyle Width="150px"></ItemStyle>
                </asp:BoundField>--%>
                <asp:BoundField DataField="GradeGroupName" HeaderText="GradeGroupName" SortExpression="GradeGroupName" >
                </asp:BoundField>
                <asp:BoundField DataField="GradeCons" HeaderText="GradeCons" SortExpression="GradeCons" >

                </asp:BoundField>
                <asp:BoundField DataField="GradeNameCons" HeaderText="GradeNameCons" SortExpression="GradeNameCons" >
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
              
                <asp:DropDownList ID="DropDownList4" runat="server" Height="27px" Width="118px">
                    <asp:ListItem Value="Grade">Code</asp:ListItem>
                    <asp:ListItem Value="GradeName">Grade</asp:ListItem>
                    <asp:ListItem Value="GradeGroupName">Grade Group</asp:ListItem>
                    <asp:ListItem Value="GradeCons">Consolidation Code</asp:ListItem>
                    <asp:ListItem Value="GradeNameCons">Consolidation Name</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList5" runat="server" Height="27px" Width="118px">
                    <asp:ListItem Value="=">equals</asp:ListItem>
                    <asp:ListItem Value="!=">not equals</asp:ListItem>
                    <asp:ListItem Value="&gt;">more than</asp:ListItem>
                    <asp:ListItem Value="&lt;">less than</asp:ListItem>
                    <asp:ListItem Value="like">Contains</asp:ListItem>
                    <asp:ListItem Value="IS NOT NULL">is blank</asp:ListItem>
                    <asp:ListItem Value="IS NULL">is null</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="TextBox19" runat="server" Height="22px" Width="137px"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Height="29px" Text="Search" Width="74px" />
                <br />
              
                </div>
        
          <asp:FormView ID="FormView1" runat="server"
              CssClass="auto-style2" DataKeyNames="Grade"
              DataSourceID="SqlDataSource1" 
              Width="100%"
              CellPadding="4" ForeColor="#333333" >
               <%--  OnItemUpdated="FormView1_ItemUpdated"
                OnItemDeleted="FormView1_ItemDeleted"--%>
              <EditItemTemplate>
                  <table class="auto-style1">
                      <tr>
                          <td class="auto-style53">
                              <asp:Label ID="Label1" runat="server" Text="Code"></asp:Label>
                          </td>
                          <td class="auto-style46">
                              <asp:TextBox ID="TextBox1" runat="server" Height="16px" Text='<%# Bind("Grade") %>' Width="70%"></asp:TextBox>
                              <asp:RequiredFieldValidator
                                ID="GradeValidation"
                                runat="server" ErrorMessage="Code Is Required"
                                ControlToValidate="TextBox1"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style53">Grade</td>
                          <td class="auto-style46">
                              <asp:TextBox ID="TextBox2" runat="server" Height="16px" Text='<%# Bind("GradeName") %>' Width="70%"></asp:TextBox>
                              <asp:RequiredFieldValidator
                                ID="GradeNameVaildation"
                                runat="server" ErrorMessage="Grade Name Is Required"
                                ControlToValidate="TextBox2"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style54">Grade Group</td>
                          <td class="auto-style30">
                              <asp:DropDownList ID="DropDownList1"
                                  runat="server"
                                  DataSourceID="SqlDataSource4" 
                                  DataTextField="GradeGroupName"
                                  DataValueField="GradeGroup" 
                                  Height="18px" 
                                  Width="73%"
                                  Enabled="True" S
                                  SelectedValue='<%# Bind("GradeGroup") %>' 
                                  AutoPostBack="True" 
                                  AppendDataBoundItems="true">
                                  <asp:ListItem Value="" Text="" />
                   </asp:DropDownList>
                              <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DNACloudDBConnectionString %>" SelectCommand="SELECT [GradeGroup], [GradeGroupName] FROM [GradeGroups]">
                              </asp:SqlDataSource>
                          </td>
                          <td class="auto-style50">Grade Year</td>
                          <td class="auto-style52">
                              <asp:TextBox ID="TextBox15" runat="server" Height="16px" Text='<%# Bind("GradeYears") %>' Width="70%"></asp:TextBox>
                              <asp:RequiredFieldValidator
                                ID="GradeYearVAlidation"
                                runat="server" ErrorMessage="Grade Year Is Required"
                                ControlToValidate="TextBox15"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style54">Step Amount</td>
                          <td class="auto-style30">
                              <asp:TextBox ID="TextBox3" runat="server" Height="16px" Text='<%# Bind("GradeStepAmount") %>' Width="70%"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                ID="StepAmountVaildation"
                                runat="server" ErrorMessage="Step Amount Is Required"
                                ControlToValidate="TextBox3"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                          <td class="auto-style50">Budget Salary</td>
                          <td class="auto-style52">
                              <asp:TextBox ID="TextBox14" runat="server" Height="16px" Text='<%# Bind("bsalary") %>' Width="70%"></asp:TextBox>
                              <asp:RequiredFieldValidator
                                ID="BudgetSalaryValidation"
                                runat="server" ErrorMessage="Budget Salary Is Required"
                                ControlToValidate="TextBox14"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style54">Order</td>
                          <td class="auto-style30">
                              <asp:TextBox ID="TextBox4" runat="server" Height="16px" Text='<%# Bind("GradeOrder") %>' Width="70%"></asp:TextBox>
                              <asp:RequiredFieldValidator
                                ID="OrderValidation"
                                runat="server" ErrorMessage="Order Is Required"
                                ControlToValidate="TextBox4"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                          <td class="auto-style50">Budget Count</td>
                          <td class="auto-style52">
                              <asp:TextBox ID="TextBox13" runat="server" Height="16px" Text='<%# Bind("bcount") %>' Width="70%"></asp:TextBox>
                               <asp:RequiredFieldValidator
                                ID="BudgetCountVaildation"
                                runat="server" ErrorMessage="Budget Count Is Required"
                                ControlToValidate="TextBox13"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style21">Consolidation Code</td>
                          <td class="auto-style22">
                              <asp:TextBox ID="TextBox7" runat="server" Height="16px" Text='<%# Bind("GradeCons") %>' Width="70%"></asp:TextBox>
                                  <asp:RequiredFieldValidator
                                ID="ConsolidationCodeValidation"
                                runat="server" ErrorMessage="Consolidation Code Is Required"
                                ControlToValidate="TextBox7"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                          <td class="auto-style39">Valid Form</td>
                          <td class="auto-style52">
                              <asp:TextBox ID="TextBox17" runat="server" Height="16px" Text='<%# Bind("GradeFromDate") %>' Width="70%" TextMode="Date"></asp:TextBox>
                               <asp:RequiredFieldValidator
                                ID="ValidFormValidation"
                                runat="server" ErrorMessage="Valid Form Is Required"
                                ControlToValidate="TextBox17"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                          <td class="auto-style24">TO:&nbsp; </td>
                          <td class="auto-style36">
                              <asp:TextBox ID="TextBox16" runat="server" Height="16px" Text='<%# Bind("GradeToDate") %>' Width="70%" TextMode="Date"></asp:TextBox>
                               <asp:RequiredFieldValidator
                                ID="TOValidation"
                                runat="server" ErrorMessage="Valid TO Is Required"
                                ControlToValidate="TextBox16"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style25">Consolidation Name</td>
                          <td class="auto-style26">
                              <asp:TextBox ID="TextBox5" runat="server" Height="16px" Text='<%# Bind("GradeNameCons") %>' Width="70%"></asp:TextBox>
                               <asp:RequiredFieldValidator
                                ID="ConsolidationNameValidation"
                                runat="server" ErrorMessage="Consolidation Name Is Required"
                                ControlToValidate="TextBox5"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style13">Year</td>
                          <td class="auto-style14">
                              <asp:TextBox ID="TextBox8" runat="server" Height="16px" Text='<%# Bind("GradesRYear") %>' Width="70%"></asp:TextBox>
                               <asp:RequiredFieldValidator
                                ID="YearValidation"
                                runat="server" ErrorMessage="Year Is Required"
                                ControlToValidate="TextBox8"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                          <td class="auto-style41">Number</td>
                          <td class="auto-style16">
                              <asp:TextBox ID="TextBox10" runat="server" Height="16px" Text='<%# Bind("GradesRNo") %>' Width="70%"></asp:TextBox>
                               <asp:RequiredFieldValidator
                                ID="NumberValidation"
                                runat="server" ErrorMessage="Number Is Required"
                                ControlToValidate="TextBox10"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style17">Issue Date</td>
                          <td class="auto-style30">
                              <asp:TextBox ID="TextBox9" runat="server" Height="16px" Text='<%# Bind("GradesRIssueDate") %>' Width="50%" TextMode="Date"></asp:TextBox>
                              <asp:RequiredFieldValidator
                                ID="IssueDateValidator1"
                                runat="server" ErrorMessage="Issue Date Is Required"
                                ControlToValidate="TextBox9"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                          <td class="auto-style42">Exec. date</td>
                          <td class="auto-style20">
                              <asp:TextBox ID="TextBox11" runat="server" Height="24px" Text='<%# Bind("GradesRExecDate") %>' Width="50%" TextMode="Date"></asp:TextBox>
                              <asp:RequiredFieldValidator
                                ID="ExecdateValidator1"
                                runat="server" ErrorMessage="Exec. date Is Required"
                                ControlToValidate="TextBox11"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style53">Status</td>
                          <td class="auto-style46">
                              <asp:DropDownList ID="DropDownList2" 
                                  runat="server" 
                                  Height="18px" 
                                  Width="73%"
                                  DataSourceID="SqlDataSource5" 
                                  DataTextField="edesc"
                                  DataValueField="itemno" 
                                  Enabled="True" 
                                  SelectedValue='<%# Bind("GradesRStatus") %>'
                                  AutoPostBack="True" 
                                  AppendDataBoundItems="true">
                                  <asp:ListItem Value="" Text="" />
                              </asp:DropDownList>
                              <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DNACloudDBConnectionString %>" SelectCommand="select itemno,edesc from NasArrays where arrayname like '%RStatus %' "></asp:SqlDataSource>
                          </td>
                          <td class="auto-style47">Source</td>
                          <td class="auto-style48">
                              <asp:DropDownList ID="DropDownList3" 
                                  runat="server" 
                                  Height="18px" 
                                  Width="73%" 
                                  DataSourceID="SqlDataSource6" 
                                  DataTextField="edesc" 
                                  DataValueField="itemno" 
                                  Enabled="True" 
                                  SelectedValue='<%# Bind("GradesRSource") %>' 
                                  AutoPostBack="True" 
                                  AppendDataBoundItems="true">
                                  <asp:ListItem Value="" Text="" />
                              </asp:DropDownList>
                              <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DNACloudDBConnectionString %>" SelectCommand="select itemno,edesc from NasArrays where arrayname ='Rsource' "></asp:SqlDataSource>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style54">Description</td>
                          <td class="auto-style30">
                              <asp:TextBox ID="TextBox18" runat="server" Height="47px" Text='<%# Bind("GradesRDesc") %>' Width="269%"></asp:TextBox>
                               <asp:RequiredFieldValidator
                                ID="DescriptionValidator1"
                                runat="server" ErrorMessage="Description Is Required"
                                ControlToValidate="TextBox18"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                      </tr>
                  </table>
                  <br />
                  <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                  &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
              </EditItemTemplate>
              <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
              <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
              <InsertItemTemplate>
                  <table class="auto-style1">
                      <tr>
                          <td class="auto-style53">
                              <asp:Label ID="Label1" runat="server" Text="Code"></asp:Label>
                          </td>
                          <td class="auto-style46">
                              <asp:TextBox ID="TextBox1" runat="server" Height="16px" Text='<%# Bind("Grade") %>' Width="70%"></asp:TextBox>
                              <asp:RequiredFieldValidator
                                ID="CodeValidator11"
                                runat="server" ErrorMessage="Code Is Required"
                                ControlToValidate="TextBox1"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style53">Grade</td>
                          <td class="auto-style46">
                              <asp:TextBox ID="TextBox2" runat="server" Height="16px" Text='<%# Bind("GradeName") %>' Width="70%"></asp:TextBox>
                              <asp:RequiredFieldValidator
                                ID="GradeValidator11"
                                runat="server" ErrorMessage="Grade Is Required"
                                ControlToValidate="TextBox2"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style54">Grade Group</td>
                          <td class="auto-style30">
                              <asp:DropDownList ID="DropDownList1" 
                                  runat="server" 
                                  DataSourceID="SqlDataSource4" 
                                  DataTextField="GradeGroupName" 
                                  DataValueField="GradeGroup" 
                                  Height="18px" 
                                  Width="73%" 
                                  Enabled="True" 
                                  SelectedValue='<%# Bind("GradeGroup") %>'
                                  AutoPostBack="True" 
                                  AppendDataBoundItems="true">
                                  <asp:ListItem Value="" Text="" />
                              </asp:DropDownList>
                              <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DNACloudDBConnectionString %>" SelectCommand="SELECT [GradeGroup], [GradeGroupName] FROM [GradeGroups]">
                              </asp:SqlDataSource>
                          </td>
                          <td class="auto-style50">Grade Year</td>
                          <td class="auto-style52">
                              <asp:TextBox ID="TextBox15" runat="server" Height="16px" Text='<%# Bind("GradeYears") %>' Width="70%"></asp:TextBox>
                               <asp:RequiredFieldValidator
                                ID="GradeYearValidator11"
                                runat="server" ErrorMessage="Grade Year Is Required"
                                ControlToValidate="TextBox15"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style54">Step Amount</td>
                          <td class="auto-style30">
                              <asp:TextBox ID="TextBox3" runat="server" Height="16px" Text='<%# Bind("GradeStepAmount") %>' Width="70%"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                ID="StepAmountValidator11"
                                runat="server" ErrorMessage="Step Amount Is Required"
                                ControlToValidate="TextBox3"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                          <td class="auto-style50">Budget Salary</td>
                          <td class="auto-style52">
                              <asp:TextBox ID="TextBox14" runat="server" Height="16px" Text='<%# Bind("bsalary") %>' Width="70%"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                ID="BudgetSalaryValidator11"
                                runat="server" ErrorMessage="Budget Salary Is Required"
                                ControlToValidate="TextBox14"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style54">Order</td>
                          <td class="auto-style30">
                              <asp:TextBox ID="TextBox4" runat="server" Height="16px" Text='<%# Bind("GradeOrder") %>' Width="70%"></asp:TextBox>
                              <asp:RequiredFieldValidator
                                ID="OrderValidator11"
                                runat="server" ErrorMessage="Order Is Required"
                                ControlToValidate="TextBox4"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                          <td class="auto-style50">Budget Count</td>
                          <td class="auto-style52">
                              <asp:TextBox ID="TextBox13" runat="server" Height="16px" Text='<%# Bind("bcount") %>' Width="70%"></asp:TextBox>
                                <asp:RequiredFieldValidator
                                ID="BudgetCountValidator11"
                                runat="server" ErrorMessage="Budget Count Is Required"
                                ControlToValidate="TextBox13"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style21">Consolidation Code</td>
                          <td class="auto-style22">
                              <asp:TextBox ID="TextBox7" runat="server" Height="16px" Text='<%# Bind("GradeCons") %>' Width="70%"></asp:TextBox>
                               <asp:RequiredFieldValidator
                                ID="ConsolidationCodeValidator11"
                                runat="server" ErrorMessage="Consolidation Code Is Required"
                                ControlToValidate="TextBox7"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                          <td class="auto-style39">Valid Form</td>
                          <td class="auto-style52">
                              <asp:TextBox ID="TextBox17" runat="server" Height="16px" Text='<%# Bind("GradeFromDate") %>' Width="70%" TextMode="Date"></asp:TextBox>
                              <asp:RequiredFieldValidator
                                ID="ValidFormValidator11"
                                runat="server" ErrorMessage="Valid Form Is Required"
                                ControlToValidate="TextBox17"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                          <td class="auto-style24">TO:&nbsp; </td>
                          <td class="auto-style36">
                              <asp:TextBox ID="TextBox16" runat="server" Height="16px" Text='<%# Bind("GradeToDate") %>' Width="70%" TextMode="Date"></asp:TextBox>
                               <asp:RequiredFieldValidator
                                ID="TOValidator11"
                                runat="server" ErrorMessage="Valid TO Is Required"
                                ControlToValidate="TextBox16"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style25">Consolidation Name</td>
                          <td class="auto-style26">
                              <asp:TextBox ID="TextBox5" runat="server" Height="16px" Text='<%# Bind("GradeNameCons") %>' Width="70%"></asp:TextBox>
                              <asp:RequiredFieldValidator
                                ID="ConsolidationNameValidator11"
                                runat="server" ErrorMessage="Consolidation Name Is Required"
                                ControlToValidate="TextBox5"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style13">Year</td>
                          <td class="auto-style14">
                              <asp:TextBox ID="TextBox8" runat="server" Height="16px" Text='<%# Bind("GradesRYear") %>' Width="70%"></asp:TextBox>
                               <asp:RequiredFieldValidator
                                ID="YearValidator1"
                                runat="server" ErrorMessage="Year Is Required"
                                ControlToValidate="TextBox8"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                          <td class="auto-style41">Number</td>
                          <td class="auto-style16">
                              <asp:TextBox ID="TextBox10" runat="server" Height="16px" Text='<%# Bind("GradesRNo") %>' Width="70%"></asp:TextBox>
                              <asp:RequiredFieldValidator
                                ID="NumberValidator1"
                                runat="server" ErrorMessage="Number Is Required"
                                ControlToValidate="TextBox10"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style17">Issue Date</td>
                          <td class="auto-style30">
                              <asp:TextBox ID="TextBox9" runat="server" Height="16px" Text='<%# Bind("GradesRIssueDate") %>' Width="50%" TextMode="Date"></asp:TextBox>
                               <asp:RequiredFieldValidator
                                ID="IssueDateValidator1"
                                runat="server" ErrorMessage="Issue Date Is Required"
                                ControlToValidate="TextBox9"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                          <td class="auto-style42">Exec. date</td>
                          <td class="auto-style20">
                              <asp:TextBox ID="TextBox11" runat="server" Height="24px" Text='<%# Bind("GradesRExecDate") %>' Width="50%" TextMode="Date"></asp:TextBox>
                               <asp:RequiredFieldValidator
                                ID="ExecdateValidator1"
                                runat="server" ErrorMessage="Exec. date Is Required"
                                ControlToValidate="TextBox11"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style53">Status</td>
                          <td class="auto-style46">
                              <asp:DropDownList ID="DropDownList2" 
                                  runat="server" 
                                  Height="18px" 
                                  Width="73%" 
                                  DataSourceID="SqlDataSource5" 
                                  DataTextField="edesc" 
                                  DataValueField="itemno" 
                                  Enabled="True" 
                                  SelectedValue='<%# Bind("GradesRStatus") %>' 
                                  AutoPostBack="True" 
                                  AppendDataBoundItems="true">
                                  <asp:ListItem Value="" Text="" />
                              </asp:DropDownList>
                              <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DNACloudDBConnectionString %>" SelectCommand="select itemno,edesc from NasArrays where arrayname like '%RStatus %' "></asp:SqlDataSource>
                          </td>
                          <td class="auto-style47">Source</td>
                          <td class="auto-style48">
                              <asp:DropDownList ID="DropDownList3" 
                                  runat="server" 
                                  Height="18px" 
                                  Width="73%" 
                                  DataSourceID="SqlDataSource6"
                                  DataTextField="edesc" 
                                  DataValueField="itemno" 
                                  Enabled="True" 
                                  SelectedValue='<%# Bind("GradesRSource") %>'
                                   AutoPostBack="True" 
                                  AppendDataBoundItems="true">
                                  <asp:ListItem Value="" Text="" />
                              </asp:DropDownList>
                              <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DNACloudDBConnectionString %>" SelectCommand="select itemno,edesc from NasArrays where arrayname ='Rsource' "></asp:SqlDataSource>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style54">Description</td>
                          <td class="auto-style30">
                              <asp:TextBox ID="TextBox18" runat="server" Height="47px" Text='<%# Bind("GradesRDesc") %>' Width="269%"></asp:TextBox>
                              <asp:RequiredFieldValidator
                                ID="DescriptionValidator1"
                                runat="server" ErrorMessage="Description Is Required"
                                ControlToValidate="TextBox18"
                                ForeColor="Red"></asp:RequiredFieldValidator>
                      </tr>
                  </table>
                  <br />
                  <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                  &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
              </InsertItemTemplate>
              <ItemTemplate>
                  <table class="auto-style1">
                      <tr>
                          <td class="auto-style53">
                              <asp:Label ID="Label1" runat="server" Text="Code"></asp:Label>
                          </td>
                          <td class="auto-style46">
                              <asp:TextBox ID="TextBox1" runat="server" Height="16px" ReadOnly="True" Text='<%# Bind("Grade") %>' Width="70%"></asp:TextBox>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style53">Grade</td>
                          <td class="auto-style46">
                              <asp:TextBox ID="TextBox2" runat="server" Height="16px" ReadOnly="True" Text='<%# Bind("GradeName") %>' Width="70%"></asp:TextBox>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style54">Grade Group</td>
                          <td class="auto-style30">
                              <asp:DropDownList ID="DropDownList1" 
                                  runat="server" 
                                  DataSourceID="SqlDataSource4" 
                                  DataTextField="GradeGroupName" 
                                  DataValueField="GradeGroup" 
                                  Height="18px" 
                                  Width="73%" 
                                  Enabled="False" 
                                  SelectedValue='<%# Bind("GradeGroup") %>'
                                   AutoPostBack="True" 
                                  AppendDataBoundItems="true">
                                  <asp:ListItem Value="" Text="" />
                              </asp:DropDownList>
                              <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DNACloudDBConnectionString %>" SelectCommand="SELECT [GradeGroup], [GradeGroupName] FROM [GradeGroups]">
                              </asp:SqlDataSource>
                          </td>
                          <td class="auto-style50">Grade Year</td>
                          <td class="auto-style52">
                              <asp:TextBox ID="TextBox15" runat="server" Height="16px" ReadOnly="True" Text='<%# Bind("GradeYears") %>' Width="70%"></asp:TextBox>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style54">Step Amount</td>
                          <td class="auto-style30">
                              <asp:TextBox ID="TextBox3" runat="server" Height="16px" ReadOnly="True" Text='<%# Bind("GradeStepAmount") %>' Width="70%"></asp:TextBox>
                          </td>
                          <td class="auto-style50">Budget Salary</td>
                          <td class="auto-style52">
                              <asp:TextBox ID="TextBox14" runat="server" Height="16px" ReadOnly="True" Text='<%# Bind("bsalary") %>' Width="70%"></asp:TextBox>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style54">Order</td>
                          <td class="auto-style30">
                              <asp:TextBox ID="TextBox4" runat="server" Height="16px" ReadOnly="True" Text='<%# Bind("GradeOrder") %>' Width="70%"></asp:TextBox>
                          </td>
                          <td class="auto-style50">Budget Count</td>
                          <td class="auto-style52">
                              <asp:TextBox ID="TextBox13" runat="server" Height="16px" ReadOnly="True" Text='<%# Bind("bcount") %>' Width="70%"></asp:TextBox>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style21">Consolidation Code</td>
                          <td class="auto-style22">
                              <asp:TextBox ID="TextBox7" runat="server" Height="16px" ReadOnly="True" Text='<%# Bind("GradeCons") %>' Width="70%"></asp:TextBox>
                          </td>
                          <td class="auto-style39">Valid Form</td>
                          <td class="auto-style52">
                              <asp:TextBox ID="TextBox17" runat="server" Height="16px" ReadOnly="True" Text='<%# Bind("GradeFromDate") %>' Width="70%"></asp:TextBox>
                          </td>
                          <td class="auto-style24">TO:&nbsp; </td>
                          <td class="auto-style36">
                              <asp:TextBox ID="TextBox16" runat="server" Height="16px" ReadOnly="True" Text='<%# Bind("GradeToDate") %>' Width="70%"></asp:TextBox>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style25">Consolidation Name</td>
                          <td class="auto-style26">
                              <asp:TextBox ID="TextBox5" runat="server" Height="16px" ReadOnly="True" Text='<%# Bind("GradeNameCons") %>' Width="70%"></asp:TextBox>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style13">Year</td>
                          <td class="auto-style14">
                              <asp:TextBox ID="TextBox8" runat="server" Height="16px" ReadOnly="True" Text='<%# Bind("GradesRYear") %>' Width="70%" ></asp:TextBox>
                          </td>
                          <td class="auto-style41">Number</td>
                          <td class="auto-style16">
                              <asp:TextBox ID="TextBox10" runat="server" Height="16px" ReadOnly="True" Text='<%# Bind("GradesRNo") %>' Width="70%"></asp:TextBox>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style17">Issue Date</td>
                          <td class="auto-style30">
                              <asp:TextBox ID="TextBox9" runat="server" Height="16px" ReadOnly="True" Text='<%# Bind("GradesRIssueDate") %>' Width="50%"></asp:TextBox>
                          </td>
                          <td class="auto-style42">Exec. date</td>
                          <td class="auto-style20">
                              <asp:TextBox ID="TextBox11" runat="server" Height="24px" ReadOnly="True" Text='<%# Bind("GradesRExecDate") %>' Width="50%"></asp:TextBox>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style53">Status</td>
                          <td class="auto-style46">
                              <asp:DropDownList ID="DropDownList2" 
                                  runat="server" 
                                  Height="18px" 
                                  Width="73%" 
                                  DataSourceID="SqlDataSource5" 
                                  DataTextField="edesc"
                                  DataValueField="itemno" 
                                  Enabled="False" 
                                  SelectedValue='<%# Bind("GradesRStatus") %>'
                                  AutoPostBack="True" 
                                  AppendDataBoundItems="true">
                                  <asp:ListItem Value="" Text="" />
                              </asp:DropDownList>
                              <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DNACloudDBConnectionString %>" SelectCommand="select itemno,edesc from NasArrays where arrayname like '%RStatus %' "></asp:SqlDataSource>
                          </td>
                          <td class="auto-style47">Source</td>
                          <td class="auto-style48">
                              <asp:DropDownList ID="DropDownList3"
                                  runat="server" 
                                  Height="18px"
                                  Width="73%" 
                                  DataSourceID="SqlDataSource6" 
                                  DataTextField="edesc" 
                                  DataValueField="itemno" 
                                  Enabled="False" 
                                  SelectedValue='<%# Bind("GradesRSource") %>'
                                   AutoPostBack="True" 
                                  AppendDataBoundItems="true">
                                  <asp:ListItem Value="" Text="" />
                              </asp:DropDownList>
                              <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:DNACloudDBConnectionString %>" SelectCommand="select itemno,edesc from NasArrays where arrayname ='Rsource' "></asp:SqlDataSource>
                          </td>
                      </tr>
                      <tr>
                          <td class="auto-style54">Description</td>
                          <td class="auto-style30">
                              <asp:TextBox ID="TextBox18" runat="server" Height="47px" ReadOnly="True" Text='<%# Bind("GradesRDesc") %>' Width="269%"></asp:TextBox>
                          </td>
                      </tr>
                  </table>
                  <br />
                  <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                  &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                  &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
              </ItemTemplate>
              <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
              <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
          </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DNACloudDBConnectionString %>" SelectCommand="
                    select Grade,GradeName,GradeGroupName,GradeCons,GradeNameCons
                    from Grades G
                    left join GradeGroups GG 
                    on G.GradeGroup = GG.GradeGroup;">
                </asp:SqlDataSource>
          <asp:SqlDataSource ID="SqlDataSource1"
              DeleteCommand="DELETE FROM [Grades] WHERE [Grade] = @Grade"

              InsertCommand="INSERT INTO [Grades] ([Grade], [GradeName], [GradeGroup],
              [GradeOrder], [GradeYears], [GradeStepAmount], [bsalary], [GradeCons], 
              [GradeNameCons], [bcount], [GradeFromDate], [GradeToDate], [GradesRDesc], 
              [GradesRSource], [GradesRStatus], [GradesRExecDate], [GradesRIssueDate], 
              [GradesRNo], [GradesRYear]) 
              VALUES (@Grade, @GradeName, @GradeGroup, @GradeOrder,
              @GradeYears, @GradeStepAmount, @bsalary, @GradeCons, @GradeNameCons, @bcount,
              @GradeFromDate, @GradeToDate, @GradesRDesc, @GradesRSource, @GradesRStatus, 
              @GradesRExecDate, @GradesRIssueDate, @GradesRNo, @GradesRYear);
              SELECT @GradeID = SCOPE_IDENTITY()"

              SelectCommand="SELECT [Grade], [GradeName], [GradeGroup], [GradeOrder],
              [GradeYears], [GradeStepAmount], [bsalary], [GradeCons], [GradeNameCons], 
              [bcount], [GradeFromDate], [GradeToDate], [GradesRDesc], [GradesRSource], 
              [GradesRStatus], [GradesRExecDate], [GradesRIssueDate], [GradesRNo], 
              [GradesRYear] FROM [Grades] WHERE [Grade] = @GradeID"

              UpdateCommand="UPDATE [Grades] SET [GradeName] = @GradeName, [GradeGroup] = @GradeGroup,
              [GradeOrder] = @GradeOrder, [GradeYears] = @GradeYears, [GradeStepAmount] = @GradeStepAmount, 
              [bsalary] = @bsalary, [GradeCons] = @GradeCons, [GradeNameCons] = @GradeNameCons, 
              [bcount] = @bcount, [GradeFromDate] = @GradeFromDate, [GradeToDate] = @GradeToDate, 
              [GradesRDesc] = @GradesRDesc, [GradesRSource] = @GradesRSource, [GradesRStatus] = @GradesRStatus,
              [GradesRExecDate] = @GradesRExecDate, [GradesRIssueDate] = @GradesRIssueDate, 
              [GradesRNo] = @GradesRNo, [GradesRYear] = @GradesRYear WHERE [Grade] = @Grade"
              ConnectionString="<%$ ConnectionStrings:DNACloudDBConnectionString %>"
              OnInserted="SqlDataSource1_OnInserted"
              runat="server">
              <SelectParameters>
                <asp:Parameter Name="GradeID" Type="Int32" DefaultValue="1" />
                </SelectParameters>
              <DeleteParameters>
                  <asp:Parameter Name="Grade" Type="Int16" />
              </DeleteParameters>
              <InsertParameters>
                  <asp:Parameter Name="GradeID" Direction="Output" Type="Int16" />
                <%--  <asp:Parameter Name="Grade" Type="Int16" />--%>
                  <asp:Parameter Name="GradeName" Type="String" />
                  <asp:Parameter Name="GradeGroup" Type="Int16" />
                  <asp:Parameter Name="GradeOrder" Type="Int16" />
                  <asp:Parameter Name="GradeYears" Type="Int16" />
                  <asp:Parameter Name="GradeStepAmount" Type="Decimal" />
                  <asp:Parameter Name="bsalary" Type="Decimal" />
                  <asp:Parameter Name="GradeCons" Type="Int32" />
                  <asp:Parameter Name="GradeNameCons" Type="String" />
                  <asp:Parameter Name="bcount" Type="Int16" />
                  <asp:Parameter Name="GradeFromDate" Type="DateTime" />
                  <asp:Parameter Name="GradeToDate" Type="DateTime" />
                  <asp:Parameter Name="GradesRDesc" Type="String" />
                  <asp:Parameter Name="GradesRSource" Type="Int16" />
                  <asp:Parameter Name="GradesRStatus" Type="Int16" />
                  <asp:Parameter Name="GradesRExecDate" Type="DateTime" />
                  <asp:Parameter Name="GradesRIssueDate" Type="DateTime" />
                  <asp:Parameter Name="GradesRNo" Type="String" />
                  <asp:Parameter Name="GradesRYear" Type="Int16" />
              </InsertParameters>
              <UpdateParameters>
                  <asp:Parameter Name="GradeName" Type="String" />
                  <asp:Parameter Name="GradeGroup" Type="Int16" />
                  <asp:Parameter Name="GradeOrder" Type="Int16" />
                  <asp:Parameter Name="GradeYears" Type="Int16" />
                  <asp:Parameter Name="GradeStepAmount" Type="Decimal" />
                  <asp:Parameter Name="bsalary" Type="Decimal" />
                  <asp:Parameter Name="GradeCons" Type="Int32" />
                  <asp:Parameter Name="GradeNameCons" Type="String" />
                  <asp:Parameter Name="bcount" Type="Int16" />
                  <asp:Parameter Name="GradeFromDate" Type="DateTime" />
                  <asp:Parameter Name="GradeToDate" Type="DateTime" />
                  <asp:Parameter Name="GradesRDesc" Type="String" />
                  <asp:Parameter Name="GradesRSource" Type="Int16" />
                  <asp:Parameter Name="GradesRStatus" Type="Int16" />
                  <asp:Parameter Name="GradesRExecDate" Type="DateTime" />
                  <asp:Parameter Name="GradesRIssueDate" Type="DateTime" />
                  <asp:Parameter Name="GradesRNo" Type="String" />
                  <asp:Parameter Name="GradesRYear" Type="Int16" />
                  <asp:Parameter Name="Grade" Type="Int16" />
              </UpdateParameters>
          </asp:SqlDataSource>
        
    </form>
      
</body>

</html>

