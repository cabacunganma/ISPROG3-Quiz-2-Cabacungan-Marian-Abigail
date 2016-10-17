<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Admin_Products_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title class="text-center">View Products #<asp:Literal ID="ltID" runat="server" />Details</title>
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Content/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1 class='text-center'>View Users #<asp:Literal ID="ltD2" runat="server" />
            Details </h1>
            <div class="col-lg-12">
            <div class="well clearfix">
                <form runat="server" class="form-horizontal">
                    <div class="col-lg-6">

                        <div class="form-group">
                                <label class="control-label col-lg-4">Name</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtName" runat="server"
                                        class="form-control" MaxLength="50" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-4">Category</label>
                                <div class="col-lg-8">
                                    <asp:DropDownList ID="ddlCategories" runat="server"
                                        CssClass="form-control" required>
                                        <asp:ListItem>Choose one...</asp:ListItem>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label col-lg-4">Code</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtCode" runat="server"
                                        class="form-control"
                                        MaxLength="10" required />
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label col-lg-4">Description</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtDesc" runat="server"
                                        class="form-control" TextMode="MultiLine"
                                        MaxLength="300" required />
                                </div>
                            </div>
                           
                            <div class="form-group">
                                <label class="control-label col-lg-4">Image</label>
                                <div class="col-lg-8">
                                    <asp:Image ID="imgProduct" runat="server" class="img-responsive" Width="200" /><br />
                                    <asp:FileUpload ID="fuImage" runat="server"
                                        class="form-control" required />
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="control-label col-lg-4">Price</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtPrice" runat="server"
                                        class="form-control" type="number"
                                        min="0.01" max="500000.00" step="0.01" required />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-lg-4">Is Featured?</label>
                                <div class="col-lg-8">
                                    <asp:DropDownList ID ="ddlFeatured" runat="server" CssClass="form-control">
                                        <asp:ListItem>Choose one...</asp:ListItem>
                                        <asp:ListItem>Yes</asp:ListItem>
                                        <asp:ListItem>No</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-6">
                        <div class="form-group">
                                <label class="control-label col-lg-4">Critical Level</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtCritical" runat="server"
                                        class="form-control" autocomplete="off"
                                        MaxLength="80" required />
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6">
                        <div class="form-group">
                                <label class="control-label col-lg-4">Maximum</label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtMax" runat="server"
                                        class="form-control" autocomplete="off"
                                        MaxLength="50" required />
                                </div>
                            </div>
                        </div>
                   <div class="col-lg-12">
                       <span class="pull-right">
                           <asp:Button ID="btnCancel" runat="server" class="btn btn-default" Text="Cancel"
                               PostBackUrl="~/Admin/Products/Default.aspx" formnovalidate />
                           <asp:Button ID="btnUpdate" runat="server" class="btn btn-success" Text="Update" OnClick="btnUpdate_Click"/>
                       </span>
                   </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
