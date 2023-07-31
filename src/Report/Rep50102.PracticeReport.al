report 50102 PracticeReport
{
    ApplicationArea = All;
    Caption = 'PracticeReport';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src\RDLC\PracticeReport.rdl';
    dataset
    {

        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            RequestFilterFields = "Sell-to Customer No.", "Order No.", "Order Date";

            column(SelltoCustomerName; "Sell-to Customer Name")
            {
            }
            column(Sell_to_Customer_No_; "Sell-to Customer No.") { }
            column(SelltoAddress; "Sell-to Address")
            {
            }
            column(OrderNo; "Order No.")
            {
            }
            column(OrderDate; "Order Date")
            {
            }
            column(CompName; CompInfo.Name)
            {

            }
            column(CompAddr; CompInfo.Address)
            {

            }
            column(CompImage; CompInfo.Picture)
            {


            }
            column(CompPhone; CompInfo."Phone No.")
            {

            }
            column(User_ID; "User ID")
            {

            }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");


                column("Inventory_No"; Itm.Inventory)
                {

                }


                column("Item_No"; "No.")
                {

                }
                column("Item_Description"; Description)
                {

                }
                column("Qty"; Quantity)
                {


                }
                column("Invoice_No"; "Document No.")
                {

                }
                column("Unit_Price"; "Unit Price")
                {

                }
                column("Total"; "Amount Including VAT")
                {

                }
                trigger OnAfterGetRecord()
                begin
                    if Itm.Get("No.") then
                        Itm.CalcFields(Inventory);
                end;

            }


            trigger OnPreDataItem()
            var
                filterText: Text;
            begin
                filterText := SalesInvoiceHeader.GetFilters();
                if CompInfo.Get() then
                    CompInfo.CalcFields(Picture);

            end;

        }

    }

    var
        CompInfo: Record "Company Information";
        Itm: Record "Item";
}
