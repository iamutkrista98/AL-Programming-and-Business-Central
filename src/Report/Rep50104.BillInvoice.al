report 50104 BillInvoice
{
    ApplicationArea = All;
    Caption = 'BillInvoice';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src/RDLC/BillInvoice.rdl';
    dataset
    {
        dataitem("PostedHeader"; "PostedBillingHeader")
        {
            column(No_; "No.")
            {

            }
            column(SelltoCustomer_PostedHeader; "Sell to Customer")
            {
            }
            column(Type_PostedHeader; "Type")
            {
            }
            column(UserID_PostedHeader; "User ID")
            {
            }
            column(CustomerName_PostedHeader; "Customer Name")
            {
            }
            column(TotalAmount_PostedHeader; "Total Amount")
            {
            }
            column(CompName; CompInfo.Name)
            {

            }
            column(CompAddr; CompInfo.Address) { }
            column(CompPhone; CompInfo."Phone No.") { }
            column(Picture; CompInfo.Picture) { }

            dataitem("PostedBillingLine"; PostedBillingLine)
            {
                DataItemLink = "Document No" = field("No.");
                DataItemLinkReference = PostedHeader;
                column(ItemNo_PostedBillingLine; "Item No")
                {
                }
                column(ItemDescription_PostedBillingLine; "Item Description")
                {
                }
                column(Qty_PostedBillingLine; Qty)
                {
                }
                column(UnitPrice_PostedBillingLine; "Unit Price")
                {
                }
                column(AmountAfterTax_PostedBillingLine; "Amount After Tax")
                {
                }

            }



            trigger OnPreDataItem()
            begin
                purchAndPay.Get();
                Tax := purchAndPay."Bill Tax%";
                CompInfo.Get();
                CompInfo.CalcFields(Picture);
            end;


        }

    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    var
        purchAndPay: Record "Purchases & Payables Setup";
        Tax: Decimal;
        CompInfo: Record "Company Information";
}
